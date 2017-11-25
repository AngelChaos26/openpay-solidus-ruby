class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def costumer_conekta
    customer = Conekta::Customer.create({
    :name => 'Waldo',
    :email => 'waldo@conekta.com',
    :phone => '+52181818181',
    :payment_sources => [{
      :type => 'card',
      :token_id => 'tok_test_visa_4242'
      }]
    })
  end
  
  def order_conekta
    begin
    order = Conekta::Order.create({
    :line_items => [{
        :name => "Openpay",
        :unit_price => 3000,
        :quantity => 12
    }], #line_items
    :shipping_lines => [{
        :amount => 1500,
        :carrier => "FEDEX"
    }], #shipping_lines - physical goods only
    :currency => "MXN",
    :customer_info => {
        :customer_id => "cus_2hc6fz3zHJQhPjJhi"
    }, #customer_info
    :shipping_contact => {
        :address => {
            :street1 => "Calle 123, int 2",
            :postal_code => "06100",
            :country => "MX"
        }
    }, #shipping_contact - required only for physical goods
    :charges => [{
        :payment_method => {
            :type => "default"
        } #payment_method - use the customer's <code>default</code> - a card
    }],
    :metadata => {"reference" => "12987324097", "more_info" => "lalalalala"}
    })
    
    puts "ID: #{order.id}"
    puts "Status: #{order.payment_status}"
    puts "$ #{(order.amount/100).to_f} #{order.currency}"
    puts "Order"
    puts "#{order.line_items[0].quantity}
      - #{order.line_items[0].name}
      - $ #{(order.line_items[0].unit_price/100).to_f}"
    puts "Payment info"
    puts "CODE: #{order.charges[0].payment_method.auth_code}"
    puts "Card info:
      - #{order.charges[0].payment_method.name}
      - <strong><strong>#{order.charges[0].payment_method.last4}
      - #{order.charges[0].payment_method.brand}
      - #{order.charges[0].payment_method.type}"
    rescue Conekta::ErrorList => error_list
      for error_detail in error_list.details do
        puts error_detail.message
      end
    end
	end
end
