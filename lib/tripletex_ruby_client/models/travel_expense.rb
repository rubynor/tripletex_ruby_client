=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class TravelExpense
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    attr_accessor :project

    attr_accessor :employee

    attr_accessor :approved_by

    attr_accessor :completed_by

    attr_accessor :department

    attr_accessor :payslip

    attr_accessor :vat_type

    attr_accessor :payment_currency

    attr_accessor :travel_details

    attr_accessor :voucher

    attr_accessor :attachment

    attr_accessor :is_completed

    attr_accessor :is_approved

    attr_accessor :is_chargeable

    attr_accessor :is_fixed_invoiced_amount

    attr_accessor :is_include_attached_receipts_when_reinvoicing

    attr_accessor :completed_date

    attr_accessor :approved_date

    attr_accessor :date

    attr_accessor :travel_advance

    attr_accessor :fixed_invoiced_amount

    attr_accessor :amount

    attr_accessor :payment_amount

    attr_accessor :chargeable_amount

    attr_accessor :low_rate_vat

    attr_accessor :medium_rate_vat

    attr_accessor :high_rate_vat

    attr_accessor :payment_amount_currency

    attr_accessor :number

    attr_accessor :invoice

    attr_accessor :title

    # Link to individual per diem compensations.
    attr_accessor :per_diem_compensations

    # Link to individual mileage allowances.
    attr_accessor :mileage_allowances

    # Link to individual accommodation allowances.
    attr_accessor :accommodation_allowances

    # Link to individual costs.
    attr_accessor :costs

    attr_accessor :attachment_count

    attr_accessor :state

    attr_accessor :actions

    attr_accessor :is_salary_admin

    attr_accessor :show_payslip

    attr_accessor :accounting_period_closed

    attr_accessor :accounting_period_vat_closed

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
        :'project' => :'project',
        :'employee' => :'employee',
        :'approved_by' => :'approvedBy',
        :'completed_by' => :'completedBy',
        :'department' => :'department',
        :'payslip' => :'payslip',
        :'vat_type' => :'vatType',
        :'payment_currency' => :'paymentCurrency',
        :'travel_details' => :'travelDetails',
        :'voucher' => :'voucher',
        :'attachment' => :'attachment',
        :'is_completed' => :'isCompleted',
        :'is_approved' => :'isApproved',
        :'is_chargeable' => :'isChargeable',
        :'is_fixed_invoiced_amount' => :'isFixedInvoicedAmount',
        :'is_include_attached_receipts_when_reinvoicing' => :'isIncludeAttachedReceiptsWhenReinvoicing',
        :'completed_date' => :'completedDate',
        :'approved_date' => :'approvedDate',
        :'date' => :'date',
        :'travel_advance' => :'travelAdvance',
        :'fixed_invoiced_amount' => :'fixedInvoicedAmount',
        :'amount' => :'amount',
        :'payment_amount' => :'paymentAmount',
        :'chargeable_amount' => :'chargeableAmount',
        :'low_rate_vat' => :'lowRateVAT',
        :'medium_rate_vat' => :'mediumRateVAT',
        :'high_rate_vat' => :'highRateVAT',
        :'payment_amount_currency' => :'paymentAmountCurrency',
        :'number' => :'number',
        :'invoice' => :'invoice',
        :'title' => :'title',
        :'per_diem_compensations' => :'perDiemCompensations',
        :'mileage_allowances' => :'mileageAllowances',
        :'accommodation_allowances' => :'accommodationAllowances',
        :'costs' => :'costs',
        :'attachment_count' => :'attachmentCount',
        :'state' => :'state',
        :'actions' => :'actions',
        :'is_salary_admin' => :'isSalaryAdmin',
        :'show_payslip' => :'showPayslip',
        :'accounting_period_closed' => :'accountingPeriodClosed',
        :'accounting_period_vat_closed' => :'accountingPeriodVATClosed'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'project' => :'Project',
        :'employee' => :'Employee',
        :'approved_by' => :'Employee',
        :'completed_by' => :'Employee',
        :'department' => :'Department',
        :'payslip' => :'Payslip',
        :'vat_type' => :'VatType',
        :'payment_currency' => :'Currency',
        :'travel_details' => :'TravelDetails',
        :'voucher' => :'Voucher',
        :'attachment' => :'Document',
        :'is_completed' => :'BOOLEAN',
        :'is_approved' => :'BOOLEAN',
        :'is_chargeable' => :'BOOLEAN',
        :'is_fixed_invoiced_amount' => :'BOOLEAN',
        :'is_include_attached_receipts_when_reinvoicing' => :'BOOLEAN',
        :'completed_date' => :'String',
        :'approved_date' => :'String',
        :'date' => :'String',
        :'travel_advance' => :'Float',
        :'fixed_invoiced_amount' => :'Float',
        :'amount' => :'Float',
        :'payment_amount' => :'Float',
        :'chargeable_amount' => :'Float',
        :'low_rate_vat' => :'Float',
        :'medium_rate_vat' => :'Float',
        :'high_rate_vat' => :'Float',
        :'payment_amount_currency' => :'Float',
        :'number' => :'Integer',
        :'invoice' => :'Invoice',
        :'title' => :'String',
        :'per_diem_compensations' => :'Array<PerDiemCompensation>',
        :'mileage_allowances' => :'Array<MileageAllowance>',
        :'accommodation_allowances' => :'Array<AccommodationAllowance>',
        :'costs' => :'Array<Cost>',
        :'attachment_count' => :'Integer',
        :'state' => :'String',
        :'actions' => :'Array<Link>',
        :'is_salary_admin' => :'BOOLEAN',
        :'show_payslip' => :'BOOLEAN',
        :'accounting_period_closed' => :'BOOLEAN',
        :'accounting_period_vat_closed' => :'BOOLEAN'
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

      if attributes.has_key?(:'project')
        self.project = attributes[:'project']
      end

      if attributes.has_key?(:'employee')
        self.employee = attributes[:'employee']
      end

      if attributes.has_key?(:'approvedBy')
        self.approved_by = attributes[:'approvedBy']
      end

      if attributes.has_key?(:'completedBy')
        self.completed_by = attributes[:'completedBy']
      end

      if attributes.has_key?(:'department')
        self.department = attributes[:'department']
      end

      if attributes.has_key?(:'payslip')
        self.payslip = attributes[:'payslip']
      end

      if attributes.has_key?(:'vatType')
        self.vat_type = attributes[:'vatType']
      end

      if attributes.has_key?(:'paymentCurrency')
        self.payment_currency = attributes[:'paymentCurrency']
      end

      if attributes.has_key?(:'travelDetails')
        self.travel_details = attributes[:'travelDetails']
      end

      if attributes.has_key?(:'voucher')
        self.voucher = attributes[:'voucher']
      end

      if attributes.has_key?(:'attachment')
        self.attachment = attributes[:'attachment']
      end

      if attributes.has_key?(:'isCompleted')
        self.is_completed = attributes[:'isCompleted']
      end

      if attributes.has_key?(:'isApproved')
        self.is_approved = attributes[:'isApproved']
      end

      if attributes.has_key?(:'isChargeable')
        self.is_chargeable = attributes[:'isChargeable']
      end

      if attributes.has_key?(:'isFixedInvoicedAmount')
        self.is_fixed_invoiced_amount = attributes[:'isFixedInvoicedAmount']
      end

      if attributes.has_key?(:'isIncludeAttachedReceiptsWhenReinvoicing')
        self.is_include_attached_receipts_when_reinvoicing = attributes[:'isIncludeAttachedReceiptsWhenReinvoicing']
      end

      if attributes.has_key?(:'completedDate')
        self.completed_date = attributes[:'completedDate']
      end

      if attributes.has_key?(:'approvedDate')
        self.approved_date = attributes[:'approvedDate']
      end

      if attributes.has_key?(:'date')
        self.date = attributes[:'date']
      end

      if attributes.has_key?(:'travelAdvance')
        self.travel_advance = attributes[:'travelAdvance']
      end

      if attributes.has_key?(:'fixedInvoicedAmount')
        self.fixed_invoiced_amount = attributes[:'fixedInvoicedAmount']
      end

      if attributes.has_key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.has_key?(:'paymentAmount')
        self.payment_amount = attributes[:'paymentAmount']
      end

      if attributes.has_key?(:'chargeableAmount')
        self.chargeable_amount = attributes[:'chargeableAmount']
      end

      if attributes.has_key?(:'lowRateVAT')
        self.low_rate_vat = attributes[:'lowRateVAT']
      end

      if attributes.has_key?(:'mediumRateVAT')
        self.medium_rate_vat = attributes[:'mediumRateVAT']
      end

      if attributes.has_key?(:'highRateVAT')
        self.high_rate_vat = attributes[:'highRateVAT']
      end

      if attributes.has_key?(:'paymentAmountCurrency')
        self.payment_amount_currency = attributes[:'paymentAmountCurrency']
      end

      if attributes.has_key?(:'number')
        self.number = attributes[:'number']
      end

      if attributes.has_key?(:'invoice')
        self.invoice = attributes[:'invoice']
      end

      if attributes.has_key?(:'title')
        self.title = attributes[:'title']
      end

      if attributes.has_key?(:'perDiemCompensations')
        if (value = attributes[:'perDiemCompensations']).is_a?(Array)
          self.per_diem_compensations = value
        end
      end

      if attributes.has_key?(:'mileageAllowances')
        if (value = attributes[:'mileageAllowances']).is_a?(Array)
          self.mileage_allowances = value
        end
      end

      if attributes.has_key?(:'accommodationAllowances')
        if (value = attributes[:'accommodationAllowances']).is_a?(Array)
          self.accommodation_allowances = value
        end
      end

      if attributes.has_key?(:'costs')
        if (value = attributes[:'costs']).is_a?(Array)
          self.costs = value
        end
      end

      if attributes.has_key?(:'attachmentCount')
        self.attachment_count = attributes[:'attachmentCount']
      end

      if attributes.has_key?(:'state')
        self.state = attributes[:'state']
      end

      if attributes.has_key?(:'actions')
        if (value = attributes[:'actions']).is_a?(Array)
          self.actions = value
        end
      end

      if attributes.has_key?(:'isSalaryAdmin')
        self.is_salary_admin = attributes[:'isSalaryAdmin']
      end

      if attributes.has_key?(:'showPayslip')
        self.show_payslip = attributes[:'showPayslip']
      end

      if attributes.has_key?(:'accountingPeriodClosed')
        self.accounting_period_closed = attributes[:'accountingPeriodClosed']
      end

      if attributes.has_key?(:'accountingPeriodVATClosed')
        self.accounting_period_vat_closed = attributes[:'accountingPeriodVATClosed']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @employee.nil?
        invalid_properties.push('invalid value for "employee", employee cannot be nil.')
      end

      if !@title.nil? && @title.to_s.length > 255
        invalid_properties.push('invalid value for "title", the character length must be smaller than or equal to 255.')
      end

      if !@attachment_count.nil? && @attachment_count > 2147483647
        invalid_properties.push('invalid value for "attachment_count", must be smaller than or equal to 2147483647.')
      end

      if !@attachment_count.nil? && @attachment_count < 0
        invalid_properties.push('invalid value for "attachment_count", must be greater than or equal to 0.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @employee.nil?
      return false if !@title.nil? && @title.to_s.length > 255
      return false if !@attachment_count.nil? && @attachment_count > 2147483647
      return false if !@attachment_count.nil? && @attachment_count < 0
      state_validator = EnumAttributeValidator.new('String', ['ALL', 'OPEN', 'APPROVED', 'SALARY_PAID', 'DELIVERED'])
      return false unless state_validator.valid?(@state)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] title Value to be assigned
    def title=(title)
      if !title.nil? && title.to_s.length > 255
        fail ArgumentError, 'invalid value for "title", the character length must be smaller than or equal to 255.'
      end

      @title = title
    end

    # Custom attribute writer method with validation
    # @param [Object] attachment_count Value to be assigned
    def attachment_count=(attachment_count)
      if !attachment_count.nil? && attachment_count > 2147483647
        fail ArgumentError, 'invalid value for "attachment_count", must be smaller than or equal to 2147483647.'
      end

      if !attachment_count.nil? && attachment_count < 0
        fail ArgumentError, 'invalid value for "attachment_count", must be greater than or equal to 0.'
      end

      @attachment_count = attachment_count
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] state Object to be assigned
    def state=(state)
      validator = EnumAttributeValidator.new('String', ['ALL', 'OPEN', 'APPROVED', 'SALARY_PAID', 'DELIVERED'])
      unless validator.valid?(state)
        fail ArgumentError, 'invalid value for "state", must be one of #{validator.allowable_values}.'
      end
      @state = state
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
          project == o.project &&
          employee == o.employee &&
          approved_by == o.approved_by &&
          completed_by == o.completed_by &&
          department == o.department &&
          payslip == o.payslip &&
          vat_type == o.vat_type &&
          payment_currency == o.payment_currency &&
          travel_details == o.travel_details &&
          voucher == o.voucher &&
          attachment == o.attachment &&
          is_completed == o.is_completed &&
          is_approved == o.is_approved &&
          is_chargeable == o.is_chargeable &&
          is_fixed_invoiced_amount == o.is_fixed_invoiced_amount &&
          is_include_attached_receipts_when_reinvoicing == o.is_include_attached_receipts_when_reinvoicing &&
          completed_date == o.completed_date &&
          approved_date == o.approved_date &&
          date == o.date &&
          travel_advance == o.travel_advance &&
          fixed_invoiced_amount == o.fixed_invoiced_amount &&
          amount == o.amount &&
          payment_amount == o.payment_amount &&
          chargeable_amount == o.chargeable_amount &&
          low_rate_vat == o.low_rate_vat &&
          medium_rate_vat == o.medium_rate_vat &&
          high_rate_vat == o.high_rate_vat &&
          payment_amount_currency == o.payment_amount_currency &&
          number == o.number &&
          invoice == o.invoice &&
          title == o.title &&
          per_diem_compensations == o.per_diem_compensations &&
          mileage_allowances == o.mileage_allowances &&
          accommodation_allowances == o.accommodation_allowances &&
          costs == o.costs &&
          attachment_count == o.attachment_count &&
          state == o.state &&
          actions == o.actions &&
          is_salary_admin == o.is_salary_admin &&
          show_payslip == o.show_payslip &&
          accounting_period_closed == o.accounting_period_closed &&
          accounting_period_vat_closed == o.accounting_period_vat_closed
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, project, employee, approved_by, completed_by, department, payslip, vat_type, payment_currency, travel_details, voucher, attachment, is_completed, is_approved, is_chargeable, is_fixed_invoiced_amount, is_include_attached_receipts_when_reinvoicing, completed_date, approved_date, date, travel_advance, fixed_invoiced_amount, amount, payment_amount, chargeable_amount, low_rate_vat, medium_rate_vat, high_rate_vat, payment_amount_currency, number, invoice, title, per_diem_compensations, mileage_allowances, accommodation_allowances, costs, attachment_count, state, actions, is_salary_admin, show_payslip, accounting_period_closed, accounting_period_vat_closed].hash
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
