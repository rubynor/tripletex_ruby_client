=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class Order
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    attr_accessor :customer

    attr_accessor :contact

    attr_accessor :attn

    attr_accessor :receiver_email

    attr_accessor :overdue_notice_email

    attr_accessor :number

    attr_accessor :reference

    # If the contact is not an employee
    attr_accessor :our_contact

    # If the contact is an employee
    attr_accessor :our_contact_employee

    attr_accessor :department

    attr_accessor :order_date

    attr_accessor :project

    # Comment to be displayed in the invoice based on this order. Can be also found in Invoice.invoiceComment on Invoice objects.
    attr_accessor :invoice_comment

    attr_accessor :currency

    # Number of days/months in which invoices created from this order is due
    attr_accessor :invoices_due_in

    # Set the time unit of invoicesDueIn. The special case RECURRING_DAY_OF_MONTH enables the due date to be fixed to a specific day of the month, in this case the fixed due date will automatically be set as standard on all invoices created from this order. Note that when RECURRING_DAY_OF_MONTH is set, the due date will be set to the last day of month if \"31\" is set in invoicesDueIn.
    attr_accessor :invoices_due_in_type

    # Show account statement - open posts on invoices created from this order
    attr_accessor :is_show_open_posts_on_invoices

    # Denotes if this order is closed. A closed order can no longer be invoiced unless it is opened again.
    attr_accessor :is_closed

    attr_accessor :delivery_date

    # Delivery address of this order. This can be a new or existing address (useful to know, especially if the delivery is to a private person: if 'deliveryAddress.name' is set, we ignore the state of 'customer.id')
    attr_accessor :delivery_address

    attr_accessor :delivery_comment

    attr_accessor :is_prioritize_amounts_including_vat

    attr_accessor :order_line_sorting

    # Order lines tied to the order. New OrderLines may be embedded here, in some endpoints.
    attr_accessor :order_lines

    # If true, the order is a subscription, which enables periodical invoicing of order lines. First, create an order with isSubscription=true, then approve it for subscription invoicing with the :approveSubscriptionInvoice method.
    attr_accessor :is_subscription

    # Number of months/years the subscription shall run
    attr_accessor :subscription_duration

    # The time unit of subscriptionDuration
    attr_accessor :subscription_duration_type

    # Number of periods on each invoice
    attr_accessor :subscription_periods_on_invoice

    # The time unit of subscriptionPeriodsOnInvoice
    attr_accessor :subscription_periods_on_invoice_type

    # Invoicing in advance/in arrears
    attr_accessor :subscription_invoicing_time_in_advance_or_arrears

    # Number of days/months invoicing in advance/in arrears
    attr_accessor :subscription_invoicing_time

    # The time unit of subscriptionInvoicingTime
    attr_accessor :subscription_invoicing_time_type

    # Automatic invoicing. Starts when the subscription is approved
    attr_accessor :is_subscription_auto_invoicing

    # [BETA] Preliminary invoice if order is not charged
    attr_accessor :preliminary_invoice

    # [BETA] Attachments belonging to this order
    attr_accessor :attachment

    # Description of how this invoice will be sent
    attr_accessor :send_method_description

    attr_accessor :can_create_backorder

    # Is the on account(a konto) amounts including vat 
    attr_accessor :invoice_on_account_vat_high

    # Amount paid on account(a konto)
    attr_accessor :total_invoiced_on_account_amount_absolute_currency

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
        :'customer' => :'customer',
        :'contact' => :'contact',
        :'attn' => :'attn',
        :'receiver_email' => :'receiverEmail',
        :'overdue_notice_email' => :'overdueNoticeEmail',
        :'number' => :'number',
        :'reference' => :'reference',
        :'our_contact' => :'ourContact',
        :'our_contact_employee' => :'ourContactEmployee',
        :'department' => :'department',
        :'order_date' => :'orderDate',
        :'project' => :'project',
        :'invoice_comment' => :'invoiceComment',
        :'currency' => :'currency',
        :'invoices_due_in' => :'invoicesDueIn',
        :'invoices_due_in_type' => :'invoicesDueInType',
        :'is_show_open_posts_on_invoices' => :'isShowOpenPostsOnInvoices',
        :'is_closed' => :'isClosed',
        :'delivery_date' => :'deliveryDate',
        :'delivery_address' => :'deliveryAddress',
        :'delivery_comment' => :'deliveryComment',
        :'is_prioritize_amounts_including_vat' => :'isPrioritizeAmountsIncludingVat',
        :'order_line_sorting' => :'orderLineSorting',
        :'order_lines' => :'orderLines',
        :'is_subscription' => :'isSubscription',
        :'subscription_duration' => :'subscriptionDuration',
        :'subscription_duration_type' => :'subscriptionDurationType',
        :'subscription_periods_on_invoice' => :'subscriptionPeriodsOnInvoice',
        :'subscription_periods_on_invoice_type' => :'subscriptionPeriodsOnInvoiceType',
        :'subscription_invoicing_time_in_advance_or_arrears' => :'subscriptionInvoicingTimeInAdvanceOrArrears',
        :'subscription_invoicing_time' => :'subscriptionInvoicingTime',
        :'subscription_invoicing_time_type' => :'subscriptionInvoicingTimeType',
        :'is_subscription_auto_invoicing' => :'isSubscriptionAutoInvoicing',
        :'preliminary_invoice' => :'preliminaryInvoice',
        :'attachment' => :'attachment',
        :'send_method_description' => :'sendMethodDescription',
        :'can_create_backorder' => :'canCreateBackorder',
        :'invoice_on_account_vat_high' => :'invoiceOnAccountVatHigh',
        :'total_invoiced_on_account_amount_absolute_currency' => :'totalInvoicedOnAccountAmountAbsoluteCurrency'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'customer' => :'Customer',
        :'contact' => :'Contact',
        :'attn' => :'Contact',
        :'receiver_email' => :'String',
        :'overdue_notice_email' => :'String',
        :'number' => :'String',
        :'reference' => :'String',
        :'our_contact' => :'Contact',
        :'our_contact_employee' => :'Employee',
        :'department' => :'Department',
        :'order_date' => :'String',
        :'project' => :'Project',
        :'invoice_comment' => :'String',
        :'currency' => :'Currency',
        :'invoices_due_in' => :'Integer',
        :'invoices_due_in_type' => :'String',
        :'is_show_open_posts_on_invoices' => :'BOOLEAN',
        :'is_closed' => :'BOOLEAN',
        :'delivery_date' => :'String',
        :'delivery_address' => :'DeliveryAddress',
        :'delivery_comment' => :'String',
        :'is_prioritize_amounts_including_vat' => :'BOOLEAN',
        :'order_line_sorting' => :'String',
        :'order_lines' => :'Array<OrderLine>',
        :'is_subscription' => :'BOOLEAN',
        :'subscription_duration' => :'Integer',
        :'subscription_duration_type' => :'String',
        :'subscription_periods_on_invoice' => :'Integer',
        :'subscription_periods_on_invoice_type' => :'String',
        :'subscription_invoicing_time_in_advance_or_arrears' => :'String',
        :'subscription_invoicing_time' => :'Integer',
        :'subscription_invoicing_time_type' => :'String',
        :'is_subscription_auto_invoicing' => :'BOOLEAN',
        :'preliminary_invoice' => :'Invoice',
        :'attachment' => :'Array<Document>',
        :'send_method_description' => :'String',
        :'can_create_backorder' => :'BOOLEAN',
        :'invoice_on_account_vat_high' => :'BOOLEAN',
        :'total_invoiced_on_account_amount_absolute_currency' => :'Float'
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

      if attributes.has_key?(:'customer')
        self.customer = attributes[:'customer']
      end

      if attributes.has_key?(:'contact')
        self.contact = attributes[:'contact']
      end

      if attributes.has_key?(:'attn')
        self.attn = attributes[:'attn']
      end

      if attributes.has_key?(:'receiverEmail')
        self.receiver_email = attributes[:'receiverEmail']
      end

      if attributes.has_key?(:'overdueNoticeEmail')
        self.overdue_notice_email = attributes[:'overdueNoticeEmail']
      end

      if attributes.has_key?(:'number')
        self.number = attributes[:'number']
      end

      if attributes.has_key?(:'reference')
        self.reference = attributes[:'reference']
      end

      if attributes.has_key?(:'ourContact')
        self.our_contact = attributes[:'ourContact']
      end

      if attributes.has_key?(:'ourContactEmployee')
        self.our_contact_employee = attributes[:'ourContactEmployee']
      end

      if attributes.has_key?(:'department')
        self.department = attributes[:'department']
      end

      if attributes.has_key?(:'orderDate')
        self.order_date = attributes[:'orderDate']
      end

      if attributes.has_key?(:'project')
        self.project = attributes[:'project']
      end

      if attributes.has_key?(:'invoiceComment')
        self.invoice_comment = attributes[:'invoiceComment']
      end

      if attributes.has_key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.has_key?(:'invoicesDueIn')
        self.invoices_due_in = attributes[:'invoicesDueIn']
      end

      if attributes.has_key?(:'invoicesDueInType')
        self.invoices_due_in_type = attributes[:'invoicesDueInType']
      end

      if attributes.has_key?(:'isShowOpenPostsOnInvoices')
        self.is_show_open_posts_on_invoices = attributes[:'isShowOpenPostsOnInvoices']
      end

      if attributes.has_key?(:'isClosed')
        self.is_closed = attributes[:'isClosed']
      end

      if attributes.has_key?(:'deliveryDate')
        self.delivery_date = attributes[:'deliveryDate']
      end

      if attributes.has_key?(:'deliveryAddress')
        self.delivery_address = attributes[:'deliveryAddress']
      end

      if attributes.has_key?(:'deliveryComment')
        self.delivery_comment = attributes[:'deliveryComment']
      end

      if attributes.has_key?(:'isPrioritizeAmountsIncludingVat')
        self.is_prioritize_amounts_including_vat = attributes[:'isPrioritizeAmountsIncludingVat']
      end

      if attributes.has_key?(:'orderLineSorting')
        self.order_line_sorting = attributes[:'orderLineSorting']
      end

      if attributes.has_key?(:'orderLines')
        if (value = attributes[:'orderLines']).is_a?(Array)
          self.order_lines = value
        end
      end

      if attributes.has_key?(:'isSubscription')
        self.is_subscription = attributes[:'isSubscription']
      end

      if attributes.has_key?(:'subscriptionDuration')
        self.subscription_duration = attributes[:'subscriptionDuration']
      end

      if attributes.has_key?(:'subscriptionDurationType')
        self.subscription_duration_type = attributes[:'subscriptionDurationType']
      end

      if attributes.has_key?(:'subscriptionPeriodsOnInvoice')
        self.subscription_periods_on_invoice = attributes[:'subscriptionPeriodsOnInvoice']
      end

      if attributes.has_key?(:'subscriptionPeriodsOnInvoiceType')
        self.subscription_periods_on_invoice_type = attributes[:'subscriptionPeriodsOnInvoiceType']
      end

      if attributes.has_key?(:'subscriptionInvoicingTimeInAdvanceOrArrears')
        self.subscription_invoicing_time_in_advance_or_arrears = attributes[:'subscriptionInvoicingTimeInAdvanceOrArrears']
      end

      if attributes.has_key?(:'subscriptionInvoicingTime')
        self.subscription_invoicing_time = attributes[:'subscriptionInvoicingTime']
      end

      if attributes.has_key?(:'subscriptionInvoicingTimeType')
        self.subscription_invoicing_time_type = attributes[:'subscriptionInvoicingTimeType']
      end

      if attributes.has_key?(:'isSubscriptionAutoInvoicing')
        self.is_subscription_auto_invoicing = attributes[:'isSubscriptionAutoInvoicing']
      end

      if attributes.has_key?(:'preliminaryInvoice')
        self.preliminary_invoice = attributes[:'preliminaryInvoice']
      end

      if attributes.has_key?(:'attachment')
        if (value = attributes[:'attachment']).is_a?(Array)
          self.attachment = value
        end
      end

      if attributes.has_key?(:'sendMethodDescription')
        self.send_method_description = attributes[:'sendMethodDescription']
      end

      if attributes.has_key?(:'canCreateBackorder')
        self.can_create_backorder = attributes[:'canCreateBackorder']
      end

      if attributes.has_key?(:'invoiceOnAccountVatHigh')
        self.invoice_on_account_vat_high = attributes[:'invoiceOnAccountVatHigh']
      end

      if attributes.has_key?(:'totalInvoicedOnAccountAmountAbsoluteCurrency')
        self.total_invoiced_on_account_amount_absolute_currency = attributes[:'totalInvoicedOnAccountAmountAbsoluteCurrency']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @customer.nil?
        invalid_properties.push('invalid value for "customer", customer cannot be nil.')
      end

      if !@receiver_email.nil? && @receiver_email.to_s.length > 254
        invalid_properties.push('invalid value for "receiver_email", the character length must be smaller than or equal to 254.')
      end

      if !@overdue_notice_email.nil? && @overdue_notice_email.to_s.length > 254
        invalid_properties.push('invalid value for "overdue_notice_email", the character length must be smaller than or equal to 254.')
      end

      if !@number.nil? && @number.to_s.length > 100
        invalid_properties.push('invalid value for "number", the character length must be smaller than or equal to 100.')
      end

      if !@reference.nil? && @reference.to_s.length > 255
        invalid_properties.push('invalid value for "reference", the character length must be smaller than or equal to 255.')
      end

      if @order_date.nil?
        invalid_properties.push('invalid value for "order_date", order_date cannot be nil.')
      end

      if !@invoices_due_in.nil? && @invoices_due_in > 10000
        invalid_properties.push('invalid value for "invoices_due_in", must be smaller than or equal to 10000.')
      end

      if !@invoices_due_in.nil? && @invoices_due_in < 0
        invalid_properties.push('invalid value for "invoices_due_in", must be greater than or equal to 0.')
      end

      if @delivery_date.nil?
        invalid_properties.push('invalid value for "delivery_date", delivery_date cannot be nil.')
      end

      if !@subscription_duration.nil? && @subscription_duration < 0
        invalid_properties.push('invalid value for "subscription_duration", must be greater than or equal to 0.')
      end

      if !@subscription_periods_on_invoice.nil? && @subscription_periods_on_invoice < 0
        invalid_properties.push('invalid value for "subscription_periods_on_invoice", must be greater than or equal to 0.')
      end

      if !@subscription_invoicing_time.nil? && @subscription_invoicing_time < 0
        invalid_properties.push('invalid value for "subscription_invoicing_time", must be greater than or equal to 0.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @customer.nil?
      return false if !@receiver_email.nil? && @receiver_email.to_s.length > 254
      return false if !@overdue_notice_email.nil? && @overdue_notice_email.to_s.length > 254
      return false if !@number.nil? && @number.to_s.length > 100
      return false if !@reference.nil? && @reference.to_s.length > 255
      return false if @order_date.nil?
      return false if !@invoices_due_in.nil? && @invoices_due_in > 10000
      return false if !@invoices_due_in.nil? && @invoices_due_in < 0
      invoices_due_in_type_validator = EnumAttributeValidator.new('String', ['DAYS', 'MONTHS', 'RECURRING_DAY_OF_MONTH'])
      return false unless invoices_due_in_type_validator.valid?(@invoices_due_in_type)
      return false if @delivery_date.nil?
      order_line_sorting_validator = EnumAttributeValidator.new('String', ['ID', 'PRODUCT', 'CUSTOM'])
      return false unless order_line_sorting_validator.valid?(@order_line_sorting)
      return false if !@subscription_duration.nil? && @subscription_duration < 0
      subscription_duration_type_validator = EnumAttributeValidator.new('String', ['MONTHS', 'YEAR'])
      return false unless subscription_duration_type_validator.valid?(@subscription_duration_type)
      return false if !@subscription_periods_on_invoice.nil? && @subscription_periods_on_invoice < 0
      subscription_periods_on_invoice_type_validator = EnumAttributeValidator.new('String', ['MONTHS'])
      return false unless subscription_periods_on_invoice_type_validator.valid?(@subscription_periods_on_invoice_type)
      subscription_invoicing_time_in_advance_or_arrears_validator = EnumAttributeValidator.new('String', ['ADVANCE', 'ARREARS'])
      return false unless subscription_invoicing_time_in_advance_or_arrears_validator.valid?(@subscription_invoicing_time_in_advance_or_arrears)
      return false if !@subscription_invoicing_time.nil? && @subscription_invoicing_time < 0
      subscription_invoicing_time_type_validator = EnumAttributeValidator.new('String', ['DAYS', 'MONTHS'])
      return false unless subscription_invoicing_time_type_validator.valid?(@subscription_invoicing_time_type)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] receiver_email Value to be assigned
    def receiver_email=(receiver_email)
      if !receiver_email.nil? && receiver_email.to_s.length > 254
        fail ArgumentError, 'invalid value for "receiver_email", the character length must be smaller than or equal to 254.'
      end

      @receiver_email = receiver_email
    end

    # Custom attribute writer method with validation
    # @param [Object] overdue_notice_email Value to be assigned
    def overdue_notice_email=(overdue_notice_email)
      if !overdue_notice_email.nil? && overdue_notice_email.to_s.length > 254
        fail ArgumentError, 'invalid value for "overdue_notice_email", the character length must be smaller than or equal to 254.'
      end

      @overdue_notice_email = overdue_notice_email
    end

    # Custom attribute writer method with validation
    # @param [Object] number Value to be assigned
    def number=(number)
      if !number.nil? && number.to_s.length > 100
        fail ArgumentError, 'invalid value for "number", the character length must be smaller than or equal to 100.'
      end

      @number = number
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
    # @param [Object] invoices_due_in Value to be assigned
    def invoices_due_in=(invoices_due_in)
      if !invoices_due_in.nil? && invoices_due_in > 10000
        fail ArgumentError, 'invalid value for "invoices_due_in", must be smaller than or equal to 10000.'
      end

      if !invoices_due_in.nil? && invoices_due_in < 0
        fail ArgumentError, 'invalid value for "invoices_due_in", must be greater than or equal to 0.'
      end

      @invoices_due_in = invoices_due_in
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] invoices_due_in_type Object to be assigned
    def invoices_due_in_type=(invoices_due_in_type)
      validator = EnumAttributeValidator.new('String', ['DAYS', 'MONTHS', 'RECURRING_DAY_OF_MONTH'])
      unless validator.valid?(invoices_due_in_type)
        fail ArgumentError, 'invalid value for "invoices_due_in_type", must be one of #{validator.allowable_values}.'
      end
      @invoices_due_in_type = invoices_due_in_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] order_line_sorting Object to be assigned
    def order_line_sorting=(order_line_sorting)
      validator = EnumAttributeValidator.new('String', ['ID', 'PRODUCT', 'CUSTOM'])
      unless validator.valid?(order_line_sorting)
        fail ArgumentError, 'invalid value for "order_line_sorting", must be one of #{validator.allowable_values}.'
      end
      @order_line_sorting = order_line_sorting
    end

    # Custom attribute writer method with validation
    # @param [Object] subscription_duration Value to be assigned
    def subscription_duration=(subscription_duration)
      if !subscription_duration.nil? && subscription_duration < 0
        fail ArgumentError, 'invalid value for "subscription_duration", must be greater than or equal to 0.'
      end

      @subscription_duration = subscription_duration
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] subscription_duration_type Object to be assigned
    def subscription_duration_type=(subscription_duration_type)
      validator = EnumAttributeValidator.new('String', ['MONTHS', 'YEAR'])
      unless validator.valid?(subscription_duration_type)
        fail ArgumentError, 'invalid value for "subscription_duration_type", must be one of #{validator.allowable_values}.'
      end
      @subscription_duration_type = subscription_duration_type
    end

    # Custom attribute writer method with validation
    # @param [Object] subscription_periods_on_invoice Value to be assigned
    def subscription_periods_on_invoice=(subscription_periods_on_invoice)
      if !subscription_periods_on_invoice.nil? && subscription_periods_on_invoice < 0
        fail ArgumentError, 'invalid value for "subscription_periods_on_invoice", must be greater than or equal to 0.'
      end

      @subscription_periods_on_invoice = subscription_periods_on_invoice
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] subscription_periods_on_invoice_type Object to be assigned
    def subscription_periods_on_invoice_type=(subscription_periods_on_invoice_type)
      validator = EnumAttributeValidator.new('String', ['MONTHS'])
      unless validator.valid?(subscription_periods_on_invoice_type)
        fail ArgumentError, 'invalid value for "subscription_periods_on_invoice_type", must be one of #{validator.allowable_values}.'
      end
      @subscription_periods_on_invoice_type = subscription_periods_on_invoice_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] subscription_invoicing_time_in_advance_or_arrears Object to be assigned
    def subscription_invoicing_time_in_advance_or_arrears=(subscription_invoicing_time_in_advance_or_arrears)
      validator = EnumAttributeValidator.new('String', ['ADVANCE', 'ARREARS'])
      unless validator.valid?(subscription_invoicing_time_in_advance_or_arrears)
        fail ArgumentError, 'invalid value for "subscription_invoicing_time_in_advance_or_arrears", must be one of #{validator.allowable_values}.'
      end
      @subscription_invoicing_time_in_advance_or_arrears = subscription_invoicing_time_in_advance_or_arrears
    end

    # Custom attribute writer method with validation
    # @param [Object] subscription_invoicing_time Value to be assigned
    def subscription_invoicing_time=(subscription_invoicing_time)
      if !subscription_invoicing_time.nil? && subscription_invoicing_time < 0
        fail ArgumentError, 'invalid value for "subscription_invoicing_time", must be greater than or equal to 0.'
      end

      @subscription_invoicing_time = subscription_invoicing_time
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] subscription_invoicing_time_type Object to be assigned
    def subscription_invoicing_time_type=(subscription_invoicing_time_type)
      validator = EnumAttributeValidator.new('String', ['DAYS', 'MONTHS'])
      unless validator.valid?(subscription_invoicing_time_type)
        fail ArgumentError, 'invalid value for "subscription_invoicing_time_type", must be one of #{validator.allowable_values}.'
      end
      @subscription_invoicing_time_type = subscription_invoicing_time_type
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
          customer == o.customer &&
          contact == o.contact &&
          attn == o.attn &&
          receiver_email == o.receiver_email &&
          overdue_notice_email == o.overdue_notice_email &&
          number == o.number &&
          reference == o.reference &&
          our_contact == o.our_contact &&
          our_contact_employee == o.our_contact_employee &&
          department == o.department &&
          order_date == o.order_date &&
          project == o.project &&
          invoice_comment == o.invoice_comment &&
          currency == o.currency &&
          invoices_due_in == o.invoices_due_in &&
          invoices_due_in_type == o.invoices_due_in_type &&
          is_show_open_posts_on_invoices == o.is_show_open_posts_on_invoices &&
          is_closed == o.is_closed &&
          delivery_date == o.delivery_date &&
          delivery_address == o.delivery_address &&
          delivery_comment == o.delivery_comment &&
          is_prioritize_amounts_including_vat == o.is_prioritize_amounts_including_vat &&
          order_line_sorting == o.order_line_sorting &&
          order_lines == o.order_lines &&
          is_subscription == o.is_subscription &&
          subscription_duration == o.subscription_duration &&
          subscription_duration_type == o.subscription_duration_type &&
          subscription_periods_on_invoice == o.subscription_periods_on_invoice &&
          subscription_periods_on_invoice_type == o.subscription_periods_on_invoice_type &&
          subscription_invoicing_time_in_advance_or_arrears == o.subscription_invoicing_time_in_advance_or_arrears &&
          subscription_invoicing_time == o.subscription_invoicing_time &&
          subscription_invoicing_time_type == o.subscription_invoicing_time_type &&
          is_subscription_auto_invoicing == o.is_subscription_auto_invoicing &&
          preliminary_invoice == o.preliminary_invoice &&
          attachment == o.attachment &&
          send_method_description == o.send_method_description &&
          can_create_backorder == o.can_create_backorder &&
          invoice_on_account_vat_high == o.invoice_on_account_vat_high &&
          total_invoiced_on_account_amount_absolute_currency == o.total_invoiced_on_account_amount_absolute_currency
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, customer, contact, attn, receiver_email, overdue_notice_email, number, reference, our_contact, our_contact_employee, department, order_date, project, invoice_comment, currency, invoices_due_in, invoices_due_in_type, is_show_open_posts_on_invoices, is_closed, delivery_date, delivery_address, delivery_comment, is_prioritize_amounts_including_vat, order_line_sorting, order_lines, is_subscription, subscription_duration, subscription_duration_type, subscription_periods_on_invoice, subscription_periods_on_invoice_type, subscription_invoicing_time_in_advance_or_arrears, subscription_invoicing_time, subscription_invoicing_time_type, is_subscription_auto_invoicing, preliminary_invoice, attachment, send_method_description, can_create_backorder, invoice_on_account_vat_high, total_invoiced_on_account_amount_absolute_currency].hash
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
