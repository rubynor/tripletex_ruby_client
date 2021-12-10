=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class ProjectSettings
    attr_accessor :approve_hour_lists

    attr_accessor :approve_invoices

    attr_accessor :mark_ready_for_invoicing

    attr_accessor :historical_information

    attr_accessor :project_forecast

    attr_accessor :budget_on_subcontracts

    attr_accessor :project_categories

    attr_accessor :reference_fee

    attr_accessor :sort_order_projects

    attr_accessor :auto_close_invoiced_projects

    attr_accessor :must_approve_registered_hours

    attr_accessor :show_project_order_lines_to_all_project_participants

    attr_accessor :hour_cost_percentage

    attr_accessor :fixed_price_projects_fee_calc_method

    attr_accessor :fixed_price_projects_invoice_by_progress

    attr_accessor :project_budget_reference_fee

    attr_accessor :allow_multiple_project_invoice_vat

    attr_accessor :standard_reinvoicing

    attr_accessor :is_current_month_default_period

    attr_accessor :auto_generate_project_number

    attr_accessor :auto_generate_starting_number

    attr_accessor :project_name_scheme

    attr_accessor :project_type_of_contract

    attr_accessor :project_order_lines_sort_order

    attr_accessor :project_hourly_rate_model

    attr_accessor :only_project_members_can_register_info

    attr_accessor :only_project_activities_timesheet_registration

    attr_accessor :hourly_rate_projects_write_up_down

    attr_accessor :default_project_contract_comment

    attr_accessor :default_project_invoicing_comment

    attr_accessor :resource_planning

    attr_accessor :resource_groups

    attr_accessor :holiday_plan

    attr_accessor :resource_plan_period

    # Control forms required for invoicing
    attr_accessor :control_forms_required_for_invoicing

    # Control forms required for hour tracking
    attr_accessor :control_forms_required_for_hour_tracking

    attr_accessor :use_logged_in_user_email_on_project_budget

    attr_accessor :email_on_project_budget

    attr_accessor :use_logged_in_user_email_on_project_contract

    attr_accessor :email_on_project_contract

    attr_accessor :use_logged_in_user_email_on_documents

    attr_accessor :email_on_documents

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'approve_hour_lists' => :'approveHourLists',
        :'approve_invoices' => :'approveInvoices',
        :'mark_ready_for_invoicing' => :'markReadyForInvoicing',
        :'historical_information' => :'historicalInformation',
        :'project_forecast' => :'projectForecast',
        :'budget_on_subcontracts' => :'budgetOnSubcontracts',
        :'project_categories' => :'projectCategories',
        :'reference_fee' => :'referenceFee',
        :'sort_order_projects' => :'sortOrderProjects',
        :'auto_close_invoiced_projects' => :'autoCloseInvoicedProjects',
        :'must_approve_registered_hours' => :'mustApproveRegisteredHours',
        :'show_project_order_lines_to_all_project_participants' => :'showProjectOrderLinesToAllProjectParticipants',
        :'hour_cost_percentage' => :'hourCostPercentage',
        :'fixed_price_projects_fee_calc_method' => :'fixedPriceProjectsFeeCalcMethod',
        :'fixed_price_projects_invoice_by_progress' => :'fixedPriceProjectsInvoiceByProgress',
        :'project_budget_reference_fee' => :'projectBudgetReferenceFee',
        :'allow_multiple_project_invoice_vat' => :'allowMultipleProjectInvoiceVat',
        :'standard_reinvoicing' => :'standardReinvoicing',
        :'is_current_month_default_period' => :'isCurrentMonthDefaultPeriod',
        :'auto_generate_project_number' => :'autoGenerateProjectNumber',
        :'auto_generate_starting_number' => :'autoGenerateStartingNumber',
        :'project_name_scheme' => :'projectNameScheme',
        :'project_type_of_contract' => :'projectTypeOfContract',
        :'project_order_lines_sort_order' => :'projectOrderLinesSortOrder',
        :'project_hourly_rate_model' => :'projectHourlyRateModel',
        :'only_project_members_can_register_info' => :'onlyProjectMembersCanRegisterInfo',
        :'only_project_activities_timesheet_registration' => :'onlyProjectActivitiesTimesheetRegistration',
        :'hourly_rate_projects_write_up_down' => :'hourlyRateProjectsWriteUpDown',
        :'default_project_contract_comment' => :'defaultProjectContractComment',
        :'default_project_invoicing_comment' => :'defaultProjectInvoicingComment',
        :'resource_planning' => :'resourcePlanning',
        :'resource_groups' => :'resourceGroups',
        :'holiday_plan' => :'holidayPlan',
        :'resource_plan_period' => :'resourcePlanPeriod',
        :'control_forms_required_for_invoicing' => :'controlFormsRequiredForInvoicing',
        :'control_forms_required_for_hour_tracking' => :'controlFormsRequiredForHourTracking',
        :'use_logged_in_user_email_on_project_budget' => :'useLoggedInUserEmailOnProjectBudget',
        :'email_on_project_budget' => :'emailOnProjectBudget',
        :'use_logged_in_user_email_on_project_contract' => :'useLoggedInUserEmailOnProjectContract',
        :'email_on_project_contract' => :'emailOnProjectContract',
        :'use_logged_in_user_email_on_documents' => :'useLoggedInUserEmailOnDocuments',
        :'email_on_documents' => :'emailOnDocuments'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'approve_hour_lists' => :'BOOLEAN',
        :'approve_invoices' => :'BOOLEAN',
        :'mark_ready_for_invoicing' => :'BOOLEAN',
        :'historical_information' => :'BOOLEAN',
        :'project_forecast' => :'BOOLEAN',
        :'budget_on_subcontracts' => :'BOOLEAN',
        :'project_categories' => :'BOOLEAN',
        :'reference_fee' => :'BOOLEAN',
        :'sort_order_projects' => :'String',
        :'auto_close_invoiced_projects' => :'BOOLEAN',
        :'must_approve_registered_hours' => :'BOOLEAN',
        :'show_project_order_lines_to_all_project_participants' => :'BOOLEAN',
        :'hour_cost_percentage' => :'BOOLEAN',
        :'fixed_price_projects_fee_calc_method' => :'String',
        :'fixed_price_projects_invoice_by_progress' => :'BOOLEAN',
        :'project_budget_reference_fee' => :'BOOLEAN',
        :'allow_multiple_project_invoice_vat' => :'BOOLEAN',
        :'standard_reinvoicing' => :'BOOLEAN',
        :'is_current_month_default_period' => :'BOOLEAN',
        :'auto_generate_project_number' => :'BOOLEAN',
        :'auto_generate_starting_number' => :'Integer',
        :'project_name_scheme' => :'String',
        :'project_type_of_contract' => :'String',
        :'project_order_lines_sort_order' => :'String',
        :'project_hourly_rate_model' => :'String',
        :'only_project_members_can_register_info' => :'BOOLEAN',
        :'only_project_activities_timesheet_registration' => :'BOOLEAN',
        :'hourly_rate_projects_write_up_down' => :'BOOLEAN',
        :'default_project_contract_comment' => :'String',
        :'default_project_invoicing_comment' => :'String',
        :'resource_planning' => :'BOOLEAN',
        :'resource_groups' => :'BOOLEAN',
        :'holiday_plan' => :'BOOLEAN',
        :'resource_plan_period' => :'String',
        :'control_forms_required_for_invoicing' => :'Array<ProjectControlFormType>',
        :'control_forms_required_for_hour_tracking' => :'Array<ProjectControlFormType>',
        :'use_logged_in_user_email_on_project_budget' => :'BOOLEAN',
        :'email_on_project_budget' => :'String',
        :'use_logged_in_user_email_on_project_contract' => :'BOOLEAN',
        :'email_on_project_contract' => :'String',
        :'use_logged_in_user_email_on_documents' => :'BOOLEAN',
        :'email_on_documents' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'approveHourLists')
        self.approve_hour_lists = attributes[:'approveHourLists']
      end

      if attributes.has_key?(:'approveInvoices')
        self.approve_invoices = attributes[:'approveInvoices']
      end

      if attributes.has_key?(:'markReadyForInvoicing')
        self.mark_ready_for_invoicing = attributes[:'markReadyForInvoicing']
      end

      if attributes.has_key?(:'historicalInformation')
        self.historical_information = attributes[:'historicalInformation']
      end

      if attributes.has_key?(:'projectForecast')
        self.project_forecast = attributes[:'projectForecast']
      end

      if attributes.has_key?(:'budgetOnSubcontracts')
        self.budget_on_subcontracts = attributes[:'budgetOnSubcontracts']
      end

      if attributes.has_key?(:'projectCategories')
        self.project_categories = attributes[:'projectCategories']
      end

      if attributes.has_key?(:'referenceFee')
        self.reference_fee = attributes[:'referenceFee']
      end

      if attributes.has_key?(:'sortOrderProjects')
        self.sort_order_projects = attributes[:'sortOrderProjects']
      end

      if attributes.has_key?(:'autoCloseInvoicedProjects')
        self.auto_close_invoiced_projects = attributes[:'autoCloseInvoicedProjects']
      end

      if attributes.has_key?(:'mustApproveRegisteredHours')
        self.must_approve_registered_hours = attributes[:'mustApproveRegisteredHours']
      end

      if attributes.has_key?(:'showProjectOrderLinesToAllProjectParticipants')
        self.show_project_order_lines_to_all_project_participants = attributes[:'showProjectOrderLinesToAllProjectParticipants']
      end

      if attributes.has_key?(:'hourCostPercentage')
        self.hour_cost_percentage = attributes[:'hourCostPercentage']
      end

      if attributes.has_key?(:'fixedPriceProjectsFeeCalcMethod')
        self.fixed_price_projects_fee_calc_method = attributes[:'fixedPriceProjectsFeeCalcMethod']
      end

      if attributes.has_key?(:'fixedPriceProjectsInvoiceByProgress')
        self.fixed_price_projects_invoice_by_progress = attributes[:'fixedPriceProjectsInvoiceByProgress']
      end

      if attributes.has_key?(:'projectBudgetReferenceFee')
        self.project_budget_reference_fee = attributes[:'projectBudgetReferenceFee']
      end

      if attributes.has_key?(:'allowMultipleProjectInvoiceVat')
        self.allow_multiple_project_invoice_vat = attributes[:'allowMultipleProjectInvoiceVat']
      end

      if attributes.has_key?(:'standardReinvoicing')
        self.standard_reinvoicing = attributes[:'standardReinvoicing']
      end

      if attributes.has_key?(:'isCurrentMonthDefaultPeriod')
        self.is_current_month_default_period = attributes[:'isCurrentMonthDefaultPeriod']
      end

      if attributes.has_key?(:'autoGenerateProjectNumber')
        self.auto_generate_project_number = attributes[:'autoGenerateProjectNumber']
      end

      if attributes.has_key?(:'autoGenerateStartingNumber')
        self.auto_generate_starting_number = attributes[:'autoGenerateStartingNumber']
      end

      if attributes.has_key?(:'projectNameScheme')
        self.project_name_scheme = attributes[:'projectNameScheme']
      end

      if attributes.has_key?(:'projectTypeOfContract')
        self.project_type_of_contract = attributes[:'projectTypeOfContract']
      end

      if attributes.has_key?(:'projectOrderLinesSortOrder')
        self.project_order_lines_sort_order = attributes[:'projectOrderLinesSortOrder']
      end

      if attributes.has_key?(:'projectHourlyRateModel')
        self.project_hourly_rate_model = attributes[:'projectHourlyRateModel']
      end

      if attributes.has_key?(:'onlyProjectMembersCanRegisterInfo')
        self.only_project_members_can_register_info = attributes[:'onlyProjectMembersCanRegisterInfo']
      end

      if attributes.has_key?(:'onlyProjectActivitiesTimesheetRegistration')
        self.only_project_activities_timesheet_registration = attributes[:'onlyProjectActivitiesTimesheetRegistration']
      end

      if attributes.has_key?(:'hourlyRateProjectsWriteUpDown')
        self.hourly_rate_projects_write_up_down = attributes[:'hourlyRateProjectsWriteUpDown']
      end

      if attributes.has_key?(:'defaultProjectContractComment')
        self.default_project_contract_comment = attributes[:'defaultProjectContractComment']
      end

      if attributes.has_key?(:'defaultProjectInvoicingComment')
        self.default_project_invoicing_comment = attributes[:'defaultProjectInvoicingComment']
      end

      if attributes.has_key?(:'resourcePlanning')
        self.resource_planning = attributes[:'resourcePlanning']
      end

      if attributes.has_key?(:'resourceGroups')
        self.resource_groups = attributes[:'resourceGroups']
      end

      if attributes.has_key?(:'holidayPlan')
        self.holiday_plan = attributes[:'holidayPlan']
      end

      if attributes.has_key?(:'resourcePlanPeriod')
        self.resource_plan_period = attributes[:'resourcePlanPeriod']
      end

      if attributes.has_key?(:'controlFormsRequiredForInvoicing')
        if (value = attributes[:'controlFormsRequiredForInvoicing']).is_a?(Array)
          self.control_forms_required_for_invoicing = value
        end
      end

      if attributes.has_key?(:'controlFormsRequiredForHourTracking')
        if (value = attributes[:'controlFormsRequiredForHourTracking']).is_a?(Array)
          self.control_forms_required_for_hour_tracking = value
        end
      end

      if attributes.has_key?(:'useLoggedInUserEmailOnProjectBudget')
        self.use_logged_in_user_email_on_project_budget = attributes[:'useLoggedInUserEmailOnProjectBudget']
      end

      if attributes.has_key?(:'emailOnProjectBudget')
        self.email_on_project_budget = attributes[:'emailOnProjectBudget']
      end

      if attributes.has_key?(:'useLoggedInUserEmailOnProjectContract')
        self.use_logged_in_user_email_on_project_contract = attributes[:'useLoggedInUserEmailOnProjectContract']
      end

      if attributes.has_key?(:'emailOnProjectContract')
        self.email_on_project_contract = attributes[:'emailOnProjectContract']
      end

      if attributes.has_key?(:'useLoggedInUserEmailOnDocuments')
        self.use_logged_in_user_email_on_documents = attributes[:'useLoggedInUserEmailOnDocuments']
      end

      if attributes.has_key?(:'emailOnDocuments')
        self.email_on_documents = attributes[:'emailOnDocuments']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@auto_generate_starting_number.nil? && @auto_generate_starting_number < 0
        invalid_properties.push('invalid value for "auto_generate_starting_number", must be greater than or equal to 0.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      sort_order_projects_validator = EnumAttributeValidator.new('String', ['SORT_ORDER_NAME_AND_NUMBER', 'SORT_ORDER_NAME'])
      return false unless sort_order_projects_validator.valid?(@sort_order_projects)
      fixed_price_projects_fee_calc_method_validator = EnumAttributeValidator.new('String', ['FIXED_PRICE_PROJECTS_CALC_METHOD_INVOICED_FEE', 'FIXED_PRICE_PROJECTS_CALC_METHOD_PERCENT_COMPLETED'])
      return false unless fixed_price_projects_fee_calc_method_validator.valid?(@fixed_price_projects_fee_calc_method)
      return false if !@auto_generate_starting_number.nil? && @auto_generate_starting_number < 0
      project_name_scheme_validator = EnumAttributeValidator.new('String', ['NAME_STANDARD', 'NAME_INCL_CUSTOMER_NAME', 'NAME_INCL_PARENT_NAME', 'NAME_INCL_PARENT_NUMBER', 'NAME_INCL_PARENT_NAME_AND_NUMBER'])
      return false unless project_name_scheme_validator.valid?(@project_name_scheme)
      project_type_of_contract_validator = EnumAttributeValidator.new('String', ['PROJECT_FIXED_PRICE', 'PROJECT_HOUR_RATES'])
      return false unless project_type_of_contract_validator.valid?(@project_type_of_contract)
      project_order_lines_sort_order_validator = EnumAttributeValidator.new('String', ['SORT_ORDER_ID', 'SORT_ORDER_DATE', 'SORT_ORDER_PRODUCT', 'SORT_ORDER_CUSTOM'])
      return false unless project_order_lines_sort_order_validator.valid?(@project_order_lines_sort_order)
      project_hourly_rate_model_validator = EnumAttributeValidator.new('String', ['TYPE_PREDEFINED_HOURLY_RATES', 'TYPE_PROJECT_SPECIFIC_HOURLY_RATES', 'TYPE_FIXED_HOURLY_RATE'])
      return false unless project_hourly_rate_model_validator.valid?(@project_hourly_rate_model)
      resource_plan_period_validator = EnumAttributeValidator.new('String', ['PERIOD_MONTH', 'PERIOD_WEEK', 'PERIOD_DAY'])
      return false unless resource_plan_period_validator.valid?(@resource_plan_period)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] sort_order_projects Object to be assigned
    def sort_order_projects=(sort_order_projects)
      validator = EnumAttributeValidator.new('String', ['SORT_ORDER_NAME_AND_NUMBER', 'SORT_ORDER_NAME'])
      unless validator.valid?(sort_order_projects)
        fail ArgumentError, 'invalid value for "sort_order_projects", must be one of #{validator.allowable_values}.'
      end
      @sort_order_projects = sort_order_projects
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] fixed_price_projects_fee_calc_method Object to be assigned
    def fixed_price_projects_fee_calc_method=(fixed_price_projects_fee_calc_method)
      validator = EnumAttributeValidator.new('String', ['FIXED_PRICE_PROJECTS_CALC_METHOD_INVOICED_FEE', 'FIXED_PRICE_PROJECTS_CALC_METHOD_PERCENT_COMPLETED'])
      unless validator.valid?(fixed_price_projects_fee_calc_method)
        fail ArgumentError, 'invalid value for "fixed_price_projects_fee_calc_method", must be one of #{validator.allowable_values}.'
      end
      @fixed_price_projects_fee_calc_method = fixed_price_projects_fee_calc_method
    end

    # Custom attribute writer method with validation
    # @param [Object] auto_generate_starting_number Value to be assigned
    def auto_generate_starting_number=(auto_generate_starting_number)
      if !auto_generate_starting_number.nil? && auto_generate_starting_number < 0
        fail ArgumentError, 'invalid value for "auto_generate_starting_number", must be greater than or equal to 0.'
      end

      @auto_generate_starting_number = auto_generate_starting_number
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] project_name_scheme Object to be assigned
    def project_name_scheme=(project_name_scheme)
      validator = EnumAttributeValidator.new('String', ['NAME_STANDARD', 'NAME_INCL_CUSTOMER_NAME', 'NAME_INCL_PARENT_NAME', 'NAME_INCL_PARENT_NUMBER', 'NAME_INCL_PARENT_NAME_AND_NUMBER'])
      unless validator.valid?(project_name_scheme)
        fail ArgumentError, 'invalid value for "project_name_scheme", must be one of #{validator.allowable_values}.'
      end
      @project_name_scheme = project_name_scheme
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] project_type_of_contract Object to be assigned
    def project_type_of_contract=(project_type_of_contract)
      validator = EnumAttributeValidator.new('String', ['PROJECT_FIXED_PRICE', 'PROJECT_HOUR_RATES'])
      unless validator.valid?(project_type_of_contract)
        fail ArgumentError, 'invalid value for "project_type_of_contract", must be one of #{validator.allowable_values}.'
      end
      @project_type_of_contract = project_type_of_contract
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] project_order_lines_sort_order Object to be assigned
    def project_order_lines_sort_order=(project_order_lines_sort_order)
      validator = EnumAttributeValidator.new('String', ['SORT_ORDER_ID', 'SORT_ORDER_DATE', 'SORT_ORDER_PRODUCT', 'SORT_ORDER_CUSTOM'])
      unless validator.valid?(project_order_lines_sort_order)
        fail ArgumentError, 'invalid value for "project_order_lines_sort_order", must be one of #{validator.allowable_values}.'
      end
      @project_order_lines_sort_order = project_order_lines_sort_order
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] project_hourly_rate_model Object to be assigned
    def project_hourly_rate_model=(project_hourly_rate_model)
      validator = EnumAttributeValidator.new('String', ['TYPE_PREDEFINED_HOURLY_RATES', 'TYPE_PROJECT_SPECIFIC_HOURLY_RATES', 'TYPE_FIXED_HOURLY_RATE'])
      unless validator.valid?(project_hourly_rate_model)
        fail ArgumentError, 'invalid value for "project_hourly_rate_model", must be one of #{validator.allowable_values}.'
      end
      @project_hourly_rate_model = project_hourly_rate_model
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] resource_plan_period Object to be assigned
    def resource_plan_period=(resource_plan_period)
      validator = EnumAttributeValidator.new('String', ['PERIOD_MONTH', 'PERIOD_WEEK', 'PERIOD_DAY'])
      unless validator.valid?(resource_plan_period)
        fail ArgumentError, 'invalid value for "resource_plan_period", must be one of #{validator.allowable_values}.'
      end
      @resource_plan_period = resource_plan_period
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          approve_hour_lists == o.approve_hour_lists &&
          approve_invoices == o.approve_invoices &&
          mark_ready_for_invoicing == o.mark_ready_for_invoicing &&
          historical_information == o.historical_information &&
          project_forecast == o.project_forecast &&
          budget_on_subcontracts == o.budget_on_subcontracts &&
          project_categories == o.project_categories &&
          reference_fee == o.reference_fee &&
          sort_order_projects == o.sort_order_projects &&
          auto_close_invoiced_projects == o.auto_close_invoiced_projects &&
          must_approve_registered_hours == o.must_approve_registered_hours &&
          show_project_order_lines_to_all_project_participants == o.show_project_order_lines_to_all_project_participants &&
          hour_cost_percentage == o.hour_cost_percentage &&
          fixed_price_projects_fee_calc_method == o.fixed_price_projects_fee_calc_method &&
          fixed_price_projects_invoice_by_progress == o.fixed_price_projects_invoice_by_progress &&
          project_budget_reference_fee == o.project_budget_reference_fee &&
          allow_multiple_project_invoice_vat == o.allow_multiple_project_invoice_vat &&
          standard_reinvoicing == o.standard_reinvoicing &&
          is_current_month_default_period == o.is_current_month_default_period &&
          auto_generate_project_number == o.auto_generate_project_number &&
          auto_generate_starting_number == o.auto_generate_starting_number &&
          project_name_scheme == o.project_name_scheme &&
          project_type_of_contract == o.project_type_of_contract &&
          project_order_lines_sort_order == o.project_order_lines_sort_order &&
          project_hourly_rate_model == o.project_hourly_rate_model &&
          only_project_members_can_register_info == o.only_project_members_can_register_info &&
          only_project_activities_timesheet_registration == o.only_project_activities_timesheet_registration &&
          hourly_rate_projects_write_up_down == o.hourly_rate_projects_write_up_down &&
          default_project_contract_comment == o.default_project_contract_comment &&
          default_project_invoicing_comment == o.default_project_invoicing_comment &&
          resource_planning == o.resource_planning &&
          resource_groups == o.resource_groups &&
          holiday_plan == o.holiday_plan &&
          resource_plan_period == o.resource_plan_period &&
          control_forms_required_for_invoicing == o.control_forms_required_for_invoicing &&
          control_forms_required_for_hour_tracking == o.control_forms_required_for_hour_tracking &&
          use_logged_in_user_email_on_project_budget == o.use_logged_in_user_email_on_project_budget &&
          email_on_project_budget == o.email_on_project_budget &&
          use_logged_in_user_email_on_project_contract == o.use_logged_in_user_email_on_project_contract &&
          email_on_project_contract == o.email_on_project_contract &&
          use_logged_in_user_email_on_documents == o.use_logged_in_user_email_on_documents &&
          email_on_documents == o.email_on_documents
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [approve_hour_lists, approve_invoices, mark_ready_for_invoicing, historical_information, project_forecast, budget_on_subcontracts, project_categories, reference_fee, sort_order_projects, auto_close_invoiced_projects, must_approve_registered_hours, show_project_order_lines_to_all_project_participants, hour_cost_percentage, fixed_price_projects_fee_calc_method, fixed_price_projects_invoice_by_progress, project_budget_reference_fee, allow_multiple_project_invoice_vat, standard_reinvoicing, is_current_month_default_period, auto_generate_project_number, auto_generate_starting_number, project_name_scheme, project_type_of_contract, project_order_lines_sort_order, project_hourly_rate_model, only_project_members_can_register_info, only_project_activities_timesheet_registration, hourly_rate_projects_write_up_down, default_project_contract_comment, default_project_invoicing_comment, resource_planning, resource_groups, holiday_plan, resource_plan_period, control_forms_required_for_invoicing, control_forms_required_for_hour_tracking, use_logged_in_user_email_on_project_budget, email_on_project_budget, use_logged_in_user_email_on_project_contract, email_on_project_contract, use_logged_in_user_email_on_documents, email_on_documents].hash
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
