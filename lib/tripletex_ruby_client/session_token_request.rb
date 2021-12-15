module TripletexRubyClient
  class SessionTokenRequest < OpenStruct

    def session
      @session ||= create
    end

    def create
      uri = URI.parse(session_url)
      Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https', verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
        http.open_timeout = 5
        http.read_timeout = 5
        response          = http.put(uri.request_uri, nil)
        # binding.pry
        @session          = JSON.parse(response.body)
        raise "Failed to get Tripletex token #{@session['message']} #{@session['validationMessages']}" unless session_token
        @session
      end
    end

    def session_token
      session.dig('value', 'token')
    end

    def session_url
      "#{base_url}/token/session/:create?consumerToken=#{consumer_token}&employeeToken=#{employee_token}&expirationDate=#{expiration_date}"
    end
  end
end
