class Admin::PaymentMethodsController < AdminController

  before_filter :load_payment_methods

  layout 'payment_method'

  def index
    respond_to do |format|
      format.html do

        if PaymentMethod.count == 0
          flash.now[:error] = 'You have not setup any payment method. User wil not be able to make payment'
        end
        render layout: 'payment_method'

      end
    end
  end

  private

  def load_payment_methods
    @payment_methods = PaymentMethod.order('id asc')
  end

end
