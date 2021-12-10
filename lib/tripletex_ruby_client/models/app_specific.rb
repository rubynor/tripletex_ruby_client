=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class AppSpecific
    attr_accessor :hour_registration_enabled

    attr_accessor :project_enabled

    attr_accessor :department_enabled

    attr_accessor :user_is_allowed_to_register_hours

    attr_accessor :payroll_accounting_enabled

    attr_accessor :user_is_auth_wage_menu

    attr_accessor :user_is_auth_my_salary

    attr_accessor :electronic_vouchers_enabled

    attr_accessor :travel_expense_enabled

    attr_accessor :document_archive_enabled

    attr_accessor :archive_reception_enabled

    attr_accessor :user_is_payslip_only

    attr_accessor :travel_expense_rates_enabled

    attr_accessor :tax_free_mileage_rates_enabled

    attr_accessor :approve_travel_expense_enabled

    attr_accessor :user_is_auth_project_info

    attr_accessor :user_is_auth_travel_and_expense_approve

    attr_accessor :user_is_auth_employee_info

    attr_accessor :user_is_auth_voucher_approve

    attr_accessor :user_is_auth_remit_approve

    attr_accessor :user_is_auth_invoicing

    attr_accessor :user_is_auth_create_order

    attr_accessor :vat_on_for_company

    attr_accessor :tax_free_diet_rates_enabled

    attr_accessor :travel_diet_ignore_posting_enabled

    attr_accessor :employee_enabled

    attr_accessor :hour_balance_enabled_for_employee

    attr_accessor :vacation_balance_enabled_for_employee

    attr_accessor :user_is_auth_create_customer

    attr_accessor :user_is_auth_project_menu

    attr_accessor :user_is_auth_company_accounting_reports

    attr_accessor :vvselectro_enabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'hour_registration_enabled' => :'hourRegistrationEnabled',
        :'project_enabled' => :'projectEnabled',
        :'department_enabled' => :'departmentEnabled',
        :'user_is_allowed_to_register_hours' => :'userIsAllowedToRegisterHours',
        :'payroll_accounting_enabled' => :'payrollAccountingEnabled',
        :'user_is_auth_wage_menu' => :'userIsAuthWageMenu',
        :'user_is_auth_my_salary' => :'userIsAuthMySalary',
        :'electronic_vouchers_enabled' => :'electronicVouchersEnabled',
        :'travel_expense_enabled' => :'travelExpenseEnabled',
        :'document_archive_enabled' => :'documentArchiveEnabled',
        :'archive_reception_enabled' => :'archiveReceptionEnabled',
        :'user_is_payslip_only' => :'userIsPayslipOnly',
        :'travel_expense_rates_enabled' => :'travelExpenseRatesEnabled',
        :'tax_free_mileage_rates_enabled' => :'taxFreeMileageRatesEnabled',
        :'approve_travel_expense_enabled' => :'approveTravelExpenseEnabled',
        :'user_is_auth_project_info' => :'userIsAuthProjectInfo',
        :'user_is_auth_travel_and_expense_approve' => :'userIsAuthTravelAndExpenseApprove',
        :'user_is_auth_employee_info' => :'userIsAuthEmployeeInfo',
        :'user_is_auth_voucher_approve' => :'userIsAuthVoucherApprove',
        :'user_is_auth_remit_approve' => :'userIsAuthRemitApprove',
        :'user_is_auth_invoicing' => :'userIsAuthInvoicing',
        :'user_is_auth_create_order' => :'userIsAuthCreateOrder',
        :'vat_on_for_company' => :'vatOnForCompany',
        :'tax_free_diet_rates_enabled' => :'taxFreeDietRatesEnabled',
        :'travel_diet_ignore_posting_enabled' => :'travelDietIgnorePostingEnabled',
        :'employee_enabled' => :'employeeEnabled',
        :'hour_balance_enabled_for_employee' => :'hourBalanceEnabledForEmployee',
        :'vacation_balance_enabled_for_employee' => :'vacationBalanceEnabledForEmployee',
        :'user_is_auth_create_customer' => :'userIsAuthCreateCustomer',
        :'user_is_auth_project_menu' => :'userIsAuthProjectMenu',
        :'user_is_auth_company_accounting_reports' => :'userIsAuthCompanyAccountingReports',
        :'vvselectro_enabled' => :'vvselectroEnabled'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'hour_registration_enabled' => :'BOOLEAN',
        :'project_enabled' => :'BOOLEAN',
        :'department_enabled' => :'BOOLEAN',
        :'user_is_allowed_to_register_hours' => :'BOOLEAN',
        :'payroll_accounting_enabled' => :'BOOLEAN',
        :'user_is_auth_wage_menu' => :'BOOLEAN',
        :'user_is_auth_my_salary' => :'BOOLEAN',
        :'electronic_vouchers_enabled' => :'BOOLEAN',
        :'travel_expense_enabled' => :'BOOLEAN',
        :'document_archive_enabled' => :'BOOLEAN',
        :'archive_reception_enabled' => :'BOOLEAN',
        :'user_is_payslip_only' => :'BOOLEAN',
        :'travel_expense_rates_enabled' => :'BOOLEAN',
        :'tax_free_mileage_rates_enabled' => :'BOOLEAN',
        :'approve_travel_expense_enabled' => :'BOOLEAN',
        :'user_is_auth_project_info' => :'BOOLEAN',
        :'user_is_auth_travel_and_expense_approve' => :'BOOLEAN',
        :'user_is_auth_employee_info' => :'BOOLEAN',
        :'user_is_auth_voucher_approve' => :'BOOLEAN',
        :'user_is_auth_remit_approve' => :'BOOLEAN',
        :'user_is_auth_invoicing' => :'BOOLEAN',
        :'user_is_auth_create_order' => :'BOOLEAN',
        :'vat_on_for_company' => :'BOOLEAN',
        :'tax_free_diet_rates_enabled' => :'BOOLEAN',
        :'travel_diet_ignore_posting_enabled' => :'BOOLEAN',
        :'employee_enabled' => :'BOOLEAN',
        :'hour_balance_enabled_for_employee' => :'BOOLEAN',
        :'vacation_balance_enabled_for_employee' => :'BOOLEAN',
        :'user_is_auth_create_customer' => :'BOOLEAN',
        :'user_is_auth_project_menu' => :'BOOLEAN',
        :'user_is_auth_company_accounting_reports' => :'BOOLEAN',
        :'vvselectro_enabled' => :'BOOLEAN'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'hourRegistrationEnabled')
        self.hour_registration_enabled = attributes[:'hourRegistrationEnabled']
      end

      if attributes.has_key?(:'projectEnabled')
        self.project_enabled = attributes[:'projectEnabled']
      end

      if attributes.has_key?(:'departmentEnabled')
        self.department_enabled = attributes[:'departmentEnabled']
      end

      if attributes.has_key?(:'userIsAllowedToRegisterHours')
        self.user_is_allowed_to_register_hours = attributes[:'userIsAllowedToRegisterHours']
      end

      if attributes.has_key?(:'payrollAccountingEnabled')
        self.payroll_accounting_enabled = attributes[:'payrollAccountingEnabled']
      end

      if attributes.has_key?(:'userIsAuthWageMenu')
        self.user_is_auth_wage_menu = attributes[:'userIsAuthWageMenu']
      end

      if attributes.has_key?(:'userIsAuthMySalary')
        self.user_is_auth_my_salary = attributes[:'userIsAuthMySalary']
      end

      if attributes.has_key?(:'electronicVouchersEnabled')
        self.electronic_vouchers_enabled = attributes[:'electronicVouchersEnabled']
      end

      if attributes.has_key?(:'travelExpenseEnabled')
        self.travel_expense_enabled = attributes[:'travelExpenseEnabled']
      end

      if attributes.has_key?(:'documentArchiveEnabled')
        self.document_archive_enabled = attributes[:'documentArchiveEnabled']
      end

      if attributes.has_key?(:'archiveReceptionEnabled')
        self.archive_reception_enabled = attributes[:'archiveReceptionEnabled']
      end

      if attributes.has_key?(:'userIsPayslipOnly')
        self.user_is_payslip_only = attributes[:'userIsPayslipOnly']
      end

      if attributes.has_key?(:'travelExpenseRatesEnabled')
        self.travel_expense_rates_enabled = attributes[:'travelExpenseRatesEnabled']
      end

      if attributes.has_key?(:'taxFreeMileageRatesEnabled')
        self.tax_free_mileage_rates_enabled = attributes[:'taxFreeMileageRatesEnabled']
      end

      if attributes.has_key?(:'approveTravelExpenseEnabled')
        self.approve_travel_expense_enabled = attributes[:'approveTravelExpenseEnabled']
      end

      if attributes.has_key?(:'userIsAuthProjectInfo')
        self.user_is_auth_project_info = attributes[:'userIsAuthProjectInfo']
      end

      if attributes.has_key?(:'userIsAuthTravelAndExpenseApprove')
        self.user_is_auth_travel_and_expense_approve = attributes[:'userIsAuthTravelAndExpenseApprove']
      end

      if attributes.has_key?(:'userIsAuthEmployeeInfo')
        self.user_is_auth_employee_info = attributes[:'userIsAuthEmployeeInfo']
      end

      if attributes.has_key?(:'userIsAuthVoucherApprove')
        self.user_is_auth_voucher_approve = attributes[:'userIsAuthVoucherApprove']
      end

      if attributes.has_key?(:'userIsAuthRemitApprove')
        self.user_is_auth_remit_approve = attributes[:'userIsAuthRemitApprove']
      end

      if attributes.has_key?(:'userIsAuthInvoicing')
        self.user_is_auth_invoicing = attributes[:'userIsAuthInvoicing']
      end

      if attributes.has_key?(:'userIsAuthCreateOrder')
        self.user_is_auth_create_order = attributes[:'userIsAuthCreateOrder']
      end

      if attributes.has_key?(:'vatOnForCompany')
        self.vat_on_for_company = attributes[:'vatOnForCompany']
      end

      if attributes.has_key?(:'taxFreeDietRatesEnabled')
        self.tax_free_diet_rates_enabled = attributes[:'taxFreeDietRatesEnabled']
      end

      if attributes.has_key?(:'travelDietIgnorePostingEnabled')
        self.travel_diet_ignore_posting_enabled = attributes[:'travelDietIgnorePostingEnabled']
      end

      if attributes.has_key?(:'employeeEnabled')
        self.employee_enabled = attributes[:'employeeEnabled']
      end

      if attributes.has_key?(:'hourBalanceEnabledForEmployee')
        self.hour_balance_enabled_for_employee = attributes[:'hourBalanceEnabledForEmployee']
      end

      if attributes.has_key?(:'vacationBalanceEnabledForEmployee')
        self.vacation_balance_enabled_for_employee = attributes[:'vacationBalanceEnabledForEmployee']
      end

      if attributes.has_key?(:'userIsAuthCreateCustomer')
        self.user_is_auth_create_customer = attributes[:'userIsAuthCreateCustomer']
      end

      if attributes.has_key?(:'userIsAuthProjectMenu')
        self.user_is_auth_project_menu = attributes[:'userIsAuthProjectMenu']
      end

      if attributes.has_key?(:'userIsAuthCompanyAccountingReports')
        self.user_is_auth_company_accounting_reports = attributes[:'userIsAuthCompanyAccountingReports']
      end

      if attributes.has_key?(:'vvselectroEnabled')
        self.vvselectro_enabled = attributes[:'vvselectroEnabled']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          hour_registration_enabled == o.hour_registration_enabled &&
          project_enabled == o.project_enabled &&
          department_enabled == o.department_enabled &&
          user_is_allowed_to_register_hours == o.user_is_allowed_to_register_hours &&
          payroll_accounting_enabled == o.payroll_accounting_enabled &&
          user_is_auth_wage_menu == o.user_is_auth_wage_menu &&
          user_is_auth_my_salary == o.user_is_auth_my_salary &&
          electronic_vouchers_enabled == o.electronic_vouchers_enabled &&
          travel_expense_enabled == o.travel_expense_enabled &&
          document_archive_enabled == o.document_archive_enabled &&
          archive_reception_enabled == o.archive_reception_enabled &&
          user_is_payslip_only == o.user_is_payslip_only &&
          travel_expense_rates_enabled == o.travel_expense_rates_enabled &&
          tax_free_mileage_rates_enabled == o.tax_free_mileage_rates_enabled &&
          approve_travel_expense_enabled == o.approve_travel_expense_enabled &&
          user_is_auth_project_info == o.user_is_auth_project_info &&
          user_is_auth_travel_and_expense_approve == o.user_is_auth_travel_and_expense_approve &&
          user_is_auth_employee_info == o.user_is_auth_employee_info &&
          user_is_auth_voucher_approve == o.user_is_auth_voucher_approve &&
          user_is_auth_remit_approve == o.user_is_auth_remit_approve &&
          user_is_auth_invoicing == o.user_is_auth_invoicing &&
          user_is_auth_create_order == o.user_is_auth_create_order &&
          vat_on_for_company == o.vat_on_for_company &&
          tax_free_diet_rates_enabled == o.tax_free_diet_rates_enabled &&
          travel_diet_ignore_posting_enabled == o.travel_diet_ignore_posting_enabled &&
          employee_enabled == o.employee_enabled &&
          hour_balance_enabled_for_employee == o.hour_balance_enabled_for_employee &&
          vacation_balance_enabled_for_employee == o.vacation_balance_enabled_for_employee &&
          user_is_auth_create_customer == o.user_is_auth_create_customer &&
          user_is_auth_project_menu == o.user_is_auth_project_menu &&
          user_is_auth_company_accounting_reports == o.user_is_auth_company_accounting_reports &&
          vvselectro_enabled == o.vvselectro_enabled
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [hour_registration_enabled, project_enabled, department_enabled, user_is_allowed_to_register_hours, payroll_accounting_enabled, user_is_auth_wage_menu, user_is_auth_my_salary, electronic_vouchers_enabled, travel_expense_enabled, document_archive_enabled, archive_reception_enabled, user_is_payslip_only, travel_expense_rates_enabled, tax_free_mileage_rates_enabled, approve_travel_expense_enabled, user_is_auth_project_info, user_is_auth_travel_and_expense_approve, user_is_auth_employee_info, user_is_auth_voucher_approve, user_is_auth_remit_approve, user_is_auth_invoicing, user_is_auth_create_order, vat_on_for_company, tax_free_diet_rates_enabled, travel_diet_ignore_posting_enabled, employee_enabled, hour_balance_enabled_for_employee, vacation_balance_enabled_for_employee, user_is_auth_create_customer, user_is_auth_project_menu, user_is_auth_company_accounting_reports, vvselectro_enabled].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = TripletexRubyClient.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end
end
