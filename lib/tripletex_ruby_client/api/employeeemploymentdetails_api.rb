=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'uri'

module TripletexRubyClient
  class EmployeeemploymentdetailsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # [BETA] Find employment details by ID.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [ResponseWrapperEmploymentDetails]
    def get(id, opts = {})
      data, _status_code, _headers = get_with_http_info(id, opts)
      data
    end

    # [BETA] Find employment details by ID.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ResponseWrapperEmploymentDetails, Fixnum, Hash)>] ResponseWrapperEmploymentDetails data, response status code and response headers
    def get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EmployeeemploymentdetailsApi.get ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling EmployeeemploymentdetailsApi.get"
      end
      # resource path
      local_var_path = '/employee/employment/details/{id}'.sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'ResponseWrapperEmploymentDetails')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EmployeeemploymentdetailsApi#get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Create employment details.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [EmploymentDetails] :body JSON representing the new object to be created. Should not have ID and version set.
    # @return [ResponseWrapperEmploymentDetails]
    def post(opts = {})
      data, _status_code, _headers = post_with_http_info(opts)
      data
    end

    # [BETA] Create employment details.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [EmploymentDetails] :body JSON representing the new object to be created. Should not have ID and version set.
    # @return [Array<(ResponseWrapperEmploymentDetails, Fixnum, Hash)>] ResponseWrapperEmploymentDetails data, response status code and response headers
    def post_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EmployeeemploymentdetailsApi.post ...'
      end
      # resource path
      local_var_path = '/employee/employment/details'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(opts[:'body'])
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ResponseWrapperEmploymentDetails')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EmployeeemploymentdetailsApi#post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Update employment details. 
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [EmploymentDetails] :body Partial object describing what should be updated
    # @return [ResponseWrapperEmploymentDetails]
    def put(id, opts = {})
      data, _status_code, _headers = put_with_http_info(id, opts)
      data
    end

    # [BETA] Update employment details. 
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [EmploymentDetails] :body Partial object describing what should be updated
    # @return [Array<(ResponseWrapperEmploymentDetails, Fixnum, Hash)>] ResponseWrapperEmploymentDetails data, response status code and response headers
    def put_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EmployeeemploymentdetailsApi.put ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling EmployeeemploymentdetailsApi.put"
      end
      # resource path
      local_var_path = '/employee/employment/details/{id}'.sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(opts[:'body'])
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ResponseWrapperEmploymentDetails')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EmployeeemploymentdetailsApi#put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Find all employmentdetails for employment.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :employment_id List of IDs
    # @option opts [Integer] :from From index (default to 0)
    # @option opts [Integer] :count Number of elements to return (default to 1000)
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [ListResponseEmploymentDetails]
    def search(opts = {})
      data, _status_code, _headers = search_with_http_info(opts)
      data
    end

    # [BETA] Find all employmentdetails for employment.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :employment_id List of IDs
    # @option opts [Integer] :from From index
    # @option opts [Integer] :count Number of elements to return
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ListResponseEmploymentDetails, Fixnum, Hash)>] ListResponseEmploymentDetails data, response status code and response headers
    def search_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EmployeeemploymentdetailsApi.search ...'
      end
      # resource path
      local_var_path = '/employee/employment/details'

      # query parameters
      query_params = {}
      query_params[:'employmentId'] = opts[:'employment_id'] if !opts[:'employment_id'].nil?
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
        :return_type => 'ListResponseEmploymentDetails')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EmployeeemploymentdetailsApi#search\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
