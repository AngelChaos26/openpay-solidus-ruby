Conekta::Error.class_eval do
    attr_reader :category, :description, :http_code, :error_code, :request_id, :fraud_rules
    
    def initialize(options={})
      @category = options["category"]
      @error_code = options["error_code"]
      @request_id = options["request_id"]
      #if options["details"]
        #@details = options["details"].collect{|details|
          #Conekta::ErrorDetails.new(details)
        #}
      #else
        #temp_details = Conekta::ErrorDetails.new({
        #    "message" => options["message_to_purchaser"],
        #    "debug_message" => options["description"],
        #    "param" => options["param"]
        #  })
        #@details = [temp_details]
      #end
      @message = options["description"]
      @fraud_rules = options["fraud_rules"]

      super
    end
end