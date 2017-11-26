Conekta::Customer.class_eval do
    attr_accessor :last_name, :phone_number
    
    def initialize(id=nil)
      @id = id
      #@payment_sources ||= List.new("PaymentSource", {})
      #@shipping_contacts ||= List.new("ShippingContacts", {})
      super(id)
    end

    def load_from(response=nil)
      if response
        super
      end

      customer = self

      if Conekta.api_version == "2.0.0"
        #submodels = [:payment_sources, :shipping_contacts]
        #create_submodels_lists(customer, submodels)
      else
        #submodels = [:cards]

        #submodels.each do |submodel|
        #  self.send(submodel).each do |k,v|
        #    if !v.respond_to? :deleted or !v.deleted
        #      v.create_attr('customer', customer)

        #      self.send(submodel).set_val(k,v)
        #    end
        #  end
        #end
      end

      if self.respond_to? :subscription and self.subscription
         self.subscription.create_attr('customer', customer)
      end
    end
end