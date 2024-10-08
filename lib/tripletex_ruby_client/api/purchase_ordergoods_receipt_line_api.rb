=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'uri'

module TripletexRubyClient
  class PurchaseOrdergoodsReceiptLineApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # [BETA] Delete goods receipt line by ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete(id, opts = {})
      delete_with_http_info(id, opts)
      nil
    end

    # [BETA] Delete goods receipt line by ID. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PurchaseOrdergoodsReceiptLineApi.delete ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling PurchaseOrdergoodsReceiptLineApi.delete"
      end
      # resource path
      local_var_path = '/purchaseOrder/goodsReceiptLine/{id}'.sub('{' + 'id' + '}', id.to_s)

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
        @api_client.config.logger.debug "API called: PurchaseOrdergoodsReceiptLineApi#delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Delete goods receipt lines by ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<GoodsReceiptLine>] :body JSON representing objects to delete. Should have ID and version set.
    # @return [nil]
    def delete_list(opts = {})
      delete_list_with_http_info(opts)
      nil
    end

    # [BETA] Delete goods receipt lines by ID. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<GoodsReceiptLine>] :body JSON representing objects to delete. Should have ID and version set.
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_list_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PurchaseOrdergoodsReceiptLineApi.delete_list ...'
      end
      # resource path
      local_var_path = '/purchaseOrder/goodsReceiptLine/list'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(opts[:'body'])
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PurchaseOrdergoodsReceiptLineApi#delete_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Get goods receipt line by purchase order line ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [ResponseWrapperGoodsReceiptLine]
    def get(id, opts = {})
      data, _status_code, _headers = get_with_http_info(id, opts)
      data
    end

    # [BETA] Get goods receipt line by purchase order line ID. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ResponseWrapperGoodsReceiptLine, Fixnum, Hash)>] ResponseWrapperGoodsReceiptLine data, response status code and response headers
    def get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PurchaseOrdergoodsReceiptLineApi.get ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling PurchaseOrdergoodsReceiptLineApi.get"
      end
      # resource path
      local_var_path = '/purchaseOrder/goodsReceiptLine/{id}'.sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'ResponseWrapperGoodsReceiptLine')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PurchaseOrdergoodsReceiptLineApi#get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Register new goods receipt; new product on an existing purchase order. When registration of several goods receipt, use /list for better performance. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [GoodsReceiptLine] :body JSON representing the new object to be created. Should not have ID and version set.
    # @return [ResponseWrapperGoodsReceiptLine]
    def post(opts = {})
      data, _status_code, _headers = post_with_http_info(opts)
      data
    end

    # [BETA] Register new goods receipt; new product on an existing purchase order. When registration of several goods receipt, use /list for better performance. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [GoodsReceiptLine] :body JSON representing the new object to be created. Should not have ID and version set.
    # @return [Array<(ResponseWrapperGoodsReceiptLine, Fixnum, Hash)>] ResponseWrapperGoodsReceiptLine data, response status code and response headers
    def post_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PurchaseOrdergoodsReceiptLineApi.post ...'
      end
      # resource path
      local_var_path = '/purchaseOrder/goodsReceiptLine'

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
        :return_type => 'ResponseWrapperGoodsReceiptLine')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PurchaseOrdergoodsReceiptLineApi#post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Register multiple new goods receipt on an existing purchase order. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<GoodsReceiptLine>] :body JSON representing a list of new object to be created. Should not have ID and version set.
    # @return [ListResponseGoodsReceiptLine]
    def post_list(opts = {})
      data, _status_code, _headers = post_list_with_http_info(opts)
      data
    end

    # [BETA] Register multiple new goods receipt on an existing purchase order. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<GoodsReceiptLine>] :body JSON representing a list of new object to be created. Should not have ID and version set.
    # @return [Array<(ListResponseGoodsReceiptLine, Fixnum, Hash)>] ListResponseGoodsReceiptLine data, response status code and response headers
    def post_list_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PurchaseOrdergoodsReceiptLineApi.post_list ...'
      end
      # resource path
      local_var_path = '/purchaseOrder/goodsReceiptLine/list'

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
        :return_type => 'ListResponseGoodsReceiptLine')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PurchaseOrdergoodsReceiptLineApi#post_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Update a goods receipt line on a goods receipt. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
    # 
    # @param id Goods receipt Line ID
    # @param [Hash] opts the optional parameters
    # @option opts [GoodsReceiptLine] :body Partial object describing what should be updated
    # @return [ResponseWrapperGoodsReceiptLine]
    def put(id, opts = {})
      data, _status_code, _headers = put_with_http_info(id, opts)
      data
    end

    # [BETA] Update a goods receipt line on a goods receipt. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
    # 
    # @param id Goods receipt Line ID
    # @param [Hash] opts the optional parameters
    # @option opts [GoodsReceiptLine] :body Partial object describing what should be updated
    # @return [Array<(ResponseWrapperGoodsReceiptLine, Fixnum, Hash)>] ResponseWrapperGoodsReceiptLine data, response status code and response headers
    def put_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PurchaseOrdergoodsReceiptLineApi.put ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling PurchaseOrdergoodsReceiptLineApi.put"
      end
      # resource path
      local_var_path = '/purchaseOrder/goodsReceiptLine/{id}'.sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'ResponseWrapperGoodsReceiptLine')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PurchaseOrdergoodsReceiptLineApi#put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Update goods receipt lines on a goods receipt. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<GoodsReceiptLine>] :body JSON representing updates to object. Should have ID and version set.
    # @return [ListResponseGoodsReceiptLine]
    def put_list(opts = {})
      data, _status_code, _headers = put_list_with_http_info(opts)
      data
    end

    # [BETA] Update goods receipt lines on a goods receipt. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<GoodsReceiptLine>] :body JSON representing updates to object. Should have ID and version set.
    # @return [Array<(ListResponseGoodsReceiptLine, Fixnum, Hash)>] ListResponseGoodsReceiptLine data, response status code and response headers
    def put_list_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PurchaseOrdergoodsReceiptLineApi.put_list ...'
      end
      # resource path
      local_var_path = '/purchaseOrder/goodsReceiptLine/list'

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
        :return_type => 'ListResponseGoodsReceiptLine')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PurchaseOrdergoodsReceiptLineApi#put_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Find goods receipt lines for purchase order. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
    # 
    # @param purchase_order_id Equals
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :from From index (default to 0)
    # @option opts [Integer] :count Number of elements to return (default to 1000)
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [ListResponseGoodsReceiptLine]
    def search(purchase_order_id, opts = {})
      data, _status_code, _headers = search_with_http_info(purchase_order_id, opts)
      data
    end

    # [BETA] Find goods receipt lines for purchase order. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
    # 
    # @param purchase_order_id Equals
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :from From index
    # @option opts [Integer] :count Number of elements to return
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ListResponseGoodsReceiptLine, Fixnum, Hash)>] ListResponseGoodsReceiptLine data, response status code and response headers
    def search_with_http_info(purchase_order_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: PurchaseOrdergoodsReceiptLineApi.search ...'
      end
      # verify the required parameter 'purchase_order_id' is set
      if @api_client.config.client_side_validation && purchase_order_id.nil?
        fail ArgumentError, "Missing the required parameter 'purchase_order_id' when calling PurchaseOrdergoodsReceiptLineApi.search"
      end
      # resource path
      local_var_path = '/purchaseOrder/goodsReceiptLine'

      # query parameters
      query_params = {}
      query_params[:'purchaseOrderId'] = purchase_order_id
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
        :return_type => 'ListResponseGoodsReceiptLine')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: PurchaseOrdergoodsReceiptLineApi#search\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
