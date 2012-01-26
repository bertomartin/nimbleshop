class Admin::Paymentmethod::AuthorizedotnetsController < Admin::PaymentMethodsController

  def show
    @payment_method = PaymentMethod.find_by_permalink('authorize-net')
  end

  def edit
    @payment_method = PaymentMethod.find_by_permalink('authorize-net')
  end

  def update
    @payment_method = PaymentMethod.find_by_permalink('authorize-net')
    @payment_method.authorize_net_login_id = params[:authorize_net_login_id]
    @payment_method.authorize_net_transaction_key = params[:authorize_net_transaction_key]
    @payment_method.authorize_net_company_name_on_creditcard_statement = params[:authorize_net_company_name_on_creditcard_statement]
    @payment_method.save!
    redirect_to admin_paymentmethod_authorizedotnet_path, notice: 'Successfuly updated'
  end

end
