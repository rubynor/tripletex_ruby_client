=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class Project
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    attr_accessor :name

    attr_accessor :number

    attr_accessor :display_name

    attr_accessor :description

    attr_accessor :project_manager

    attr_accessor :department

    attr_accessor :main_project

    attr_accessor :start_date

    attr_accessor :end_date

    # The project's customer
    attr_accessor :customer

    attr_accessor :is_closed

    attr_accessor :is_ready_for_invoicing

    attr_accessor :is_internal

    attr_accessor :is_offer

    # Project is fixed price if set to true, hourly rate if set to false.
    attr_accessor :is_fixed_price

    attr_accessor :project_category

    attr_accessor :delivery_address

    # Defines project name presentation in overviews.
    attr_accessor :display_name_format

    attr_accessor :reference

    attr_accessor :external_accounts_number

    # Project discount percentage.
    attr_accessor :discount_percentage

    # The default vat type for this project.
    attr_accessor :vat_type

    # Fixed price amount, in the project's currency.
    attr_accessor :fixedprice

    attr_accessor :contribution_margin_percent

    attr_accessor :number_of_sub_projects

    attr_accessor :number_of_project_participants

    # Order lines tied to the order
    attr_accessor :order_lines

    attr_accessor :currency

    # Set mark-up (%) for order lines.
    attr_accessor :mark_up_order_lines

    # Set mark-up (%) for fees earned.
    attr_accessor :mark_up_fees_earned

    # Set to true if an hourly rate project has a price ceiling.
    attr_accessor :is_price_ceiling

    # Price ceiling amount, in the project's currency.
    attr_accessor :price_ceiling_amount

    # Project Rate Types tied to the project.
    attr_accessor :project_hourly_rates

    # Set to true if only project participants can register information on the project
    attr_accessor :for_participants_only

    # Link to individual project participants.
    attr_accessor :participants

    # Customer contact person.
    attr_accessor :contact

    # Customer in attention of person
    attr_accessor :attention

    # Comment for project invoices
    attr_accessor :invoice_comment

    # Invoicing plans tied to the project
    attr_accessor :invoicing_plan

    attr_accessor :preliminary_invoice

    # Set to true if a general project activity must be linked to project to allow time tracking.
    attr_accessor :general_project_activities_per_project_only

    # Project Activities
    attr_accessor :project_activities

    attr_accessor :hierarchy_name_and_number

    # invoice due date
    attr_accessor :invoice_due_date

    # receiver email
    attr_accessor :invoice_receiver_email

    # READ/WRITE access on project
    attr_accessor :access_type

    attr_accessor :use_product_net_price

    attr_accessor :ignore_company_product_discount_agreement

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
        :'id' => :'id',
        :'version' => :'version',
        :'changes' => :'changes',
        :'url' => :'url',
        :'name' => :'name',
        :'number' => :'number',
        :'display_name' => :'displayName',
        :'description' => :'description',
        :'project_manager' => :'projectManager',
        :'department' => :'department',
        :'main_project' => :'mainProject',
        :'start_date' => :'startDate',
        :'end_date' => :'endDate',
        :'customer' => :'customer',
        :'is_closed' => :'isClosed',
        :'is_ready_for_invoicing' => :'isReadyForInvoicing',
        :'is_internal' => :'isInternal',
        :'is_offer' => :'isOffer',
        :'is_fixed_price' => :'isFixedPrice',
        :'project_category' => :'projectCategory',
        :'delivery_address' => :'deliveryAddress',
        :'display_name_format' => :'displayNameFormat',
        :'reference' => :'reference',
        :'external_accounts_number' => :'externalAccountsNumber',
        :'discount_percentage' => :'discountPercentage',
        :'vat_type' => :'vatType',
        :'fixedprice' => :'fixedprice',
        :'contribution_margin_percent' => :'contributionMarginPercent',
        :'number_of_sub_projects' => :'numberOfSubProjects',
        :'number_of_project_participants' => :'numberOfProjectParticipants',
        :'order_lines' => :'orderLines',
        :'currency' => :'currency',
        :'mark_up_order_lines' => :'markUpOrderLines',
        :'mark_up_fees_earned' => :'markUpFeesEarned',
        :'is_price_ceiling' => :'isPriceCeiling',
        :'price_ceiling_amount' => :'priceCeilingAmount',
        :'project_hourly_rates' => :'projectHourlyRates',
        :'for_participants_only' => :'forParticipantsOnly',
        :'participants' => :'participants',
        :'contact' => :'contact',
        :'attention' => :'attention',
        :'invoice_comment' => :'invoiceComment',
        :'invoicing_plan' => :'invoicingPlan',
        :'preliminary_invoice' => :'preliminaryInvoice',
        :'general_project_activities_per_project_only' => :'generalProjectActivitiesPerProjectOnly',
        :'project_activities' => :'projectActivities',
        :'hierarchy_name_and_number' => :'hierarchyNameAndNumber',
        :'invoice_due_date' => :'invoiceDueDate',
        :'invoice_receiver_email' => :'invoiceReceiverEmail',
        :'access_type' => :'accessType',
        :'use_product_net_price' => :'useProductNetPrice',
        :'ignore_company_product_discount_agreement' => :'ignoreCompanyProductDiscountAgreement'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'name' => :'String',
        :'number' => :'String',
        :'display_name' => :'String',
        :'description' => :'String',
        :'project_manager' => :'Employee',
        :'department' => :'Department',
        :'main_project' => :'Project',
        :'start_date' => :'String',
        :'end_date' => :'String',
        :'customer' => :'Customer',
        :'is_closed' => :'BOOLEAN',
        :'is_ready_for_invoicing' => :'BOOLEAN',
        :'is_internal' => :'BOOLEAN',
        :'is_offer' => :'BOOLEAN',
        :'is_fixed_price' => :'BOOLEAN',
        :'project_category' => :'ProjectCategory',
        :'delivery_address' => :'DeliveryAddress',
        :'display_name_format' => :'String',
        :'reference' => :'String',
        :'external_accounts_number' => :'String',
        :'discount_percentage' => :'Float',
        :'vat_type' => :'VatType',
        :'fixedprice' => :'Float',
        :'contribution_margin_percent' => :'Float',
        :'number_of_sub_projects' => :'Integer',
        :'number_of_project_participants' => :'Integer',
        :'order_lines' => :'Array<ProjectOrderLine>',
        :'currency' => :'Currency',
        :'mark_up_order_lines' => :'Float',
        :'mark_up_fees_earned' => :'Float',
        :'is_price_ceiling' => :'BOOLEAN',
        :'price_ceiling_amount' => :'Float',
        :'project_hourly_rates' => :'Array<ProjectHourlyRate>',
        :'for_participants_only' => :'BOOLEAN',
        :'participants' => :'Array<ProjectParticipant>',
        :'contact' => :'Contact',
        :'attention' => :'Contact',
        :'invoice_comment' => :'String',
        :'invoicing_plan' => :'Array<Invoice>',
        :'preliminary_invoice' => :'Invoice',
        :'general_project_activities_per_project_only' => :'BOOLEAN',
        :'project_activities' => :'Array<ProjectActivity>',
        :'hierarchy_name_and_number' => :'String',
        :'invoice_due_date' => :'Integer',
        :'invoice_receiver_email' => :'String',
        :'access_type' => :'String',
        :'use_product_net_price' => :'BOOLEAN',
        :'ignore_company_product_discount_agreement' => :'BOOLEAN'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'version')
        self.version = attributes[:'version']
      end

      if attributes.has_key?(:'changes')
        if (value = attributes[:'changes']).is_a?(Array)
          self.changes = value
        end
      end

      if attributes.has_key?(:'url')
        self.url = attributes[:'url']
      end

      if attributes.has_key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.has_key?(:'number')
        self.number = attributes[:'number']
      end

      if attributes.has_key?(:'displayName')
        self.display_name = attributes[:'displayName']
      end

      if attributes.has_key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.has_key?(:'projectManager')
        self.project_manager = attributes[:'projectManager']
      end

      if attributes.has_key?(:'department')
        self.department = attributes[:'department']
      end

      if attributes.has_key?(:'mainProject')
        self.main_project = attributes[:'mainProject']
      end

      if attributes.has_key?(:'startDate')
        self.start_date = attributes[:'startDate']
      end

      if attributes.has_key?(:'endDate')
        self.end_date = attributes[:'endDate']
      end

      if attributes.has_key?(:'customer')
        self.customer = attributes[:'customer']
      end

      if attributes.has_key?(:'isClosed')
        self.is_closed = attributes[:'isClosed']
      end

      if attributes.has_key?(:'isReadyForInvoicing')
        self.is_ready_for_invoicing = attributes[:'isReadyForInvoicing']
      end

      if attributes.has_key?(:'isInternal')
        self.is_internal = attributes[:'isInternal']
      end

      if attributes.has_key?(:'isOffer')
        self.is_offer = attributes[:'isOffer']
      end

      if attributes.has_key?(:'isFixedPrice')
        self.is_fixed_price = attributes[:'isFixedPrice']
      end

      if attributes.has_key?(:'projectCategory')
        self.project_category = attributes[:'projectCategory']
      end

      if attributes.has_key?(:'deliveryAddress')
        self.delivery_address = attributes[:'deliveryAddress']
      end

      if attributes.has_key?(:'displayNameFormat')
        self.display_name_format = attributes[:'displayNameFormat']
      end

      if attributes.has_key?(:'reference')
        self.reference = attributes[:'reference']
      end

      if attributes.has_key?(:'externalAccountsNumber')
        self.external_accounts_number = attributes[:'externalAccountsNumber']
      end

      if attributes.has_key?(:'discountPercentage')
        self.discount_percentage = attributes[:'discountPercentage']
      end

      if attributes.has_key?(:'vatType')
        self.vat_type = attributes[:'vatType']
      end

      if attributes.has_key?(:'fixedprice')
        self.fixedprice = attributes[:'fixedprice']
      end

      if attributes.has_key?(:'contributionMarginPercent')
        self.contribution_margin_percent = attributes[:'contributionMarginPercent']
      end

      if attributes.has_key?(:'numberOfSubProjects')
        self.number_of_sub_projects = attributes[:'numberOfSubProjects']
      end

      if attributes.has_key?(:'numberOfProjectParticipants')
        self.number_of_project_participants = attributes[:'numberOfProjectParticipants']
      end

      if attributes.has_key?(:'orderLines')
        if (value = attributes[:'orderLines']).is_a?(Array)
          self.order_lines = value
        end
      end

      if attributes.has_key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.has_key?(:'markUpOrderLines')
        self.mark_up_order_lines = attributes[:'markUpOrderLines']
      end

      if attributes.has_key?(:'markUpFeesEarned')
        self.mark_up_fees_earned = attributes[:'markUpFeesEarned']
      end

      if attributes.has_key?(:'isPriceCeiling')
        self.is_price_ceiling = attributes[:'isPriceCeiling']
      end

      if attributes.has_key?(:'priceCeilingAmount')
        self.price_ceiling_amount = attributes[:'priceCeilingAmount']
      end

      if attributes.has_key?(:'projectHourlyRates')
        if (value = attributes[:'projectHourlyRates']).is_a?(Array)
          self.project_hourly_rates = value
        end
      end

      if attributes.has_key?(:'forParticipantsOnly')
        self.for_participants_only = attributes[:'forParticipantsOnly']
      end

      if attributes.has_key?(:'participants')
        if (value = attributes[:'participants']).is_a?(Array)
          self.participants = value
        end
      end

      if attributes.has_key?(:'contact')
        self.contact = attributes[:'contact']
      end

      if attributes.has_key?(:'attention')
        self.attention = attributes[:'attention']
      end

      if attributes.has_key?(:'invoiceComment')
        self.invoice_comment = attributes[:'invoiceComment']
      end

      if attributes.has_key?(:'invoicingPlan')
        if (value = attributes[:'invoicingPlan']).is_a?(Array)
          self.invoicing_plan = value
        end
      end

      if attributes.has_key?(:'preliminaryInvoice')
        self.preliminary_invoice = attributes[:'preliminaryInvoice']
      end

      if attributes.has_key?(:'generalProjectActivitiesPerProjectOnly')
        self.general_project_activities_per_project_only = attributes[:'generalProjectActivitiesPerProjectOnly']
      end

      if attributes.has_key?(:'projectActivities')
        if (value = attributes[:'projectActivities']).is_a?(Array)
          self.project_activities = value
        end
      end

      if attributes.has_key?(:'hierarchyNameAndNumber')
        self.hierarchy_name_and_number = attributes[:'hierarchyNameAndNumber']
      end

      if attributes.has_key?(:'invoiceDueDate')
        self.invoice_due_date = attributes[:'invoiceDueDate']
      end

      if attributes.has_key?(:'invoiceReceiverEmail')
        self.invoice_receiver_email = attributes[:'invoiceReceiverEmail']
      end

      if attributes.has_key?(:'accessType')
        self.access_type = attributes[:'accessType']
      end

      if attributes.has_key?(:'useProductNetPrice')
        self.use_product_net_price = attributes[:'useProductNetPrice']
      end

      if attributes.has_key?(:'ignoreCompanyProductDiscountAgreement')
        self.ignore_company_product_discount_agreement = attributes[:'ignoreCompanyProductDiscountAgreement']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @name.nil?
        invalid_properties.push('invalid value for "name", name cannot be nil.')
      end

      if @name.to_s.length > 255
        invalid_properties.push('invalid value for "name", the character length must be smaller than or equal to 255.')
      end

      if !@number.nil? && @number.to_s.length > 100
        invalid_properties.push('invalid value for "number", the character length must be smaller than or equal to 100.')
      end

      if @project_manager.nil?
        invalid_properties.push('invalid value for "project_manager", project_manager cannot be nil.')
      end

      if @start_date.nil?
        invalid_properties.push('invalid value for "start_date", start_date cannot be nil.')
      end

      if @is_internal.nil?
        invalid_properties.push('invalid value for "is_internal", is_internal cannot be nil.')
      end

      if !@reference.nil? && @reference.to_s.length > 255
        invalid_properties.push('invalid value for "reference", the character length must be smaller than or equal to 255.')
      end

      if !@external_accounts_number.nil? && @external_accounts_number.to_s.length > 100
        invalid_properties.push('invalid value for "external_accounts_number", the character length must be smaller than or equal to 100.')
      end

      if !@invoice_receiver_email.nil? && @invoice_receiver_email.to_s.length > 254
        invalid_properties.push('invalid value for "invoice_receiver_email", the character length must be smaller than or equal to 254.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @name.nil?
      return false if @name.to_s.length > 255
      return false if !@number.nil? && @number.to_s.length > 100
      return false if @project_manager.nil?
      return false if @start_date.nil?
      return false if @is_internal.nil?
      display_name_format_validator = EnumAttributeValidator.new('String', ['NAME_STANDARD', 'NAME_INCL_CUSTOMER_NAME', 'NAME_INCL_PARENT_NAME', 'NAME_INCL_PARENT_NUMBER', 'NAME_INCL_PARENT_NAME_AND_NUMBER'])
      return false unless display_name_format_validator.valid?(@display_name_format)
      return false if !@reference.nil? && @reference.to_s.length > 255
      return false if !@external_accounts_number.nil? && @external_accounts_number.to_s.length > 100
      return false if !@invoice_receiver_email.nil? && @invoice_receiver_email.to_s.length > 254
      access_type_validator = EnumAttributeValidator.new('String', ['NONE', 'READ', 'WRITE'])
      return false unless access_type_validator.valid?(@access_type)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] name Value to be assigned
    def name=(name)
      if name.nil?
        fail ArgumentError, 'name cannot be nil'
      end

      if name.to_s.length > 255
        fail ArgumentError, 'invalid value for "name", the character length must be smaller than or equal to 255.'
      end

      @name = name
    end

    # Custom attribute writer method with validation
    # @param [Object] number Value to be assigned
    def number=(number)
      if !number.nil? && number.to_s.length > 100
        fail ArgumentError, 'invalid value for "number", the character length must be smaller than or equal to 100.'
      end

      @number = number
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] display_name_format Object to be assigned
    def display_name_format=(display_name_format)
      validator = EnumAttributeValidator.new('String', ['NAME_STANDARD', 'NAME_INCL_CUSTOMER_NAME', 'NAME_INCL_PARENT_NAME', 'NAME_INCL_PARENT_NUMBER', 'NAME_INCL_PARENT_NAME_AND_NUMBER'])
      unless validator.valid?(display_name_format)
        fail ArgumentError, 'invalid value for "display_name_format", must be one of #{validator.allowable_values}.'
      end
      @display_name_format = display_name_format
    end

    # Custom attribute writer method with validation
    # @param [Object] reference Value to be assigned
    def reference=(reference)
      if !reference.nil? && reference.to_s.length > 255
        fail ArgumentError, 'invalid value for "reference", the character length must be smaller than or equal to 255.'
      end

      @reference = reference
    end

    # Custom attribute writer method with validation
    # @param [Object] external_accounts_number Value to be assigned
    def external_accounts_number=(external_accounts_number)
      if !external_accounts_number.nil? && external_accounts_number.to_s.length > 100
        fail ArgumentError, 'invalid value for "external_accounts_number", the character length must be smaller than or equal to 100.'
      end

      @external_accounts_number = external_accounts_number
    end

    # Custom attribute writer method with validation
    # @param [Object] invoice_receiver_email Value to be assigned
    def invoice_receiver_email=(invoice_receiver_email)
      if !invoice_receiver_email.nil? && invoice_receiver_email.to_s.length > 254
        fail ArgumentError, 'invalid value for "invoice_receiver_email", the character length must be smaller than or equal to 254.'
      end

      @invoice_receiver_email = invoice_receiver_email
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] access_type Object to be assigned
    def access_type=(access_type)
      validator = EnumAttributeValidator.new('String', ['NONE', 'READ', 'WRITE'])
      unless validator.valid?(access_type)
        fail ArgumentError, 'invalid value for "access_type", must be one of #{validator.allowable_values}.'
      end
      @access_type = access_type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          version == o.version &&
          changes == o.changes &&
          url == o.url &&
          name == o.name &&
          number == o.number &&
          display_name == o.display_name &&
          description == o.description &&
          project_manager == o.project_manager &&
          department == o.department &&
          main_project == o.main_project &&
          start_date == o.start_date &&
          end_date == o.end_date &&
          customer == o.customer &&
          is_closed == o.is_closed &&
          is_ready_for_invoicing == o.is_ready_for_invoicing &&
          is_internal == o.is_internal &&
          is_offer == o.is_offer &&
          is_fixed_price == o.is_fixed_price &&
          project_category == o.project_category &&
          delivery_address == o.delivery_address &&
          display_name_format == o.display_name_format &&
          reference == o.reference &&
          external_accounts_number == o.external_accounts_number &&
          discount_percentage == o.discount_percentage &&
          vat_type == o.vat_type &&
          fixedprice == o.fixedprice &&
          contribution_margin_percent == o.contribution_margin_percent &&
          number_of_sub_projects == o.number_of_sub_projects &&
          number_of_project_participants == o.number_of_project_participants &&
          order_lines == o.order_lines &&
          currency == o.currency &&
          mark_up_order_lines == o.mark_up_order_lines &&
          mark_up_fees_earned == o.mark_up_fees_earned &&
          is_price_ceiling == o.is_price_ceiling &&
          price_ceiling_amount == o.price_ceiling_amount &&
          project_hourly_rates == o.project_hourly_rates &&
          for_participants_only == o.for_participants_only &&
          participants == o.participants &&
          contact == o.contact &&
          attention == o.attention &&
          invoice_comment == o.invoice_comment &&
          invoicing_plan == o.invoicing_plan &&
          preliminary_invoice == o.preliminary_invoice &&
          general_project_activities_per_project_only == o.general_project_activities_per_project_only &&
          project_activities == o.project_activities &&
          hierarchy_name_and_number == o.hierarchy_name_and_number &&
          invoice_due_date == o.invoice_due_date &&
          invoice_receiver_email == o.invoice_receiver_email &&
          access_type == o.access_type &&
          use_product_net_price == o.use_product_net_price &&
          ignore_company_product_discount_agreement == o.ignore_company_product_discount_agreement
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, name, number, display_name, description, project_manager, department, main_project, start_date, end_date, customer, is_closed, is_ready_for_invoicing, is_internal, is_offer, is_fixed_price, project_category, delivery_address, display_name_format, reference, external_accounts_number, discount_percentage, vat_type, fixedprice, contribution_margin_percent, number_of_sub_projects, number_of_project_participants, order_lines, currency, mark_up_order_lines, mark_up_fees_earned, is_price_ceiling, price_ceiling_amount, project_hourly_rates, for_participants_only, participants, contact, attention, invoice_comment, invoicing_plan, preliminary_invoice, general_project_activities_per_project_only, project_activities, hierarchy_name_and_number, invoice_due_date, invoice_receiver_email, access_type, use_product_net_price, ignore_company_product_discount_agreement].hash
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
