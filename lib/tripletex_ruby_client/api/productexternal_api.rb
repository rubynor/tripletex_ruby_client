=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'uri'

module TripletexRubyClient
  class ProductexternalApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # [BETA] Get external product by ID.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [ResponseWrapperExternalProduct]
    def get(id, opts = {})
      data, _status_code, _headers = get_with_http_info(id, opts)
      data
    end

    # [BETA] Get external product by ID.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ResponseWrapperExternalProduct, Fixnum, Hash)>] ResponseWrapperExternalProduct data, response status code and response headers
    def get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProductexternalApi.get ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling ProductexternalApi.get"
      end
      # resource path
      local_var_path = '/product/external/{id}'.sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}
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
        :return_type => 'ResponseWrapperExternalProduct')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProductexternalApi#get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Find external products corresponding with sent data. The sorting-field is not in use on this endpoint.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :name Containing
    # @option opts [String] :wholesaler Wholesaler
    # @option opts [String] :organization_number Wholesaler organization number. Mandatory if Wholesaler is not selected. If Wholesaler is selected, this field is ignored.
    # @option opts [String] :el_number List of valid el numbers
    # @option opts [String] :nrf_number List of valid nrf numbers
    # @option opts [BOOLEAN] :is_inactive Equals
    # @option opts [Integer] :from From index (default to 0)
    # @option opts [Integer] :count Number of elements to return (default to 1000)
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [ListResponseExternalProduct]
    def search(opts = {})
      data, _status_code, _headers = search_with_http_info(opts)
      data
    end

    # [BETA] Find external products corresponding with sent data. The sorting-field is not in use on this endpoint.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :name Containing
    # @option opts [String] :wholesaler Wholesaler
    # @option opts [String] :organization_number Wholesaler organization number. Mandatory if Wholesaler is not selected. If Wholesaler is selected, this field is ignored.
    # @option opts [String] :el_number List of valid el numbers
    # @option opts [String] :nrf_number List of valid nrf numbers
    # @option opts [BOOLEAN] :is_inactive Equals
    # @option opts [Integer] :from From index
    # @option opts [Integer] :count Number of elements to return
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ListResponseExternalProduct, Fixnum, Hash)>] ListResponseExternalProduct data, response status code and response headers
    def search_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProductexternalApi.search ...'
      end
      if @api_client.config.client_side_validation && opts[:'wholesaler'] && !['AHLSELL', 'BROEDRENE_DAHL', 'ELEKTROSKANDIA', 'HEIDENREICH', 'ONNINEN', 'SONEPAR', 'SOLAR', 'BERGAARD_AMUNDSEN', 'BERGAARD_AMUNDSEN_STAVANGER', 'SORLANDET_ELEKTRO', 'ETMAN_DISTRIBUSJON', 'ETM_OST', 'CENIKA', 'EP_ENGROS', 'BETEK', 'DGROUP', 'FAGERHULT', 'GLAMOX', 'SCHNEIDER', 'STOKKAN', 'WURTH', 'ELEKTROIMPORTOEREN', 'THERMOFLOOR', 'LYSKOMPONENTER', 'NORDESIGN'].include?(opts[:'wholesaler'])
        fail ArgumentError, 'invalid value for "wholesaler", must be one of AHLSELL, BROEDRENE_DAHL, ELEKTROSKANDIA, HEIDENREICH, ONNINEN, SONEPAR, SOLAR, BERGAARD_AMUNDSEN, BERGAARD_AMUNDSEN_STAVANGER, SORLANDET_ELEKTRO, ETMAN_DISTRIBUSJON, ETM_OST, CENIKA, EP_ENGROS, BETEK, DGROUP, FAGERHULT, GLAMOX, SCHNEIDER, STOKKAN, WURTH, ELEKTROIMPORTOEREN, THERMOFLOOR, LYSKOMPONENTER, NORDESIGN'
      end
      # resource path
      local_var_path = '/product/external'

      # query parameters
      query_params = {}
      query_params[:'name'] = opts[:'name'] if !opts[:'name'].nil?
      query_params[:'wholesaler'] = opts[:'wholesaler'] if !opts[:'wholesaler'].nil?
      query_params[:'organizationNumber'] = opts[:'organization_number'] if !opts[:'organization_number'].nil?
      query_params[:'elNumber'] = opts[:'el_number'] if !opts[:'el_number'].nil?
      query_params[:'nrfNumber'] = opts[:'nrf_number'] if !opts[:'nrf_number'].nil?
      query_params[:'isInactive'] = opts[:'is_inactive'] if !opts[:'is_inactive'].nil?
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
        :return_type => 'ListResponseExternalProduct')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProductexternalApi#search\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
