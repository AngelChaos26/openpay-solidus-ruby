Conekta::Requestor.class_eval do
    private

    def set_headers_for(connection)
      connection.headers['Content-Type'] = 'application/json'
      #connection.headers['X-Conekta-Client-User-Agent'] = conekta_headers.to_json
      #connection.headers['User-Agent'] = 'Conekta/v1 RubyBindings/' + Conekta::VERSION
      #connection.headers['Accept'] = "application/vnd.conekta-v#{Conekta.api_version}+json"
      #connection.headers['Accept-Language'] = Conekta.locale.to_s
      connection.headers['Authorization'] = "Basic #{ Base64.strict_encode64("#{self.api_key}" + ':')}"
      return connection
    end
end