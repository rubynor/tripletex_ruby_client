=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class ProjectTemplate
    attr_accessor :name

    attr_accessor :start_date

    attr_accessor :end_date

    attr_accessor :is_internal

    attr_accessor :number

    attr_accessor :display_name_format

    attr_accessor :project_manager

    attr_accessor :department

    attr_accessor :main_project

    attr_accessor :project_category

    attr_accessor :reference

    attr_accessor :external_accounts_number

    attr_accessor :description

    # Comment for project invoices
    attr_accessor :invoice_comment

    # Customer in attention of person
    attr_accessor :attention

    # Customer contact person.
    attr_accessor :contact

    # The project's customer
    attr_accessor :customer

    attr_accessor :delivery_address

    # The default vat type for this project.
    attr_accessor :vat_type

    attr_accessor :currency

    # Set mark-up (%) for order lines.
    attr_accessor :mark_up_order_lines

    # Set mark-up (%) for fees earned.
    attr_accessor :mark_up_fees_earned

    # Project is fixed price if set to true, hourly rate if set to false.
    attr_accessor :is_fixed_price

    # Fixed price amount, in the project's currency.
    attr_accessor :fixedprice

    # Set to true if an hourly rate project has a price ceiling.
    attr_accessor :is_price_ceiling

    # Price ceiling amount, in the project's currency.
    attr_accessor :price_ceiling_amount

    # Set to true if a general project activity must be linked to project to allow time tracking.
    attr_accessor :general_project_activities_per_project_only

    # Set to true if only project participants can register information on the project
    attr_accessor :for_participants_only

    # Project Rate Types tied to the project.
    attr_accessor :project_hourly_rates

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
        :'name' => :'name',
        :'start_date' => :'startDate',
        :'end_date' => :'endDate',
        :'is_internal' => :'isInternal',
        :'number' => :'number',
        :'display_name_format' => :'displayNameFormat',
        :'project_manager' => :'projectManager',
        :'department' => :'department',
        :'main_project' => :'mainProject',
        :'project_category' => :'projectCategory',
        :'reference' => :'reference',
        :'external_accounts_number' => :'externalAccountsNumber',
        :'description' => :'description',
        :'invoice_comment' => :'invoiceComment',
        :'attention' => :'attention',
        :'contact' => :'contact',
        :'customer' => :'customer',
        :'delivery_address' => :'deliveryAddress',
        :'vat_type' => :'vatType',
        :'currency' => :'currency',
        :'mark_up_order_lines' => :'markUpOrderLines',
        :'mark_up_fees_earned' => :'markUpFeesEarned',
        :'is_fixed_price' => :'isFixedPrice',
        :'fixedprice' => :'fixedprice',
        :'is_price_ceiling' => :'isPriceCeiling',
        :'price_ceiling_amount' => :'priceCeilingAmount',
        :'general_project_activities_per_project_only' => :'generalProjectActivitiesPerProjectOnly',
        :'for_participants_only' => :'forParticipantsOnly',
        :'project_hourly_rates' => :'projectHourlyRates'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'name' => :'String',
        :'start_date' => :'String',
        :'end_date' => :'String',
        :'is_internal' => :'BOOLEAN',
        :'number' => :'String',
        :'display_name_format' => :'String',
        :'project_manager' => :'Employee',
        :'department' => :'Department',
        :'main_project' => :'Project',
        :'project_category' => :'ProjectCategory',
        :'reference' => :'String',
        :'external_accounts_number' => :'String',
        :'description' => :'String',
        :'invoice_comment' => :'String',
        :'attention' => :'Contact',
        :'contact' => :'Contact',
        :'customer' => :'Customer',
        :'delivery_address' => :'DeliveryAddress',
        :'vat_type' => :'VatType',
        :'currency' => :'Currency',
        :'mark_up_order_lines' => :'Float',
        :'mark_up_fees_earned' => :'Float',
        :'is_fixed_price' => :'BOOLEAN',
        :'fixedprice' => :'Float',
        :'is_price_ceiling' => :'BOOLEAN',
        :'price_ceiling_amount' => :'Float',
        :'general_project_activities_per_project_only' => :'BOOLEAN',
        :'for_participants_only' => :'BOOLEAN',
        :'project_hourly_rates' => :'Array<ProjectHourlyRateTemplate>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.has_key?(:'startDate')
        self.start_date = attributes[:'startDate']
      end

      if attributes.has_key?(:'endDate')
        self.end_date = attributes[:'endDate']
      end

      if attributes.has_key?(:'isInternal')
        self.is_internal = attributes[:'isInternal']
      end

      if attributes.has_key?(:'number')
        self.number = attributes[:'number']
      end

      if attributes.has_key?(:'displayNameFormat')
        self.display_name_format = attributes[:'displayNameFormat']
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

      if attributes.has_key?(:'projectCategory')
        self.project_category = attributes[:'projectCategory']
      end

      if attributes.has_key?(:'reference')
        self.reference = attributes[:'reference']
      end

      if attributes.has_key?(:'externalAccountsNumber')
        self.external_accounts_number = attributes[:'externalAccountsNumber']
      end

      if attributes.has_key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.has_key?(:'invoiceComment')
        self.invoice_comment = attributes[:'invoiceComment']
      end

      if attributes.has_key?(:'attention')
        self.attention = attributes[:'attention']
      end

      if attributes.has_key?(:'contact')
        self.contact = attributes[:'contact']
      end

      if attributes.has_key?(:'customer')
        self.customer = attributes[:'customer']
      end

      if attributes.has_key?(:'deliveryAddress')
        self.delivery_address = attributes[:'deliveryAddress']
      end

      if attributes.has_key?(:'vatType')
        self.vat_type = attributes[:'vatType']
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

      if attributes.has_key?(:'isFixedPrice')
        self.is_fixed_price = attributes[:'isFixedPrice']
      end

      if attributes.has_key?(:'fixedprice')
        self.fixedprice = attributes[:'fixedprice']
      end

      if attributes.has_key?(:'isPriceCeiling')
        self.is_price_ceiling = attributes[:'isPriceCeiling']
      end

      if attributes.has_key?(:'priceCeilingAmount')
        self.price_ceiling_amount = attributes[:'priceCeilingAmount']
      end

      if attributes.has_key?(:'generalProjectActivitiesPerProjectOnly')
        self.general_project_activities_per_project_only = attributes[:'generalProjectActivitiesPerProjectOnly']
      end

      if attributes.has_key?(:'forParticipantsOnly')
        self.for_participants_only = attributes[:'forParticipantsOnly']
      end

      if attributes.has_key?(:'projectHourlyRates')
        if (value = attributes[:'projectHourlyRates']).is_a?(Array)
          self.project_hourly_rates = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@name.nil? && @name.to_s.length > 255
        invalid_properties.push('invalid value for "name", the character length must be smaller than or equal to 255.')
      end

      if !@number.nil? && @number.to_s.length > 100
        invalid_properties.push('invalid value for "number", the character length must be smaller than or equal to 100.')
      end

      if !@reference.nil? && @reference.to_s.length > 255
        invalid_properties.push('invalid value for "reference", the character length must be smaller than or equal to 255.')
      end

      if !@external_accounts_number.nil? && @external_accounts_number.to_s.length > 100
        invalid_properties.push('invalid value for "external_accounts_number", the character length must be smaller than or equal to 100.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@name.nil? && @name.to_s.length > 255
      return false if !@number.nil? && @number.to_s.length > 100
      display_name_format_validator = EnumAttributeValidator.new('String', ['NAME_STANDARD', 'NAME_INCL_CUSTOMER_NAME', 'NAME_INCL_PARENT_NAME', 'NAME_INCL_PARENT_NUMBER', 'NAME_INCL_PARENT_NAME_AND_NUMBER'])
      return false unless display_name_format_validator.valid?(@display_name_format)
      return false if !@reference.nil? && @reference.to_s.length > 255
      return false if !@external_accounts_number.nil? && @external_accounts_number.to_s.length > 100
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] name Value to be assigned
    def name=(name)
      if !name.nil? && name.to_s.length > 255
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

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          name == o.name &&
          start_date == o.start_date &&
          end_date == o.end_date &&
          is_internal == o.is_internal &&
          number == o.number &&
          display_name_format == o.display_name_format &&
          project_manager == o.project_manager &&
          department == o.department &&
          main_project == o.main_project &&
          project_category == o.project_category &&
          reference == o.reference &&
          external_accounts_number == o.external_accounts_number &&
          description == o.description &&
          invoice_comment == o.invoice_comment &&
          attention == o.attention &&
          contact == o.contact &&
          customer == o.customer &&
          delivery_address == o.delivery_address &&
          vat_type == o.vat_type &&
          currency == o.currency &&
          mark_up_order_lines == o.mark_up_order_lines &&
          mark_up_fees_earned == o.mark_up_fees_earned &&
          is_fixed_price == o.is_fixed_price &&
          fixedprice == o.fixedprice &&
          is_price_ceiling == o.is_price_ceiling &&
          price_ceiling_amount == o.price_ceiling_amount &&
          general_project_activities_per_project_only == o.general_project_activities_per_project_only &&
          for_participants_only == o.for_participants_only &&
          project_hourly_rates == o.project_hourly_rates
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [name, start_date, end_date, is_internal, number, display_name_format, project_manager, department, main_project, project_category, reference, external_accounts_number, description, invoice_comment, attention, contact, customer, delivery_address, vat_type, currency, mark_up_order_lines, mark_up_fees_earned, is_fixed_price, fixedprice, is_price_ceiling, price_ceiling_amount, general_project_activities_per_project_only, for_participants_only, project_hourly_rates].hash
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
