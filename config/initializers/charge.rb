Conekta::Charge.class_eval do
    include Conekta::Operations::CreateMember
    
    attr_accessor :source_id, :amount, :method, :currency, :description,
                  :order_id, :device_session_id, :customer

    def initialize(id=nil)
      @id = id
      @customer ||= List.new("Customer", {})
      super(id)
    end

    def load_from(response = nil)
      if response
        super
      end

      charge     = self
      submodels = [:customer]
      create_submodels_lists(charge, submodels)
    end
    
    #Attribute accessors
    def create_customer(params)
      self.create_member_with_relation('customer', params, self)
    end
		#State transitions
    def authorize_capture(params={})
      custom_action(:post, 'capture', params)
    end

    def void(params={})
      custom_action(:post, 'void', params)
    end

    def refund(params={})
      custom_action(:post, 'refund', params)
    end

    private

    def create_submodels_lists(order, submodels)
      submodels.each do |submodel|
        self.send(submodel).each do |k, v|
          v.create_attr('charge', order)

          self.send(submodel).set_val(k,v)
        end if self.respond_to?(submodel) && !self.send(submodel).nil?
      end
    end
end