module Spree
  CheckoutController.class_eval do
    before_action :add_device_session, only: :update
    
    def add_device_session
      unless @order.completed?
        if params[:deviceIdHiddenFieldName].present?
          @order.update(:device_session_id=>params[:deviceIdHiddenFieldName])
        end  
      end
    end
  end
end