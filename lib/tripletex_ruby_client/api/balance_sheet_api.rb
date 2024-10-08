=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'uri'

module TripletexRubyClient
  class BalanceSheetApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # [BETA] Get balance sheet (saldobalanse).
    # 
    # @param date_from Format is yyyy-MM-dd (from and incl.).
    # @param date_to Format is yyyy-MM-dd (to and excl.).
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :account_number_from From and including
    # @option opts [Integer] :account_number_to To and excluding
    # @option opts [Integer] :customer_id Element ID
    # @option opts [Integer] :employee_id Element ID
    # @option opts [Integer] :department_id Element ID
    # @option opts [Integer] :project_id Element ID
    # @option opts [BOOLEAN] :include_sub_projects Should sub projects of the given project be included (default to false)
    # @option opts [BOOLEAN] :include_active_accounts_without_movements Should active accounts with no movements be included (default to false)
    # @option opts [Integer] :from From index (default to 0)
    # @option opts [Integer] :count Number of elements to return (default to 1000)
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [ListResponseBalanceSheetAccount]
    def search(date_from, date_to, opts = {})
      data, _status_code, _headers = search_with_http_info(date_from, date_to, opts)
      data
    end

    # [BETA] Get balance sheet (saldobalanse).
    # 
    # @param date_from Format is yyyy-MM-dd (from and incl.).
    # @param date_to Format is yyyy-MM-dd (to and excl.).
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :account_number_from From and including
    # @option opts [Integer] :account_number_to To and excluding
    # @option opts [Integer] :customer_id Element ID
    # @option opts [Integer] :employee_id Element ID
    # @option opts [Integer] :department_id Element ID
    # @option opts [Integer] :project_id Element ID
    # @option opts [BOOLEAN] :include_sub_projects Should sub projects of the given project be included
    # @option opts [BOOLEAN] :include_active_accounts_without_movements Should active accounts with no movements be included
    # @option opts [Integer] :from From index
    # @option opts [Integer] :count Number of elements to return
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ListResponseBalanceSheetAccount, Fixnum, Hash)>] ListResponseBalanceSheetAccount data, response status code and response headers
    def search_with_http_info(date_from, date_to, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BalanceSheetApi.search ...'
      end
      # verify the required parameter 'date_from' is set
      if @api_client.config.client_side_validation && date_from.nil?
        fail ArgumentError, "Missing the required parameter 'date_from' when calling BalanceSheetApi.search"
      end
      # verify the required parameter 'date_to' is set
      if @api_client.config.client_side_validation && date_to.nil?
        fail ArgumentError, "Missing the required parameter 'date_to' when calling BalanceSheetApi.search"
      end
      # resource path
      local_var_path = '/balanceSheet'

      # query parameters
      query_params = {}
      query_params[:'dateFrom'] = date_from
      query_params[:'dateTo'] = date_to
      query_params[:'accountNumberFrom'] = opts[:'account_number_from'] if !opts[:'account_number_from'].nil?
      query_params[:'accountNumberTo'] = opts[:'account_number_to'] if !opts[:'account_number_to'].nil?
      query_params[:'customerId'] = opts[:'customer_id'] if !opts[:'customer_id'].nil?
      query_params[:'employeeId'] = opts[:'employee_id'] if !opts[:'employee_id'].nil?
      query_params[:'departmentId'] = opts[:'department_id'] if !opts[:'department_id'].nil?
      query_params[:'projectId'] = opts[:'project_id'] if !opts[:'project_id'].nil?
      query_params[:'includeSubProjects'] = opts[:'include_sub_projects'] if !opts[:'include_sub_projects'].nil?
      query_params[:'includeActiveAccountsWithoutMovements'] = opts[:'include_active_accounts_without_movements'] if !opts[:'include_active_accounts_without_movements'].nil?
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
        :return_type => 'ListResponseBalanceSheetAccount')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BalanceSheetApi#search\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
