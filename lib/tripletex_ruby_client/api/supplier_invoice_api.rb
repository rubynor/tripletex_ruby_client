=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'uri'

module TripletexRubyClient
  class SupplierInvoiceApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # [BETA] Register payment, paymentType == 0 finds the last paymentType for this vendor
    # 
    # @param invoice_id Invoice ID.
    # @param payment_type 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :amount 
    # @option opts [String] :kid_or_receiver_reference 
    # @option opts [String] :bban 
    # @option opts [String] :payment_date 
    # @option opts [BOOLEAN] :use_default_payment_type Set paymentType to last type for vendor, autopay, nets or first available other type (default to false)
    # @option opts [BOOLEAN] :partial_payment Set to true to allow multiple payments registered. (default to false)
    # @return [ResponseWrapperSupplierInvoice]
    def add_payment(invoice_id, payment_type, opts = {})
      data, _status_code, _headers = add_payment_with_http_info(invoice_id, payment_type, opts)
      data
    end

    # [BETA] Register payment, paymentType &#x3D;&#x3D; 0 finds the last paymentType for this vendor
    # 
    # @param invoice_id Invoice ID.
    # @param payment_type 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :amount 
    # @option opts [String] :kid_or_receiver_reference 
    # @option opts [String] :bban 
    # @option opts [String] :payment_date 
    # @option opts [BOOLEAN] :use_default_payment_type Set paymentType to last type for vendor, autopay, nets or first available other type
    # @option opts [BOOLEAN] :partial_payment Set to true to allow multiple payments registered.
    # @return [Array<(ResponseWrapperSupplierInvoice, Fixnum, Hash)>] ResponseWrapperSupplierInvoice data, response status code and response headers
    def add_payment_with_http_info(invoice_id, payment_type, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SupplierInvoiceApi.add_payment ...'
      end
      # verify the required parameter 'invoice_id' is set
      if @api_client.config.client_side_validation && invoice_id.nil?
        fail ArgumentError, "Missing the required parameter 'invoice_id' when calling SupplierInvoiceApi.add_payment"
      end
      # verify the required parameter 'payment_type' is set
      if @api_client.config.client_side_validation && payment_type.nil?
        fail ArgumentError, "Missing the required parameter 'payment_type' when calling SupplierInvoiceApi.add_payment"
      end
      # resource path
      local_var_path = '/supplierInvoice/{invoiceId}/:addPayment'.sub('{' + 'invoiceId' + '}', invoice_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'paymentType'] = payment_type
      query_params[:'amount'] = opts[:'amount'] if !opts[:'amount'].nil?
      query_params[:'kidOrReceiverReference'] = opts[:'kid_or_receiver_reference'] if !opts[:'kid_or_receiver_reference'].nil?
      query_params[:'bban'] = opts[:'bban'] if !opts[:'bban'].nil?
      query_params[:'paymentDate'] = opts[:'payment_date'] if !opts[:'payment_date'].nil?
      query_params[:'useDefaultPaymentType'] = opts[:'use_default_payment_type'] if !opts[:'use_default_payment_type'].nil?
      query_params[:'partialPayment'] = opts[:'partial_payment'] if !opts[:'partial_payment'].nil?

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ResponseWrapperSupplierInvoice')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SupplierInvoiceApi#add_payment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Add recipient to supplier invoices.
    # 
    # @param invoice_id Invoice ID.
    # @param employee_id ID of the elements
    # @param [Hash] opts the optional parameters
    # @option opts [String] :comment comment
    # @return [ResponseWrapperSupplierInvoice]
    def add_recipient(invoice_id, employee_id, opts = {})
      data, _status_code, _headers = add_recipient_with_http_info(invoice_id, employee_id, opts)
      data
    end

    # [BETA] Add recipient to supplier invoices.
    # 
    # @param invoice_id Invoice ID.
    # @param employee_id ID of the elements
    # @param [Hash] opts the optional parameters
    # @option opts [String] :comment comment
    # @return [Array<(ResponseWrapperSupplierInvoice, Fixnum, Hash)>] ResponseWrapperSupplierInvoice data, response status code and response headers
    def add_recipient_with_http_info(invoice_id, employee_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SupplierInvoiceApi.add_recipient ...'
      end
      # verify the required parameter 'invoice_id' is set
      if @api_client.config.client_side_validation && invoice_id.nil?
        fail ArgumentError, "Missing the required parameter 'invoice_id' when calling SupplierInvoiceApi.add_recipient"
      end
      # verify the required parameter 'employee_id' is set
      if @api_client.config.client_side_validation && employee_id.nil?
        fail ArgumentError, "Missing the required parameter 'employee_id' when calling SupplierInvoiceApi.add_recipient"
      end
      # resource path
      local_var_path = '/supplierInvoice/{invoiceId}/:addRecipient'.sub('{' + 'invoiceId' + '}', invoice_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'employeeId'] = employee_id
      query_params[:'comment'] = opts[:'comment'] if !opts[:'comment'].nil?

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ResponseWrapperSupplierInvoice')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SupplierInvoiceApi#add_recipient\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Add recipient.
    # 
    # @param employee_id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :invoice_ids ID of the elements
    # @option opts [String] :comment comment
    # @return [ListResponseSupplierInvoice]
    def add_recipient_to_many(employee_id, opts = {})
      data, _status_code, _headers = add_recipient_to_many_with_http_info(employee_id, opts)
      data
    end

    # [BETA] Add recipient.
    # 
    # @param employee_id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :invoice_ids ID of the elements
    # @option opts [String] :comment comment
    # @return [Array<(ListResponseSupplierInvoice, Fixnum, Hash)>] ListResponseSupplierInvoice data, response status code and response headers
    def add_recipient_to_many_with_http_info(employee_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SupplierInvoiceApi.add_recipient_to_many ...'
      end
      # verify the required parameter 'employee_id' is set
      if @api_client.config.client_side_validation && employee_id.nil?
        fail ArgumentError, "Missing the required parameter 'employee_id' when calling SupplierInvoiceApi.add_recipient_to_many"
      end
      # resource path
      local_var_path = '/supplierInvoice/:addRecipient'

      # query parameters
      query_params = {}
      query_params[:'employeeId'] = employee_id
      query_params[:'invoiceIds'] = opts[:'invoice_ids'] if !opts[:'invoice_ids'].nil?
      query_params[:'comment'] = opts[:'comment'] if !opts[:'comment'].nil?

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ListResponseSupplierInvoice')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SupplierInvoiceApi#add_recipient_to_many\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Approve supplier invoice.
    # 
    # @param invoice_id ID of the elements
    # @param [Hash] opts the optional parameters
    # @option opts [String] :comment comment
    # @return [ResponseWrapperSupplierInvoice]
    def approve(invoice_id, opts = {})
      data, _status_code, _headers = approve_with_http_info(invoice_id, opts)
      data
    end

    # [BETA] Approve supplier invoice.
    # 
    # @param invoice_id ID of the elements
    # @param [Hash] opts the optional parameters
    # @option opts [String] :comment comment
    # @return [Array<(ResponseWrapperSupplierInvoice, Fixnum, Hash)>] ResponseWrapperSupplierInvoice data, response status code and response headers
    def approve_with_http_info(invoice_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SupplierInvoiceApi.approve ...'
      end
      # verify the required parameter 'invoice_id' is set
      if @api_client.config.client_side_validation && invoice_id.nil?
        fail ArgumentError, "Missing the required parameter 'invoice_id' when calling SupplierInvoiceApi.approve"
      end
      # resource path
      local_var_path = '/supplierInvoice/{invoiceId}/:approve'.sub('{' + 'invoiceId' + '}', invoice_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'comment'] = opts[:'comment'] if !opts[:'comment'].nil?

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ResponseWrapperSupplierInvoice')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SupplierInvoiceApi#approve\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Approve supplier invoices.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :invoice_ids ID of the elements
    # @option opts [String] :comment comment
    # @return [ListResponseSupplierInvoice]
    def approve_many(opts = {})
      data, _status_code, _headers = approve_many_with_http_info(opts)
      data
    end

    # [BETA] Approve supplier invoices.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :invoice_ids ID of the elements
    # @option opts [String] :comment comment
    # @return [Array<(ListResponseSupplierInvoice, Fixnum, Hash)>] ListResponseSupplierInvoice data, response status code and response headers
    def approve_many_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SupplierInvoiceApi.approve_many ...'
      end
      # resource path
      local_var_path = '/supplierInvoice/:approve'

      # query parameters
      query_params = {}
      query_params[:'invoiceIds'] = opts[:'invoice_ids'] if !opts[:'invoice_ids'].nil?
      query_params[:'comment'] = opts[:'comment'] if !opts[:'comment'].nil?

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ListResponseSupplierInvoice')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SupplierInvoiceApi#approve_many\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Change dimension on a supplier invoice.
    # 
    # @param invoice_id Invoice ID.
    # @param dimension Dimension
    # @param dimension_id DimensionID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :debit_posting_ids ID of the elements
    # @return [ResponseWrapperSupplierInvoice]
    def change_dimension_many(invoice_id, dimension, dimension_id, opts = {})
      data, _status_code, _headers = change_dimension_many_with_http_info(invoice_id, dimension, dimension_id, opts)
      data
    end

    # Change dimension on a supplier invoice.
    # 
    # @param invoice_id Invoice ID.
    # @param dimension Dimension
    # @param dimension_id DimensionID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :debit_posting_ids ID of the elements
    # @return [Array<(ResponseWrapperSupplierInvoice, Fixnum, Hash)>] ResponseWrapperSupplierInvoice data, response status code and response headers
    def change_dimension_many_with_http_info(invoice_id, dimension, dimension_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SupplierInvoiceApi.change_dimension_many ...'
      end
      # verify the required parameter 'invoice_id' is set
      if @api_client.config.client_side_validation && invoice_id.nil?
        fail ArgumentError, "Missing the required parameter 'invoice_id' when calling SupplierInvoiceApi.change_dimension_many"
      end
      # verify the required parameter 'dimension' is set
      if @api_client.config.client_side_validation && dimension.nil?
        fail ArgumentError, "Missing the required parameter 'dimension' when calling SupplierInvoiceApi.change_dimension_many"
      end
      # verify enum value
      if @api_client.config.client_side_validation && !['PROJECT', 'DEPARTMENT', 'EMPLOYEE', 'PRODUCT'].include?(dimension)
        fail ArgumentError, "invalid value for 'dimension', must be one of PROJECT, DEPARTMENT, EMPLOYEE, PRODUCT"
      end
      # verify the required parameter 'dimension_id' is set
      if @api_client.config.client_side_validation && dimension_id.nil?
        fail ArgumentError, "Missing the required parameter 'dimension_id' when calling SupplierInvoiceApi.change_dimension_many"
      end
      # resource path
      local_var_path = '/supplierInvoice/{invoiceId}/:changeDimension'.sub('{' + 'invoiceId' + '}', invoice_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'dimension'] = dimension
      query_params[:'dimensionId'] = dimension_id
      query_params[:'debitPostingIds'] = opts[:'debit_posting_ids'] if !opts[:'debit_posting_ids'].nil?

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ResponseWrapperSupplierInvoice')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SupplierInvoiceApi#change_dimension_many\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Get supplierInvoice document by invoice ID.
    # 
    # @param invoice_id Invoice ID from which document is downloaded.
    # @param [Hash] opts the optional parameters
    # @return [String]
    def download_pdf(invoice_id, opts = {})
      data, _status_code, _headers = download_pdf_with_http_info(invoice_id, opts)
      data
    end

    # [BETA] Get supplierInvoice document by invoice ID.
    # 
    # @param invoice_id Invoice ID from which document is downloaded.
    # @param [Hash] opts the optional parameters
    # @return [Array<(String, Fixnum, Hash)>] String data, response status code and response headers
    def download_pdf_with_http_info(invoice_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SupplierInvoiceApi.download_pdf ...'
      end
      # verify the required parameter 'invoice_id' is set
      if @api_client.config.client_side_validation && invoice_id.nil?
        fail ArgumentError, "Missing the required parameter 'invoice_id' when calling SupplierInvoiceApi.download_pdf"
      end
      # resource path
      local_var_path = '/supplierInvoice/{invoiceId}/pdf'.sub('{' + 'invoiceId' + '}', invoice_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/octet-stream'])

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
        :return_type => 'String')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SupplierInvoiceApi#download_pdf\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Get supplierInvoice by ID.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [ResponseWrapperSupplierInvoice]
    def get(id, opts = {})
      data, _status_code, _headers = get_with_http_info(id, opts)
      data
    end

    # [BETA] Get supplierInvoice by ID.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ResponseWrapperSupplierInvoice, Fixnum, Hash)>] ResponseWrapperSupplierInvoice data, response status code and response headers
    def get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SupplierInvoiceApi.get ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling SupplierInvoiceApi.get"
      end
      # resource path
      local_var_path = '/supplierInvoice/{id}'.sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'ResponseWrapperSupplierInvoice')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SupplierInvoiceApi#get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Get supplierInvoices for approval
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :search_text Search for department, employee, project and more
    # @option opts [BOOLEAN] :show_all Show all or just your own (default to false)
    # @option opts [Integer] :employee_id Default is logged in employee
    # @option opts [Integer] :from From index (default to 0)
    # @option opts [Integer] :count Number of elements to return (default to 1000)
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [ListResponseSupplierInvoice]
    def get_approval_invoices(opts = {})
      data, _status_code, _headers = get_approval_invoices_with_http_info(opts)
      data
    end

    # [BETA] Get supplierInvoices for approval
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :search_text Search for department, employee, project and more
    # @option opts [BOOLEAN] :show_all Show all or just your own
    # @option opts [Integer] :employee_id Default is logged in employee
    # @option opts [Integer] :from From index
    # @option opts [Integer] :count Number of elements to return
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ListResponseSupplierInvoice, Fixnum, Hash)>] ListResponseSupplierInvoice data, response status code and response headers
    def get_approval_invoices_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SupplierInvoiceApi.get_approval_invoices ...'
      end
      # resource path
      local_var_path = '/supplierInvoice/forApproval'

      # query parameters
      query_params = {}
      query_params[:'searchText'] = opts[:'search_text'] if !opts[:'search_text'].nil?
      query_params[:'showAll'] = opts[:'show_all'] if !opts[:'show_all'].nil?
      query_params[:'employeeId'] = opts[:'employee_id'] if !opts[:'employee_id'].nil?
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
        :return_type => 'ListResponseSupplierInvoice')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SupplierInvoiceApi#get_approval_invoices\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Put debit postings.
    # 
    # @param id Voucher id
    # @param [Hash] opts the optional parameters
    # @option opts [Array<OrderLinePostingDTO>] :body Postings
    # @option opts [BOOLEAN] :send_to_ledger Equals (default to false)
    # @option opts [String] :voucher_date If set, the date of the voucher and the supplier invoice will be changed to this date. If empty, date will not be changed
    # @return [ResponseWrapperSupplierInvoice]
    def put_postings(id, opts = {})
      data, _status_code, _headers = put_postings_with_http_info(id, opts)
      data
    end

    # [BETA] Put debit postings.
    # 
    # @param id Voucher id
    # @param [Hash] opts the optional parameters
    # @option opts [Array<OrderLinePostingDTO>] :body Postings
    # @option opts [BOOLEAN] :send_to_ledger Equals
    # @option opts [String] :voucher_date If set, the date of the voucher and the supplier invoice will be changed to this date. If empty, date will not be changed
    # @return [Array<(ResponseWrapperSupplierInvoice, Fixnum, Hash)>] ResponseWrapperSupplierInvoice data, response status code and response headers
    def put_postings_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SupplierInvoiceApi.put_postings ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling SupplierInvoiceApi.put_postings"
      end
      # resource path
      local_var_path = '/supplierInvoice/voucher/{id}/postings'.sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}
      query_params[:'sendToLedger'] = opts[:'send_to_ledger'] if !opts[:'send_to_ledger'].nil?
      query_params[:'voucherDate'] = opts[:'voucher_date'] if !opts[:'voucher_date'].nil?

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
        :return_type => 'ResponseWrapperSupplierInvoice')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SupplierInvoiceApi#put_postings\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] reject supplier invoice.
    # 
    # @param invoice_id Invoice ID.
    # @param comment 
    # @param [Hash] opts the optional parameters
    # @return [ResponseWrapperSupplierInvoice]
    def reject(invoice_id, comment, opts = {})
      data, _status_code, _headers = reject_with_http_info(invoice_id, comment, opts)
      data
    end

    # [BETA] reject supplier invoice.
    # 
    # @param invoice_id Invoice ID.
    # @param comment 
    # @param [Hash] opts the optional parameters
    # @return [Array<(ResponseWrapperSupplierInvoice, Fixnum, Hash)>] ResponseWrapperSupplierInvoice data, response status code and response headers
    def reject_with_http_info(invoice_id, comment, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SupplierInvoiceApi.reject ...'
      end
      # verify the required parameter 'invoice_id' is set
      if @api_client.config.client_side_validation && invoice_id.nil?
        fail ArgumentError, "Missing the required parameter 'invoice_id' when calling SupplierInvoiceApi.reject"
      end
      # verify the required parameter 'comment' is set
      if @api_client.config.client_side_validation && comment.nil?
        fail ArgumentError, "Missing the required parameter 'comment' when calling SupplierInvoiceApi.reject"
      end
      # resource path
      local_var_path = '/supplierInvoice/{invoiceId}/:reject'.sub('{' + 'invoiceId' + '}', invoice_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'comment'] = comment

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ResponseWrapperSupplierInvoice')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SupplierInvoiceApi#reject\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] reject supplier invoices.
    # 
    # @param comment 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :invoice_ids ID of the elements
    # @return [ListResponseSupplierInvoice]
    def reject_many(comment, opts = {})
      data, _status_code, _headers = reject_many_with_http_info(comment, opts)
      data
    end

    # [BETA] reject supplier invoices.
    # 
    # @param comment 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :invoice_ids ID of the elements
    # @return [Array<(ListResponseSupplierInvoice, Fixnum, Hash)>] ListResponseSupplierInvoice data, response status code and response headers
    def reject_many_with_http_info(comment, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SupplierInvoiceApi.reject_many ...'
      end
      # verify the required parameter 'comment' is set
      if @api_client.config.client_side_validation && comment.nil?
        fail ArgumentError, "Missing the required parameter 'comment' when calling SupplierInvoiceApi.reject_many"
      end
      # resource path
      local_var_path = '/supplierInvoice/:reject'

      # query parameters
      query_params = {}
      query_params[:'comment'] = comment
      query_params[:'invoiceIds'] = opts[:'invoice_ids'] if !opts[:'invoice_ids'].nil?

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ListResponseSupplierInvoice')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SupplierInvoiceApi#reject_many\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Find supplierInvoices corresponding with sent data.
    # 
    # @param invoice_date_from From and including
    # @param invoice_date_to To and excluding
    # @param [Hash] opts the optional parameters
    # @option opts [String] :id List of IDs
    # @option opts [String] :invoice_number Equals
    # @option opts [String] :kid Equals
    # @option opts [String] :voucher_id Equals
    # @option opts [String] :supplier_id Equals
    # @option opts [Integer] :from From index (default to 0)
    # @option opts [Integer] :count Number of elements to return (default to 1000)
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [ListResponseSupplierInvoice]
    def search(invoice_date_from, invoice_date_to, opts = {})
      data, _status_code, _headers = search_with_http_info(invoice_date_from, invoice_date_to, opts)
      data
    end

    # [BETA] Find supplierInvoices corresponding with sent data.
    # 
    # @param invoice_date_from From and including
    # @param invoice_date_to To and excluding
    # @param [Hash] opts the optional parameters
    # @option opts [String] :id List of IDs
    # @option opts [String] :invoice_number Equals
    # @option opts [String] :kid Equals
    # @option opts [String] :voucher_id Equals
    # @option opts [String] :supplier_id Equals
    # @option opts [Integer] :from From index
    # @option opts [Integer] :count Number of elements to return
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ListResponseSupplierInvoice, Fixnum, Hash)>] ListResponseSupplierInvoice data, response status code and response headers
    def search_with_http_info(invoice_date_from, invoice_date_to, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SupplierInvoiceApi.search ...'
      end
      # verify the required parameter 'invoice_date_from' is set
      if @api_client.config.client_side_validation && invoice_date_from.nil?
        fail ArgumentError, "Missing the required parameter 'invoice_date_from' when calling SupplierInvoiceApi.search"
      end
      # verify the required parameter 'invoice_date_to' is set
      if @api_client.config.client_side_validation && invoice_date_to.nil?
        fail ArgumentError, "Missing the required parameter 'invoice_date_to' when calling SupplierInvoiceApi.search"
      end
      # resource path
      local_var_path = '/supplierInvoice'

      # query parameters
      query_params = {}
      query_params[:'invoiceDateFrom'] = invoice_date_from
      query_params[:'invoiceDateTo'] = invoice_date_to
      query_params[:'id'] = opts[:'id'] if !opts[:'id'].nil?
      query_params[:'invoiceNumber'] = opts[:'invoice_number'] if !opts[:'invoice_number'].nil?
      query_params[:'kid'] = opts[:'kid'] if !opts[:'kid'].nil?
      query_params[:'voucherId'] = opts[:'voucher_id'] if !opts[:'voucher_id'].nil?
      query_params[:'supplierId'] = opts[:'supplier_id'] if !opts[:'supplier_id'].nil?
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
        :return_type => 'ListResponseSupplierInvoice')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SupplierInvoiceApi#search\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
