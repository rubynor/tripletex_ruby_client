=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'uri'

module TripletexRubyClient
  class PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # [BETA] Delete purchase order voucher relation. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete(id, opts = {})
      delete_with_http_info(id, opts)
      nil
    end

    # [BETA] Delete purchase order voucher relation. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.delete ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.delete"
      end
      # resource path
      local_var_path = '/purchaseOrder/purchaseOrderIncomingInvoiceRelation/{id}'.sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi#delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Delete multiple purchase order voucher relations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
    # 
    # @param ids ID of the elements
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_by_ids(ids, opts = {})
      delete_by_ids_with_http_info(ids, opts)
      nil
    end

    # [BETA] Delete multiple purchase order voucher relations. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
    # 
    # @param ids ID of the elements
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_by_ids_with_http_info(ids, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.delete_by_ids ...'
      end
      # verify the required parameter 'ids' is set
      if @api_client.config.client_side_validation && ids.nil?
        fail ArgumentError, "Missing the required parameter 'ids' when calling PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.delete_by_ids"
      end
      # resource path
      local_var_path = '/purchaseOrder/purchaseOrderIncomingInvoiceRelation/list'

      # query parameters
      query_params = {}
      query_params[:'ids'] = ids

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi#delete_by_ids\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Find purchase order relation to voucher by ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [ResponseWrapperPurchaseOrderIncomingInvoiceRelation]
    def get(id, opts = {})
      data, _status_code, _headers = get_with_http_info(id, opts)
      data
    end

    # [BETA] Find purchase order relation to voucher by ID. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ResponseWrapperPurchaseOrderIncomingInvoiceRelation, Fixnum, Hash)>] ResponseWrapperPurchaseOrderIncomingInvoiceRelation data, response status code and response headers
    def get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.get ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.get"
      end
      # resource path
      local_var_path = '/purchaseOrder/purchaseOrderIncomingInvoiceRelation/{id}'.sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'ResponseWrapperPurchaseOrderIncomingInvoiceRelation')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi#get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Create new relation between purchase order and a voucher. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [PurchaseOrderIncomingInvoiceRelation] :body JSON representing the new object to be created. Should not have ID and version set.
    # @return [ResponseWrapperPurchaseOrderIncomingInvoiceRelation]
    def post(opts = {})
      data, _status_code, _headers = post_with_http_info(opts)
      data
    end

    # [BETA] Create new relation between purchase order and a voucher. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [PurchaseOrderIncomingInvoiceRelation] :body JSON representing the new object to be created. Should not have ID and version set.
    # @return [Array<(ResponseWrapperPurchaseOrderIncomingInvoiceRelation, Fixnum, Hash)>] ResponseWrapperPurchaseOrderIncomingInvoiceRelation data, response status code and response headers
    def post_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.post ...'
      end
      # resource path
      local_var_path = '/purchaseOrder/purchaseOrderIncomingInvoiceRelation'

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
        :return_type => 'ResponseWrapperPurchaseOrderIncomingInvoiceRelation')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi#post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Create a new list of relations between purchase order and voucher. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<PurchaseOrderIncomingInvoiceRelation>] :body JSON representing the new object to be created. Should not have ID and version set.
    # @return [ListResponsePurchaseOrderIncomingInvoiceRelation]
    def post_list(opts = {})
      data, _status_code, _headers = post_list_with_http_info(opts)
      data
    end

    # [BETA] Create a new list of relations between purchase order and voucher. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<PurchaseOrderIncomingInvoiceRelation>] :body JSON representing the new object to be created. Should not have ID and version set.
    # @return [Array<(ListResponsePurchaseOrderIncomingInvoiceRelation, Fixnum, Hash)>] ListResponsePurchaseOrderIncomingInvoiceRelation data, response status code and response headers
    def post_list_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.post_list ...'
      end
      # resource path
      local_var_path = '/purchaseOrder/purchaseOrderIncomingInvoiceRelation/list'

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
        :return_type => 'ListResponsePurchaseOrderIncomingInvoiceRelation')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi#post_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Find purchase order relation to voucher with sent data. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :id List of IDs
    # @option opts [String] :order_out_id List of IDs
    # @option opts [String] :voucher_id List of IDs
    # @option opts [Integer] :from From index (default to 0)
    # @option opts [Integer] :count Number of elements to return (default to 1000)
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [ListResponsePurchaseOrderIncomingInvoiceRelation]
    def search(opts = {})
      data, _status_code, _headers = search_with_http_info(opts)
      data
    end

    # [BETA] Find purchase order relation to voucher with sent data. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :id List of IDs
    # @option opts [String] :order_out_id List of IDs
    # @option opts [String] :voucher_id List of IDs
    # @option opts [Integer] :from From index
    # @option opts [Integer] :count Number of elements to return
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ListResponsePurchaseOrderIncomingInvoiceRelation, Fixnum, Hash)>] ListResponsePurchaseOrderIncomingInvoiceRelation data, response status code and response headers
    def search_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.search ...'
      end
      # resource path
      local_var_path = '/purchaseOrder/purchaseOrderIncomingInvoiceRelation'

      # query parameters
      query_params = {}
      query_params[:'id'] = opts[:'id'] if !opts[:'id'].nil?
      query_params[:'orderOutId'] = opts[:'order_out_id'] if !opts[:'order_out_id'].nil?
      query_params[:'voucherId'] = opts[:'voucher_id'] if !opts[:'voucher_id'].nil?
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
        :return_type => 'ListResponsePurchaseOrderIncomingInvoiceRelation')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi#search\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
