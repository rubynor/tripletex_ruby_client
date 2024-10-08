=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'uri'

module TripletexRubyClient
  class VatReturnscommentApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # [BETA] - Get all structured comments available
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :from From index (default to 0)
    # @option opts [Integer] :count Number of elements to return (default to 1000)
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [ListResponseVatReturnsComment]
    def all(opts = {})
      data, _status_code, _headers = all_with_http_info(opts)
      data
    end

    # [BETA] - Get all structured comments available
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :from From index
    # @option opts [Integer] :count Number of elements to return
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ListResponseVatReturnsComment, Fixnum, Hash)>] ListResponseVatReturnsComment data, response status code and response headers
    def all_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VatReturnscommentApi.all ...'
      end
      # resource path
      local_var_path = '/vatReturns/comment/>all'

      # query parameters
      query_params = {}
      query_params[:'from'] = opts[:'from'] if !opts[:'from'].nil?
      query_params[:'count'] = opts[:'count'] if !opts[:'count'].nil?
      query_params[:'sorting'] = opts[:'sorting'] if !opts[:'sorting'].nil?
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
        :return_type => 'ListResponseVatReturnsComment')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VatReturnscommentApi#all\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] - Get all structured comments related to a given vatCode
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :from From index (default to 0)
    # @option opts [Integer] :count Number of elements to return (default to 1000)
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [ListResponseVatReturnsVatCodeCommentDTO]
    def query(opts = {})
      data, _status_code, _headers = query_with_http_info(opts)
      data
    end

    # [BETA] - Get all structured comments related to a given vatCode
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :from From index
    # @option opts [Integer] :count Number of elements to return
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ListResponseVatReturnsVatCodeCommentDTO, Fixnum, Hash)>] ListResponseVatReturnsVatCodeCommentDTO data, response status code and response headers
    def query_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VatReturnscommentApi.query ...'
      end
      # resource path
      local_var_path = '/vatReturns/comment'

      # query parameters
      query_params = {}
      query_params[:'from'] = opts[:'from'] if !opts[:'from'].nil?
      query_params[:'count'] = opts[:'count'] if !opts[:'count'].nil?
      query_params[:'sorting'] = opts[:'sorting'] if !opts[:'sorting'].nil?
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
        :return_type => 'ListResponseVatReturnsVatCodeCommentDTO')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VatReturnscommentApi#query\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
