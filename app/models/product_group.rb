class ProductGroup < ActiveRecord::Base

  serialize :condition

  validates :name, presence: true

  before_create :set_permalink

  liquid_methods :name

  # determines if the given product exists in the product group
  def exists?(product)
    products.include?(product)
  end

  def url
    "/product_groups/#{self.permalink}"
  end

  def products
    Product.search(condition)
  end

  def custom_field_object
    CustomField.find(condition.keys.first.gsub(/q/,''))
  end

  # list of all product groups containing input product
  def self.contains_product(product)
    self.all.select do |pg|
      pg.exists?(product)
    end
  end

  def condition_in_english
    value = condition.values.first
    output = if Array === value
      value.map { |v| _process_cie(v) }.join(' and ')
    else
      _process_cie(value)
    end
    output.capitalize
  end

  def _process_cie(value)
    result = [custom_field_object.name]
    op = value.values_at(:op).first
    case op
    when 'eq'
      result << "equals"
    when 'contains'
      result << "contains"
    when 'starts'
      result << "starts with"
    when 'ends'
      result << "ends with"
    when 'gt'
      result << ">"
    when 'lt'
      result << "<"
    when 'lteq'
      result << "<="
    when 'gteq'
      result << ">="
    else
      result << op
    end

    v = value.values_at(:v).first
    result << ((custom_field_object.field_type == 'number') ? v : "'#{v}'")
    result.join(' ')
  end

  private

  # TODO move this to a separate gem
  def set_permalink
    permalink = self.name.parameterize
    counter = 2

    while self.class.exists?(permalink: permalink) do
      permalink = "#{permalink}-#{counter}"
      counter = counter + 1
    end

    self.permalink ||= permalink
  end

end