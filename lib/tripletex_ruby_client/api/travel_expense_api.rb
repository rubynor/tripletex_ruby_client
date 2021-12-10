=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'uri'

module TripletexRubyClient
  class TravelExpenseApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # [BETA] Approve travel expenses.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :id ID of the elements
    # @return [ListResponseTravelExpense]
    def approve(opts = {})
      data, _status_code, _headers = approve_with_http_info(opts)
      data
    end

    # [BETA] Approve travel expenses.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :id ID of the elements
    # @return [Array<(ListResponseTravelExpense, Fixnum, Hash)>] ListResponseTravelExpense data, response status code and response headers
    def approve_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TravelExpenseApi.approve ...'
      end
      # resource path
      local_var_path = '/travelExpense/:approve'

      # query parameters
      query_params = {}
      query_params[:'id'] = opts[:'id'] if !opts[:'id'].nil?

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
        :return_type => 'ListResponseTravelExpense')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TravelExpenseApi#approve\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Copy travel expense.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @return [ResponseWrapperTravelExpense]
    def copy(id, opts = {})
      data, _status_code, _headers = copy_with_http_info(id, opts)
      data
    end

    # [BETA] Copy travel expense.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @return [Array<(ResponseWrapperTravelExpense, Fixnum, Hash)>] ResponseWrapperTravelExpense data, response status code and response headers
    def copy_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TravelExpenseApi.copy ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling TravelExpenseApi.copy"
      end
      # resource path
      local_var_path = '/travelExpense/:copy'

      # query parameters
      query_params = {}
      query_params[:'id'] = id

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])

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
        :return_type => 'ResponseWrapperTravelExpense')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TravelExpenseApi#copy\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Create vouchers
    # 
    # @param date yyyy-MM-dd. Defaults to today.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :id ID of the elements
    # @return [ListResponseTravelExpense]
    def create_vouchers(date, opts = {})
      data, _status_code, _headers = create_vouchers_with_http_info(date, opts)
      data
    end

    # [BETA] Create vouchers
    # 
    # @param date yyyy-MM-dd. Defaults to today.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :id ID of the elements
    # @return [Array<(ListResponseTravelExpense, Fixnum, Hash)>] ListResponseTravelExpense data, response status code and response headers
    def create_vouchers_with_http_info(date, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TravelExpenseApi.create_vouchers ...'
      end
      # verify the required parameter 'date' is set
      if @api_client.config.client_side_validation && date.nil?
        fail ArgumentError, "Missing the required parameter 'date' when calling TravelExpenseApi.create_vouchers"
      end
      # resource path
      local_var_path = '/travelExpense/:createVouchers'

      # query parameters
      query_params = {}
      query_params[:'date'] = date
      query_params[:'id'] = opts[:'id'] if !opts[:'id'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])

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
        :return_type => 'ListResponseTravelExpense')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TravelExpenseApi#create_vouchers\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Delete travel expense.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete(id, opts = {})
      delete_with_http_info(id, opts)
      nil
    end

    # [BETA] Delete travel expense.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TravelExpenseApi.delete ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling TravelExpenseApi.delete"
      end
      # resource path
      local_var_path = '/travelExpense/{id}'.sub('{' + 'id' + '}', id.to_s)

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
        @api_client.config.logger.debug "API called: TravelExpenseApi#delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Delete attachment.
    # 
    # @param travel_expense_id ID of attachment containing the attachment to delete.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :version Version of voucher containing the attachment to delete.
    # @option opts [BOOLEAN] :send_to_inbox Should the attachment be sent to inbox rather than deleted? (default to false)
    # @option opts [BOOLEAN] :split If sendToInbox is true, should the attachment be split into one voucher per page? (default to false)
    # @return [nil]
    def delete_attachment(travel_expense_id, opts = {})
      delete_attachment_with_http_info(travel_expense_id, opts)
      nil
    end

    # [BETA] Delete attachment.
    # 
    # @param travel_expense_id ID of attachment containing the attachment to delete.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :version Version of voucher containing the attachment to delete.
    # @option opts [BOOLEAN] :send_to_inbox Should the attachment be sent to inbox rather than deleted?
    # @option opts [BOOLEAN] :split If sendToInbox is true, should the attachment be split into one voucher per page?
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_attachment_with_http_info(travel_expense_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TravelExpenseApi.delete_attachment ...'
      end
      # verify the required parameter 'travel_expense_id' is set
      if @api_client.config.client_side_validation && travel_expense_id.nil?
        fail ArgumentError, "Missing the required parameter 'travel_expense_id' when calling TravelExpenseApi.delete_attachment"
      end
      if @api_client.config.client_side_validation && !opts[:'version'].nil? && opts[:'version'] < 0
        fail ArgumentError, 'invalid value for "opts[:"version"]" when calling TravelExpenseApi.delete_attachment, must be greater than or equal to 0.'
      end

      # resource path
      local_var_path = '/travelExpense/{travelExpenseId}/attachment'.sub('{' + 'travelExpenseId' + '}', travel_expense_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'version'] = opts[:'version'] if !opts[:'version'].nil?
      query_params[:'sendToInbox'] = opts[:'send_to_inbox'] if !opts[:'send_to_inbox'].nil?
      query_params[:'split'] = opts[:'split'] if !opts[:'split'].nil?

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
        @api_client.config.logger.debug "API called: TravelExpenseApi#delete_attachment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Deliver travel expenses.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :id ID of the elements
    # @return [ListResponseTravelExpense]
    def deliver(opts = {})
      data, _status_code, _headers = deliver_with_http_info(opts)
      data
    end

    # [BETA] Deliver travel expenses.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :id ID of the elements
    # @return [Array<(ListResponseTravelExpense, Fixnum, Hash)>] ListResponseTravelExpense data, response status code and response headers
    def deliver_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TravelExpenseApi.deliver ...'
      end
      # resource path
      local_var_path = '/travelExpense/:deliver'

      # query parameters
      query_params = {}
      query_params[:'id'] = opts[:'id'] if !opts[:'id'].nil?

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
        :return_type => 'ListResponseTravelExpense')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TravelExpenseApi#deliver\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Get attachment by travel expense ID.
    # 
    # @param travel_expense_id Travel Expense ID from which PDF is downloaded.
    # @param [Hash] opts the optional parameters
    # @return [String]
    def download_attachment(travel_expense_id, opts = {})
      data, _status_code, _headers = download_attachment_with_http_info(travel_expense_id, opts)
      data
    end

    # Get attachment by travel expense ID.
    # 
    # @param travel_expense_id Travel Expense ID from which PDF is downloaded.
    # @param [Hash] opts the optional parameters
    # @return [Array<(String, Fixnum, Hash)>] String data, response status code and response headers
    def download_attachment_with_http_info(travel_expense_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TravelExpenseApi.download_attachment ...'
      end
      # verify the required parameter 'travel_expense_id' is set
      if @api_client.config.client_side_validation && travel_expense_id.nil?
        fail ArgumentError, "Missing the required parameter 'travel_expense_id' when calling TravelExpenseApi.download_attachment"
      end
      # resource path
      local_var_path = '/travelExpense/{travelExpenseId}/attachment'.sub('{' + 'travelExpenseId' + '}', travel_expense_id.to_s)

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
        @api_client.config.logger.debug "API called: TravelExpenseApi#download_attachment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Get travel expense by ID.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [ResponseWrapperTravelExpense]
    def get(id, opts = {})
      data, _status_code, _headers = get_with_http_info(id, opts)
      data
    end

    # [BETA] Get travel expense by ID.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ResponseWrapperTravelExpense, Fixnum, Hash)>] ResponseWrapperTravelExpense data, response status code and response headers
    def get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TravelExpenseApi.get ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling TravelExpenseApi.get"
      end
      # resource path
      local_var_path = '/travelExpense/{id}'.sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'ResponseWrapperTravelExpense')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TravelExpenseApi#get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Create travel expense.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [TravelExpense] :body JSON representing the new object to be created. Should not have ID and version set.
    # @return [ResponseWrapperTravelExpense]
    def post(opts = {})
      data, _status_code, _headers = post_with_http_info(opts)
      data
    end

    # [BETA] Create travel expense.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [TravelExpense] :body JSON representing the new object to be created. Should not have ID and version set.
    # @return [Array<(ResponseWrapperTravelExpense, Fixnum, Hash)>] ResponseWrapperTravelExpense data, response status code and response headers
    def post_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TravelExpenseApi.post ...'
      end
      # resource path
      local_var_path = '/travelExpense'

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
        :return_type => 'ResponseWrapperTravelExpense')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TravelExpenseApi#post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Update travel expense.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [TravelExpense] :body Partial object describing what should be updated
    # @return [ResponseWrapperTravelExpense]
    def put(id, opts = {})
      data, _status_code, _headers = put_with_http_info(id, opts)
      data
    end

    # [BETA] Update travel expense.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [TravelExpense] :body Partial object describing what should be updated
    # @return [Array<(ResponseWrapperTravelExpense, Fixnum, Hash)>] ResponseWrapperTravelExpense data, response status code and response headers
    def put_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TravelExpenseApi.put ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling TravelExpenseApi.put"
      end
      # resource path
      local_var_path = '/travelExpense/{id}'.sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'ResponseWrapperTravelExpense')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TravelExpenseApi#put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Find travel expenses corresponding with sent data.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :employee_id Equals
    # @option opts [String] :department_id Equals
    # @option opts [String] :project_id Equals
    # @option opts [String] :project_manager_id Equals
    # @option opts [String] :departure_date_from From and including
    # @option opts [String] :return_date_to To and excluding
    # @option opts [String] :state category (default to ALL)
    # @option opts [Integer] :from From index (default to 0)
    # @option opts [Integer] :count Number of elements to return (default to 1000)
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [ListResponseTravelExpense]
    def search(opts = {})
      data, _status_code, _headers = search_with_http_info(opts)
      data
    end

    # [BETA] Find travel expenses corresponding with sent data.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :employee_id Equals
    # @option opts [String] :department_id Equals
    # @option opts [String] :project_id Equals
    # @option opts [String] :project_manager_id Equals
    # @option opts [String] :departure_date_from From and including
    # @option opts [String] :return_date_to To and excluding
    # @option opts [String] :state category
    # @option opts [Integer] :from From index
    # @option opts [Integer] :count Number of elements to return
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ListResponseTravelExpense, Fixnum, Hash)>] ListResponseTravelExpense data, response status code and response headers
    def search_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TravelExpenseApi.search ...'
      end
      if @api_client.config.client_side_validation && opts[:'state'] && !['ALL', 'OPEN', 'APPROVED', 'SALARY_PAID', 'DELIVERED'].include?(opts[:'state'])
        fail ArgumentError, 'invalid value for "state", must be one of ALL, OPEN, APPROVED, SALARY_PAID, DELIVERED'
      end
      # resource path
      local_var_path = '/travelExpense'

      # query parameters
      query_params = {}
      query_params[:'employeeId'] = opts[:'employee_id'] if !opts[:'employee_id'].nil?
      query_params[:'departmentId'] = opts[:'department_id'] if !opts[:'department_id'].nil?
      query_params[:'projectId'] = opts[:'project_id'] if !opts[:'project_id'].nil?
      query_params[:'projectManagerId'] = opts[:'project_manager_id'] if !opts[:'project_manager_id'].nil?
      query_params[:'departureDateFrom'] = opts[:'departure_date_from'] if !opts[:'departure_date_from'].nil?
      query_params[:'returnDateTo'] = opts[:'return_date_to'] if !opts[:'return_date_to'].nil?
      query_params[:'state'] = opts[:'state'] if !opts[:'state'].nil?
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
        :return_type => 'ListResponseTravelExpense')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TravelExpenseApi#search\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Unapprove travel expenses.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :id ID of the elements
    # @return [ListResponseTravelExpense]
    def unapprove(opts = {})
      data, _status_code, _headers = unapprove_with_http_info(opts)
      data
    end

    # [BETA] Unapprove travel expenses.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :id ID of the elements
    # @return [Array<(ListResponseTravelExpense, Fixnum, Hash)>] ListResponseTravelExpense data, response status code and response headers
    def unapprove_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TravelExpenseApi.unapprove ...'
      end
      # resource path
      local_var_path = '/travelExpense/:unapprove'

      # query parameters
      query_params = {}
      query_params[:'id'] = opts[:'id'] if !opts[:'id'].nil?

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
        :return_type => 'ListResponseTravelExpense')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TravelExpenseApi#unapprove\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Undeliver travel expenses.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :id ID of the elements
    # @return [ListResponseTravelExpense]
    def undeliver(opts = {})
      data, _status_code, _headers = undeliver_with_http_info(opts)
      data
    end

    # [BETA] Undeliver travel expenses.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :id ID of the elements
    # @return [Array<(ListResponseTravelExpense, Fixnum, Hash)>] ListResponseTravelExpense data, response status code and response headers
    def undeliver_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TravelExpenseApi.undeliver ...'
      end
      # resource path
      local_var_path = '/travelExpense/:undeliver'

      # query parameters
      query_params = {}
      query_params[:'id'] = opts[:'id'] if !opts[:'id'].nil?

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
        :return_type => 'ListResponseTravelExpense')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TravelExpenseApi#undeliver\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Upload attachment to travel expense.
    # 
    # @param travel_expense_id Travel Expense ID to upload attachment to.
    # @param file The file
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :create_new_cost Create new cost row when you add the attachment (default to false)
    # @return [nil]
    def upload_attachment(travel_expense_id, file, opts = {})
      upload_attachment_with_http_info(travel_expense_id, file, opts)
      nil
    end

    # Upload attachment to travel expense.
    # 
    # @param travel_expense_id Travel Expense ID to upload attachment to.
    # @param file The file
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :create_new_cost Create new cost row when you add the attachment
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def upload_attachment_with_http_info(travel_expense_id, file, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TravelExpenseApi.upload_attachment ...'
      end
      # verify the required parameter 'travel_expense_id' is set
      if @api_client.config.client_side_validation && travel_expense_id.nil?
        fail ArgumentError, "Missing the required parameter 'travel_expense_id' when calling TravelExpenseApi.upload_attachment"
      end
      # verify the required parameter 'file' is set
      if @api_client.config.client_side_validation && file.nil?
        fail ArgumentError, "Missing the required parameter 'file' when calling TravelExpenseApi.upload_attachment"
      end
      # resource path
      local_var_path = '/travelExpense/{travelExpenseId}/attachment'.sub('{' + 'travelExpenseId' + '}', travel_expense_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'createNewCost'] = opts[:'create_new_cost'] if !opts[:'create_new_cost'].nil?

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
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TravelExpenseApi#upload_attachment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Upload multiple attachments to travel expense.
    # 
    # @param travel_expense_id Travel Expense ID to upload attachment to.
    # @param body Multipart files
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :create_new_cost Create new cost row when you add the attachment (default to false)
    # @return [nil]
    def upload_attachments(travel_expense_id, body, opts = {})
      upload_attachments_with_http_info(travel_expense_id, body, opts)
      nil
    end

    # Upload multiple attachments to travel expense.
    # 
    # @param travel_expense_id Travel Expense ID to upload attachment to.
    # @param body Multipart files
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :create_new_cost Create new cost row when you add the attachment
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def upload_attachments_with_http_info(travel_expense_id, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TravelExpenseApi.upload_attachments ...'
      end
      # verify the required parameter 'travel_expense_id' is set
      if @api_client.config.client_side_validation && travel_expense_id.nil?
        fail ArgumentError, "Missing the required parameter 'travel_expense_id' when calling TravelExpenseApi.upload_attachments"
      end
      # verify the required parameter 'body' is set
      if @api_client.config.client_side_validation && body.nil?
        fail ArgumentError, "Missing the required parameter 'body' when calling TravelExpenseApi.upload_attachments"
      end
      # resource path
      local_var_path = '/travelExpense/{travelExpenseId}/attachment/list'.sub('{' + 'travelExpenseId' + '}', travel_expense_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'createNewCost'] = opts[:'create_new_cost'] if !opts[:'create_new_cost'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['multipart/form-data'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(body)
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TravelExpenseApi#upload_attachments\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
