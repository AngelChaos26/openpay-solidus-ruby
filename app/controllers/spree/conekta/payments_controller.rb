Spree::Conekta::PaymentsController.class_eval do
    before_action :test 
    
    def create
      PaymentNotificationHandler.new(params).perform_action if params['type'] == 'charge.paid'
      render nothing: true
    end
    
    def test
        binding.pry
        puts "Test Payment"
    end
end