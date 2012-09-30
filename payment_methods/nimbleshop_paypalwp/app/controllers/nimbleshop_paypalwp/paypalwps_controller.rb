module NimbleshopPaypalwp

  # Following line makes it possible to use this gem without nimbleshop_core
  klass = defined?(::Admin::PaymentMethodsController) ? ::Admin::PaymentMethodsController : ActionController::Base

  class PaypalwpsController < klass

    protect_from_forgery except: :notify

    before_filter :load_payment_method, except: :notify

    def notify
      processor = NimbleshopPaypalwp::Processor.new(raw_post: request.raw_post)
      order = processor.order

      # order is already in purchased state. Seems like IPN is sending duplicate notification
      render nothing: true if order.purchased?

      if PostbackValidation.new(params, order).valid?
        processor.order.update_attributes(payment_method: NimbleshopPaypalwp::Paypalwp.first)
        processor.purchase
      else
        Rails.logger.info "IPN notification is not valid. Params is #{params.inspect}"
      end

      render nothing: true
    end

    def update
      respond_to do |format|
        if @payment_method.update_attributes(post_params[:paypalwp])
          format.js  {
            flash[:notice] = 'Paypal record was successfully updated'
            render js: "window.location = '/admin/payment_methods'"
          }
        else
          msg =  @payment_method.errors.full_messages.first
          error =  %Q[alert("#{msg}")]
          format.js { render js: error }
        end
      end
    end

    def destroy
      respond_to do |format|
        if @payment_method.destroy
          format.js {
            flash[:notice] = 'Paypal record was successfully deleted'
            render js: "window.location = '/admin/payment_methods'"
          }
        else
          format.js { render js: 'Paypal record could not be deleted. Please try again later.' }
        end
      end
    end

    private

    def post_params
      params.permit(paypalwp: [:merchant_email, :mode])
    end

    def load_payment_method
      @payment_method = NimbleshopPaypalwp::Paypalwp.first
    end

  end
end
