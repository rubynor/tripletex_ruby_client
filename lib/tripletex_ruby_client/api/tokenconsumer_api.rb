=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'uri'

module TripletexRubyClient
  class TokenconsumerApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Get consumer token by token string.
    # 
    # @param token Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [ResponseWrapperConsumerToken]
    def get_by_token(token, opts = {})
      data, _status_code, _headers = get_by_token_with_http_info(token, opts)
      data
    end

    # Get consumer token by token string.
    # 
    # @param token Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ResponseWrapperConsumerToken, Fixnum, Hash)>] ResponseWrapperConsumerToken data, response status code and response headers
    def get_by_token_with_http_info(token, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TokenconsumerApi.get_by_token ...'
      end
      # verify the required parameter 'token' is set
      if @api_client.config.client_side_validation && token.nil?
        fail ArgumentError, "Missing the required parameter 'token' when calling TokenconsumerApi.get_by_token"
      end
      # resource path
      local_var_path = '/token/consumer/byToken'

      # query parameters
      query_params = {}
      query_params[:'token'] = token
      query_params[:'fields'] = opts[:'fields'] if !opts[:'fields'].nil?

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ResponseWrapperConsumerToken')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TokenconsumerApi#get_by_token\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
