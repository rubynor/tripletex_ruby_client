=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'uri'

module TripletexRubyClient
  class ProductApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # [BETA] Delete product.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete(id, opts = {})
      delete_with_http_info(id, opts)
      nil
    end

    # [BETA] Delete product.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProductApi.delete ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling ProductApi.delete"
      end
      # resource path
      local_var_path = '/product/{id}'.sub('{' + 'id' + '}', id.to_s)

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
        @api_client.config.logger.debug "API called: ProductApi#delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Delete image.
    # 
    # @param id ID of Product containing the image to delete.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_image(id, opts = {})
      delete_image_with_http_info(id, opts)
      nil
    end

    # [BETA] Delete image.
    # 
    # @param id ID of Product containing the image to delete.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_image_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProductApi.delete_image ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling ProductApi.delete_image"
      end
      # resource path
      local_var_path = '/product/{id}/image'.sub('{' + 'id' + '}', id.to_s)

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
        @api_client.config.logger.debug "API called: ProductApi#delete_image\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Get product by ID.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [ResponseWrapperProduct]
    def get(id, opts = {})
      data, _status_code, _headers = get_with_http_info(id, opts)
      data
    end

    # Get product by ID.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ResponseWrapperProduct, Fixnum, Hash)>] ResponseWrapperProduct data, response status code and response headers
    def get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProductApi.get ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling ProductApi.get"
      end
      # resource path
      local_var_path = '/product/{id}'.sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'ResponseWrapperProduct')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProductApi#get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Create new product.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Product] :body JSON representing the new object to be created. Should not have ID and version set.
    # @return [ResponseWrapperProduct]
    def post(opts = {})
      data, _status_code, _headers = post_with_http_info(opts)
      data
    end

    # Create new product.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Product] :body JSON representing the new object to be created. Should not have ID and version set.
    # @return [Array<(ResponseWrapperProduct, Fixnum, Hash)>] ResponseWrapperProduct data, response status code and response headers
    def post_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProductApi.post ...'
      end
      # resource path
      local_var_path = '/product'

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
        :return_type => 'ResponseWrapperProduct')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProductApi#post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Add multiple products.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Product>] :body JSON representing a list of new object to be created. Should not have ID and version set.
    # @return [ListResponseProduct]
    def post_list(opts = {})
      data, _status_code, _headers = post_list_with_http_info(opts)
      data
    end

    # [BETA] Add multiple products.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Product>] :body JSON representing a list of new object to be created. Should not have ID and version set.
    # @return [Array<(ListResponseProduct, Fixnum, Hash)>] ListResponseProduct data, response status code and response headers
    def post_list_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProductApi.post_list ...'
      end
      # resource path
      local_var_path = '/product/list'

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
        :return_type => 'ListResponseProduct')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProductApi#post_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Update product.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [Product] :body Partial object describing what should be updated
    # @return [ResponseWrapperProduct]
    def put(id, opts = {})
      data, _status_code, _headers = put_with_http_info(id, opts)
      data
    end

    # Update product.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [Product] :body Partial object describing what should be updated
    # @return [Array<(ResponseWrapperProduct, Fixnum, Hash)>] ResponseWrapperProduct data, response status code and response headers
    def put_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProductApi.put ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling ProductApi.put"
      end
      # resource path
      local_var_path = '/product/{id}'.sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'ResponseWrapperProduct')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProductApi#put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Update a list of products.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Product>] :body JSON representing updates to object. Should have ID and version set.
    # @return [ListResponseProduct]
    def put_list(opts = {})
      data, _status_code, _headers = put_list_with_http_info(opts)
      data
    end

    # [BETA] Update a list of products.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Product>] :body JSON representing updates to object. Should have ID and version set.
    # @return [Array<(ListResponseProduct, Fixnum, Hash)>] ListResponseProduct data, response status code and response headers
    def put_list_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProductApi.put_list ...'
      end
      # resource path
      local_var_path = '/product/list'

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
        :return_type => 'ListResponseProduct')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProductApi#put_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Find products corresponding with sent data.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :number DEPRECATED. List of product numbers (Integer only)
    # @option opts [Array<String>] :product_number List of valid product numbers
    # @option opts [String] :name Containing
    # @option opts [String] :ean Equals
    # @option opts [BOOLEAN] :is_inactive Equals
    # @option opts [BOOLEAN] :is_stock_item Equals
    # @option opts [BOOLEAN] :is_supplier_product Equals
    # @option opts [String] :supplier_id Equals
    # @option opts [String] :currency_id Equals
    # @option opts [String] :vat_type_id Equals
    # @option opts [String] :product_unit_id Equals
    # @option opts [String] :department_id Equals
    # @option opts [String] :account_id Equals
    # @option opts [Float] :cost_excluding_vat_currency_from From and including
    # @option opts [Float] :cost_excluding_vat_currency_to To and excluding
    # @option opts [Float] :price_excluding_vat_currency_from From and including
    # @option opts [Float] :price_excluding_vat_currency_to To and excluding
    # @option opts [Float] :price_including_vat_currency_from From and including
    # @option opts [Float] :price_including_vat_currency_to To and excluding
    # @option opts [Integer] :from From index (default to 0)
    # @option opts [Integer] :count Number of elements to return (default to 1000)
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [ListResponseProduct]
    def search(opts = {})
      data, _status_code, _headers = search_with_http_info(opts)
      data
    end

    # Find products corresponding with sent data.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :number DEPRECATED. List of product numbers (Integer only)
    # @option opts [Array<String>] :product_number List of valid product numbers
    # @option opts [String] :name Containing
    # @option opts [String] :ean Equals
    # @option opts [BOOLEAN] :is_inactive Equals
    # @option opts [BOOLEAN] :is_stock_item Equals
    # @option opts [BOOLEAN] :is_supplier_product Equals
    # @option opts [String] :supplier_id Equals
    # @option opts [String] :currency_id Equals
    # @option opts [String] :vat_type_id Equals
    # @option opts [String] :product_unit_id Equals
    # @option opts [String] :department_id Equals
    # @option opts [String] :account_id Equals
    # @option opts [Float] :cost_excluding_vat_currency_from From and including
    # @option opts [Float] :cost_excluding_vat_currency_to To and excluding
    # @option opts [Float] :price_excluding_vat_currency_from From and including
    # @option opts [Float] :price_excluding_vat_currency_to To and excluding
    # @option opts [Float] :price_including_vat_currency_from From and including
    # @option opts [Float] :price_including_vat_currency_to To and excluding
    # @option opts [Integer] :from From index
    # @option opts [Integer] :count Number of elements to return
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ListResponseProduct, Fixnum, Hash)>] ListResponseProduct data, response status code and response headers
    def search_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProductApi.search ...'
      end
      # resource path
      local_var_path = '/product'

      # query parameters
      query_params = {}
      query_params[:'number'] = opts[:'number'] if !opts[:'number'].nil?
      query_params[:'productNumber'] = @api_client.build_collection_param(opts[:'product_number'], :multi) if !opts[:'product_number'].nil?
      query_params[:'name'] = opts[:'name'] if !opts[:'name'].nil?
      query_params[:'ean'] = opts[:'ean'] if !opts[:'ean'].nil?
      query_params[:'isInactive'] = opts[:'is_inactive'] if !opts[:'is_inactive'].nil?
      query_params[:'isStockItem'] = opts[:'is_stock_item'] if !opts[:'is_stock_item'].nil?
      query_params[:'isSupplierProduct'] = opts[:'is_supplier_product'] if !opts[:'is_supplier_product'].nil?
      query_params[:'supplierId'] = opts[:'supplier_id'] if !opts[:'supplier_id'].nil?
      query_params[:'currencyId'] = opts[:'currency_id'] if !opts[:'currency_id'].nil?
      query_params[:'vatTypeId'] = opts[:'vat_type_id'] if !opts[:'vat_type_id'].nil?
      query_params[:'productUnitId'] = opts[:'product_unit_id'] if !opts[:'product_unit_id'].nil?
      query_params[:'departmentId'] = opts[:'department_id'] if !opts[:'department_id'].nil?
      query_params[:'accountId'] = opts[:'account_id'] if !opts[:'account_id'].nil?
      query_params[:'costExcludingVatCurrencyFrom'] = opts[:'cost_excluding_vat_currency_from'] if !opts[:'cost_excluding_vat_currency_from'].nil?
      query_params[:'costExcludingVatCurrencyTo'] = opts[:'cost_excluding_vat_currency_to'] if !opts[:'cost_excluding_vat_currency_to'].nil?
      query_params[:'priceExcludingVatCurrencyFrom'] = opts[:'price_excluding_vat_currency_from'] if !opts[:'price_excluding_vat_currency_from'].nil?
      query_params[:'priceExcludingVatCurrencyTo'] = opts[:'price_excluding_vat_currency_to'] if !opts[:'price_excluding_vat_currency_to'].nil?
      query_params[:'priceIncludingVatCurrencyFrom'] = opts[:'price_including_vat_currency_from'] if !opts[:'price_including_vat_currency_from'].nil?
      query_params[:'priceIncludingVatCurrencyTo'] = opts[:'price_including_vat_currency_to'] if !opts[:'price_including_vat_currency_to'].nil?
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
        :return_type => 'ListResponseProduct')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProductApi#search\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Upload image to Product. Existing image on product will be replaced if exists
    # 
    # @param id Product ID to upload image to.
    # @param file The file
    # @param [Hash] opts the optional parameters
    # @return [ResponseWrapperProduct]
    def upload_image(id, file, opts = {})
      data, _status_code, _headers = upload_image_with_http_info(id, file, opts)
      data
    end

    # [BETA] Upload image to Product. Existing image on product will be replaced if exists
    # 
    # @param id Product ID to upload image to.
    # @param file The file
    # @param [Hash] opts the optional parameters
    # @return [Array<(ResponseWrapperProduct, Fixnum, Hash)>] ResponseWrapperProduct data, response status code and response headers
    def upload_image_with_http_info(id, file, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProductApi.upload_image ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling ProductApi.upload_image"
      end
      # verify the required parameter 'file' is set
      if @api_client.config.client_side_validation && file.nil?
        fail ArgumentError, "Missing the required parameter 'file' when calling ProductApi.upload_image"
      end
      # resource path
      local_var_path = '/product/{id}/image'.sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['multipart/form-data'])

      # form parameters
      form_params = {}
      form_params['file'] = file

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ResponseWrapperProduct')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProductApi#upload_image\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
