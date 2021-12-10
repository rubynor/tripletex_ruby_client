=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'uri'

module TripletexRubyClient
  class TimesheetmonthApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # approve month(s).  If id is provided the other args are ignored
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :id Element ID
    # @option opts [String] :employee_ids List of IDs. Defaults to ID of token owner.
    # @option opts [String] :month_year 2020-01
    # @option opts [String] :approved_until_date yyyy-MM-dd. Defaults to today.. Defaults to end of month
    # @return [ListResponseMonthlyStatus]
    def approve(opts = {})
      data, _status_code, _headers = approve_with_http_info(opts)
      data
    end

    # approve month(s).  If id is provided the other args are ignored
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :id Element ID
    # @option opts [String] :employee_ids List of IDs. Defaults to ID of token owner.
    # @option opts [String] :month_year 2020-01
    # @option opts [String] :approved_until_date yyyy-MM-dd. Defaults to today.. Defaults to end of month
    # @return [Array<(ListResponseMonthlyStatus, Fixnum, Hash)>] ListResponseMonthlyStatus data, response status code and response headers
    def approve_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TimesheetmonthApi.approve ...'
      end
      # resource path
      local_var_path = '/timesheet/month/:approve'

      # query parameters
      query_params = {}
      query_params[:'id'] = opts[:'id'] if !opts[:'id'].nil?
      query_params[:'employeeIds'] = opts[:'employee_ids'] if !opts[:'employee_ids'].nil?
      query_params[:'monthYear'] = opts[:'month_year'] if !opts[:'month_year'].nil?
      query_params[:'approvedUntilDate'] = opts[:'approved_until_date'] if !opts[:'approved_until_date'].nil?

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
        :return_type => 'ListResponseMonthlyStatus')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TimesheetmonthApi#approve\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # complete month(s).  If id is provided the other args are ignored
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :id Element ID
    # @option opts [String] :employee_ids List of IDs. Defaults to ID of token owner.
    # @option opts [String] :month_year 2020-01
    # @return [ListResponseMonthlyStatus]
    def complete(opts = {})
      data, _status_code, _headers = complete_with_http_info(opts)
      data
    end

    # complete month(s).  If id is provided the other args are ignored
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :id Element ID
    # @option opts [String] :employee_ids List of IDs. Defaults to ID of token owner.
    # @option opts [String] :month_year 2020-01
    # @return [Array<(ListResponseMonthlyStatus, Fixnum, Hash)>] ListResponseMonthlyStatus data, response status code and response headers
    def complete_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TimesheetmonthApi.complete ...'
      end
      # resource path
      local_var_path = '/timesheet/month/:complete'

      # query parameters
      query_params = {}
      query_params[:'id'] = opts[:'id'] if !opts[:'id'].nil?
      query_params[:'employeeIds'] = opts[:'employee_ids'] if !opts[:'employee_ids'].nil?
      query_params[:'monthYear'] = opts[:'month_year'] if !opts[:'month_year'].nil?

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
        :return_type => 'ListResponseMonthlyStatus')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TimesheetmonthApi#complete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Find monthly status entry by ID.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [ResponseWrapperMonthlyStatus]
    def get(id, opts = {})
      data, _status_code, _headers = get_with_http_info(id, opts)
      data
    end

    # Find monthly status entry by ID.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ResponseWrapperMonthlyStatus, Fixnum, Hash)>] ResponseWrapperMonthlyStatus data, response status code and response headers
    def get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TimesheetmonthApi.get ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling TimesheetmonthApi.get"
      end
      # resource path
      local_var_path = '/timesheet/month/{id}'.sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'ResponseWrapperMonthlyStatus')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TimesheetmonthApi#get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Find monthly status for given month.
    # 
    # @param employee_ids List of IDs. Defaults to ID of token owner.
    # @param month_year 2020-01
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :from From index (default to 0)
    # @option opts [Integer] :count Number of elements to return (default to 1000)
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [ListResponseMonthlyStatus]
    def get_by_month_number(employee_ids, month_year, opts = {})
      data, _status_code, _headers = get_by_month_number_with_http_info(employee_ids, month_year, opts)
      data
    end

    # Find monthly status for given month.
    # 
    # @param employee_ids List of IDs. Defaults to ID of token owner.
    # @param month_year 2020-01
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :from From index
    # @option opts [Integer] :count Number of elements to return
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ListResponseMonthlyStatus, Fixnum, Hash)>] ListResponseMonthlyStatus data, response status code and response headers
    def get_by_month_number_with_http_info(employee_ids, month_year, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TimesheetmonthApi.get_by_month_number ...'
      end
      # verify the required parameter 'employee_ids' is set
      if @api_client.config.client_side_validation && employee_ids.nil?
        fail ArgumentError, "Missing the required parameter 'employee_ids' when calling TimesheetmonthApi.get_by_month_number"
      end
      # verify the required parameter 'month_year' is set
      if @api_client.config.client_side_validation && month_year.nil?
        fail ArgumentError, "Missing the required parameter 'month_year' when calling TimesheetmonthApi.get_by_month_number"
      end
      # resource path
      local_var_path = '/timesheet/month/byMonthNumber'

      # query parameters
      query_params = {}
      query_params[:'employeeIds'] = employee_ids
      query_params[:'monthYear'] = month_year
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
        :return_type => 'ListResponseMonthlyStatus')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TimesheetmonthApi#get_by_month_number\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # reopen month(s).  If id is provided the other args are ignored
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :id Element ID
    # @option opts [String] :employee_ids List of IDs. Defaults to ID of token owner.
    # @option opts [String] :month_year 2020-01
    # @return [ListResponseMonthlyStatus]
    def reopen(opts = {})
      data, _status_code, _headers = reopen_with_http_info(opts)
      data
    end

    # reopen month(s).  If id is provided the other args are ignored
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :id Element ID
    # @option opts [String] :employee_ids List of IDs. Defaults to ID of token owner.
    # @option opts [String] :month_year 2020-01
    # @return [Array<(ListResponseMonthlyStatus, Fixnum, Hash)>] ListResponseMonthlyStatus data, response status code and response headers
    def reopen_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TimesheetmonthApi.reopen ...'
      end
      # resource path
      local_var_path = '/timesheet/month/:reopen'

      # query parameters
      query_params = {}
      query_params[:'id'] = opts[:'id'] if !opts[:'id'].nil?
      query_params[:'employeeIds'] = opts[:'employee_ids'] if !opts[:'employee_ids'].nil?
      query_params[:'monthYear'] = opts[:'month_year'] if !opts[:'month_year'].nil?

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
        :return_type => 'ListResponseMonthlyStatus')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TimesheetmonthApi#reopen\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # unapprove month(s).  If id is provided the other args are ignored
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :id Element ID
    # @option opts [String] :employee_ids List of IDs. Defaults to ID of token owner.
    # @option opts [String] :month_year 2020-01
    # @return [ListResponseMonthlyStatus]
    def unapprove(opts = {})
      data, _status_code, _headers = unapprove_with_http_info(opts)
      data
    end

    # unapprove month(s).  If id is provided the other args are ignored
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :id Element ID
    # @option opts [String] :employee_ids List of IDs. Defaults to ID of token owner.
    # @option opts [String] :month_year 2020-01
    # @return [Array<(ListResponseMonthlyStatus, Fixnum, Hash)>] ListResponseMonthlyStatus data, response status code and response headers
    def unapprove_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TimesheetmonthApi.unapprove ...'
      end
      # resource path
      local_var_path = '/timesheet/month/:unapprove'

      # query parameters
      query_params = {}
      query_params[:'id'] = opts[:'id'] if !opts[:'id'].nil?
      query_params[:'employeeIds'] = opts[:'employee_ids'] if !opts[:'employee_ids'].nil?
      query_params[:'monthYear'] = opts[:'month_year'] if !opts[:'month_year'].nil?

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
        :return_type => 'ListResponseMonthlyStatus')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TimesheetmonthApi#unapprove\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
