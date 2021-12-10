=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'uri'

module TripletexRubyClient
  class SaftApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # [BETA] Create SAF-T export for the Tripletex account.
    # 
    # @param year Year to export
    # @param [Hash] opts the optional parameters
    # @return [String]
    def export_saft(year, opts = {})
      data, _status_code, _headers = export_saft_with_http_info(year, opts)
      data
    end

    # [BETA] Create SAF-T export for the Tripletex account.
    # 
    # @param year Year to export
    # @param [Hash] opts the optional parameters
    # @return [Array<(String, Fixnum, Hash)>] String data, response status code and response headers
    def export_saft_with_http_info(year, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SaftApi.export_saft ...'
      end
      # verify the required parameter 'year' is set
      if @api_client.config.client_side_validation && year.nil?
        fail ArgumentError, "Missing the required parameter 'year' when calling SaftApi.export_saft"
      end
      # resource path
      local_var_path = '/saft/exportSAFT'

      # query parameters
      query_params = {}
      query_params[:'year'] = year

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
        @api_client.config.logger.debug "API called: SaftApi#export_saft\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Import SAF-T. Send XML file as multipart form.
    # 
    # @param saft_file The SAF-T file (XML)
    # @param mapping_file Mapping of chart of accounts (Excel). See https://tripletex.no/resources/examples/saft_account_mapping.xls
    # @param import_customer_vendors Create customers and suppliers
    # @param create_missing_accounts Create new accounts
    # @param import_start_balance_from_opening Create an opening balance from the import file&#39;s starting balance.
    # @param import_start_balance_from_closing Create an opening balance from the import file&#39;s outgoing balance.
    # @param import_vouchers Create vouchers
    # @param import_departments Create departments
    # @param import_projects Create projects
    # @param tripletex_generates_customer_numbers Let Tripletex create customer and supplier numbers and ignore the numbers in the import file.
    # @param create_customer_ib Create an opening balance on accounts receivable from customers
    # @param update_account_names Overwrite existing names on accounts
    # @param create_vendor_ib Create an opening balance on accounts payable
    # @param override_voucher_date_on_discrepancy Overwrite transaction date on period discrepancies.
    # @param overwrite_customers_contacts Overwrite existing customers/contacts
    # @param only_active_customers Only active customers
    # @param only_active_accounts Only active accounts
    # @param update_start_balance Update the opening balance of main ledger accounts from the import file by import before the opening balance.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def import_saft(saft_file, mapping_file, import_customer_vendors, create_missing_accounts, import_start_balance_from_opening, import_start_balance_from_closing, import_vouchers, import_departments, import_projects, tripletex_generates_customer_numbers, create_customer_ib, update_account_names, create_vendor_ib, override_voucher_date_on_discrepancy, overwrite_customers_contacts, only_active_customers, only_active_accounts, update_start_balance, opts = {})
      import_saft_with_http_info(saft_file, mapping_file, import_customer_vendors, create_missing_accounts, import_start_balance_from_opening, import_start_balance_from_closing, import_vouchers, import_departments, import_projects, tripletex_generates_customer_numbers, create_customer_ib, update_account_names, create_vendor_ib, override_voucher_date_on_discrepancy, overwrite_customers_contacts, only_active_customers, only_active_accounts, update_start_balance, opts)
      nil
    end

    # [BETA] Import SAF-T. Send XML file as multipart form.
    # 
    # @param saft_file The SAF-T file (XML)
    # @param mapping_file Mapping of chart of accounts (Excel). See https://tripletex.no/resources/examples/saft_account_mapping.xls
    # @param import_customer_vendors Create customers and suppliers
    # @param create_missing_accounts Create new accounts
    # @param import_start_balance_from_opening Create an opening balance from the import file&#39;s starting balance.
    # @param import_start_balance_from_closing Create an opening balance from the import file&#39;s outgoing balance.
    # @param import_vouchers Create vouchers
    # @param import_departments Create departments
    # @param import_projects Create projects
    # @param tripletex_generates_customer_numbers Let Tripletex create customer and supplier numbers and ignore the numbers in the import file.
    # @param create_customer_ib Create an opening balance on accounts receivable from customers
    # @param update_account_names Overwrite existing names on accounts
    # @param create_vendor_ib Create an opening balance on accounts payable
    # @param override_voucher_date_on_discrepancy Overwrite transaction date on period discrepancies.
    # @param overwrite_customers_contacts Overwrite existing customers/contacts
    # @param only_active_customers Only active customers
    # @param only_active_accounts Only active accounts
    # @param update_start_balance Update the opening balance of main ledger accounts from the import file by import before the opening balance.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def import_saft_with_http_info(saft_file, mapping_file, import_customer_vendors, create_missing_accounts, import_start_balance_from_opening, import_start_balance_from_closing, import_vouchers, import_departments, import_projects, tripletex_generates_customer_numbers, create_customer_ib, update_account_names, create_vendor_ib, override_voucher_date_on_discrepancy, overwrite_customers_contacts, only_active_customers, only_active_accounts, update_start_balance, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SaftApi.import_saft ...'
      end
      # verify the required parameter 'saft_file' is set
      if @api_client.config.client_side_validation && saft_file.nil?
        fail ArgumentError, "Missing the required parameter 'saft_file' when calling SaftApi.import_saft"
      end
      # verify the required parameter 'mapping_file' is set
      if @api_client.config.client_side_validation && mapping_file.nil?
        fail ArgumentError, "Missing the required parameter 'mapping_file' when calling SaftApi.import_saft"
      end
      # verify the required parameter 'import_customer_vendors' is set
      if @api_client.config.client_side_validation && import_customer_vendors.nil?
        fail ArgumentError, "Missing the required parameter 'import_customer_vendors' when calling SaftApi.import_saft"
      end
      # verify the required parameter 'create_missing_accounts' is set
      if @api_client.config.client_side_validation && create_missing_accounts.nil?
        fail ArgumentError, "Missing the required parameter 'create_missing_accounts' when calling SaftApi.import_saft"
      end
      # verify the required parameter 'import_start_balance_from_opening' is set
      if @api_client.config.client_side_validation && import_start_balance_from_opening.nil?
        fail ArgumentError, "Missing the required parameter 'import_start_balance_from_opening' when calling SaftApi.import_saft"
      end
      # verify the required parameter 'import_start_balance_from_closing' is set
      if @api_client.config.client_side_validation && import_start_balance_from_closing.nil?
        fail ArgumentError, "Missing the required parameter 'import_start_balance_from_closing' when calling SaftApi.import_saft"
      end
      # verify the required parameter 'import_vouchers' is set
      if @api_client.config.client_side_validation && import_vouchers.nil?
        fail ArgumentError, "Missing the required parameter 'import_vouchers' when calling SaftApi.import_saft"
      end
      # verify the required parameter 'import_departments' is set
      if @api_client.config.client_side_validation && import_departments.nil?
        fail ArgumentError, "Missing the required parameter 'import_departments' when calling SaftApi.import_saft"
      end
      # verify the required parameter 'import_projects' is set
      if @api_client.config.client_side_validation && import_projects.nil?
        fail ArgumentError, "Missing the required parameter 'import_projects' when calling SaftApi.import_saft"
      end
      # verify the required parameter 'tripletex_generates_customer_numbers' is set
      if @api_client.config.client_side_validation && tripletex_generates_customer_numbers.nil?
        fail ArgumentError, "Missing the required parameter 'tripletex_generates_customer_numbers' when calling SaftApi.import_saft"
      end
      # verify the required parameter 'create_customer_ib' is set
      if @api_client.config.client_side_validation && create_customer_ib.nil?
        fail ArgumentError, "Missing the required parameter 'create_customer_ib' when calling SaftApi.import_saft"
      end
      # verify the required parameter 'update_account_names' is set
      if @api_client.config.client_side_validation && update_account_names.nil?
        fail ArgumentError, "Missing the required parameter 'update_account_names' when calling SaftApi.import_saft"
      end
      # verify the required parameter 'create_vendor_ib' is set
      if @api_client.config.client_side_validation && create_vendor_ib.nil?
        fail ArgumentError, "Missing the required parameter 'create_vendor_ib' when calling SaftApi.import_saft"
      end
      # verify the required parameter 'override_voucher_date_on_discrepancy' is set
      if @api_client.config.client_side_validation && override_voucher_date_on_discrepancy.nil?
        fail ArgumentError, "Missing the required parameter 'override_voucher_date_on_discrepancy' when calling SaftApi.import_saft"
      end
      # verify the required parameter 'overwrite_customers_contacts' is set
      if @api_client.config.client_side_validation && overwrite_customers_contacts.nil?
        fail ArgumentError, "Missing the required parameter 'overwrite_customers_contacts' when calling SaftApi.import_saft"
      end
      # verify the required parameter 'only_active_customers' is set
      if @api_client.config.client_side_validation && only_active_customers.nil?
        fail ArgumentError, "Missing the required parameter 'only_active_customers' when calling SaftApi.import_saft"
      end
      # verify the required parameter 'only_active_accounts' is set
      if @api_client.config.client_side_validation && only_active_accounts.nil?
        fail ArgumentError, "Missing the required parameter 'only_active_accounts' when calling SaftApi.import_saft"
      end
      # verify the required parameter 'update_start_balance' is set
      if @api_client.config.client_side_validation && update_start_balance.nil?
        fail ArgumentError, "Missing the required parameter 'update_start_balance' when calling SaftApi.import_saft"
      end
      # resource path
      local_var_path = '/saft/importSAFT'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['multipart/form-data'])

      # form parameters
      form_params = {}
      form_params['saftFile'] = saft_file
      form_params['mappingFile'] = mapping_file
      form_params['importCustomerVendors'] = import_customer_vendors
      form_params['createMissingAccounts'] = create_missing_accounts
      form_params['importStartBalanceFromOpening'] = import_start_balance_from_opening
      form_params['importStartBalanceFromClosing'] = import_start_balance_from_closing
      form_params['importVouchers'] = import_vouchers
      form_params['importDepartments'] = import_departments
      form_params['importProjects'] = import_projects
      form_params['tripletexGeneratesCustomerNumbers'] = tripletex_generates_customer_numbers
      form_params['createCustomerIB'] = create_customer_ib
      form_params['updateAccountNames'] = update_account_names
      form_params['createVendorIB'] = create_vendor_ib
      form_params['overrideVoucherDateOnDiscrepancy'] = override_voucher_date_on_discrepancy
      form_params['overwriteCustomersContacts'] = overwrite_customers_contacts
      form_params['onlyActiveCustomers'] = only_active_customers
      form_params['onlyActiveAccounts'] = only_active_accounts
      form_params['updateStartBalance'] = update_start_balance

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
        @api_client.config.logger.debug "API called: SaftApi#import_saft\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
