=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class CustomerTripletexAccount2
    # Administrator user to create in the new company. Leave empty if calling this enpoint as an auditor og accountant company
    attr_accessor :administrator

    # The customer id to an already created customer to create a Tripletex account for.
    attr_accessor :customer_id

    attr_accessor :account_type

    attr_accessor :modules

    attr_accessor :type

    # Should the emails normally sent during creation be sent in this case?
    attr_accessor :send_emails

    # Should the user be automatically validated?
    attr_accessor :auto_validate_user_login

    # Creates a token for the admin user. The accounting office could also use their tokens so you might not need this.
    attr_accessor :create_api_token

    # Should the invoices for this account be sent to the customer?
    attr_accessor :send_invoice_to_customer

    # The address to send the invoice to at the customer.
    attr_accessor :customer_invoice_email

    # The number of employees in the customer company. Is used for calculating prices and setting some default settings, i.e. approval settings for timesheet.
    attr_accessor :number_of_employees

    # The password of the administrator user.
    attr_accessor :administrator_password

    # The chart of accounts to use for the new company
    attr_accessor :chart_of_accounts_type

    # VAT type
    attr_accessor :vat_status_type

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
        :'administrator' => :'administrator',
        :'customer_id' => :'customerId',
        :'account_type' => :'accountType',
        :'modules' => :'modules',
        :'type' => :'type',
        :'send_emails' => :'sendEmails',
        :'auto_validate_user_login' => :'autoValidateUserLogin',
        :'create_api_token' => :'createApiToken',
        :'send_invoice_to_customer' => :'sendInvoiceToCustomer',
        :'customer_invoice_email' => :'customerInvoiceEmail',
        :'number_of_employees' => :'numberOfEmployees',
        :'administrator_password' => :'administratorPassword',
        :'chart_of_accounts_type' => :'chartOfAccountsType',
        :'vat_status_type' => :'vatStatusType'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'administrator' => :'Employee',
        :'customer_id' => :'Integer',
        :'account_type' => :'String',
        :'modules' => :'Array<SalesModuleDTO>',
        :'type' => :'String',
        :'send_emails' => :'BOOLEAN',
        :'auto_validate_user_login' => :'BOOLEAN',
        :'create_api_token' => :'BOOLEAN',
        :'send_invoice_to_customer' => :'BOOLEAN',
        :'customer_invoice_email' => :'String',
        :'number_of_employees' => :'Integer',
        :'administrator_password' => :'String',
        :'chart_of_accounts_type' => :'String',
        :'vat_status_type' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'administrator')
        self.administrator = attributes[:'administrator']
      end

      if attributes.has_key?(:'customerId')
        self.customer_id = attributes[:'customerId']
      end

      if attributes.has_key?(:'accountType')
        self.account_type = attributes[:'accountType']
      end

      if attributes.has_key?(:'modules')
        if (value = attributes[:'modules']).is_a?(Array)
          self.modules = value
        end
      end

      if attributes.has_key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.has_key?(:'sendEmails')
        self.send_emails = attributes[:'sendEmails']
      end

      if attributes.has_key?(:'autoValidateUserLogin')
        self.auto_validate_user_login = attributes[:'autoValidateUserLogin']
      end

      if attributes.has_key?(:'createApiToken')
        self.create_api_token = attributes[:'createApiToken']
      end

      if attributes.has_key?(:'sendInvoiceToCustomer')
        self.send_invoice_to_customer = attributes[:'sendInvoiceToCustomer']
      end

      if attributes.has_key?(:'customerInvoiceEmail')
        self.customer_invoice_email = attributes[:'customerInvoiceEmail']
      end

      if attributes.has_key?(:'numberOfEmployees')
        self.number_of_employees = attributes[:'numberOfEmployees']
      end

      if attributes.has_key?(:'administratorPassword')
        self.administrator_password = attributes[:'administratorPassword']
      end

      if attributes.has_key?(:'chartOfAccountsType')
        self.chart_of_accounts_type = attributes[:'chartOfAccountsType']
      end

      if attributes.has_key?(:'vatStatusType')
        self.vat_status_type = attributes[:'vatStatusType']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @account_type.nil?
        invalid_properties.push('invalid value for "account_type", account_type cannot be nil.')
      end

      if @modules.nil?
        invalid_properties.push('invalid value for "modules", modules cannot be nil.')
      end

      if @type.nil?
        invalid_properties.push('invalid value for "type", type cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @account_type.nil?
      account_type_validator = EnumAttributeValidator.new('String', ['TEST', 'PAYING'])
      return false unless account_type_validator.valid?(@account_type)
      return false if @modules.nil?
      return false if @type.nil?
      type_validator = EnumAttributeValidator.new('String', ['NONE', 'ENK', 'AS', 'NUF', 'ANS', 'DA', 'PRE', 'KS', 'ASA', 'BBL', 'BRL', 'GFS', 'SPA', 'SF', 'IKS', 'KF_FKF', 'FCD', 'EOFG', 'BA', 'STI', 'ORG', 'ESEK', 'SA', 'SAM', 'BO', 'VPFO', 'OS', 'Other'])
      return false unless type_validator.valid?(@type)
      chart_of_accounts_type_validator = EnumAttributeValidator.new('String', ['DEFAULT', 'MAMUT_STD_PAYROLL', 'MAMUT_NARF_PAYROLL', 'AGRO_FORRETNING_PAYROLL', 'AGRO_LANDBRUK_PAYROLL', 'AGRO_FISKE_PAYROLL', 'AGRO_FORSOKSRING_PAYROLL', 'AGRO_IDRETTSLAG_PAYROLL', 'AGRO_FORENING_PAYROLL'])
      return false unless chart_of_accounts_type_validator.valid?(@chart_of_accounts_type)
      vat_status_type_validator = EnumAttributeValidator.new('String', ['VAT_REGISTERED', 'VAT_NOT_REGISTERED', 'VAT_APPLICANT'])
      return false unless vat_status_type_validator.valid?(@vat_status_type)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] account_type Object to be assigned
    def account_type=(account_type)
      validator = EnumAttributeValidator.new('String', ['TEST', 'PAYING'])
      unless validator.valid?(account_type)
        fail ArgumentError, 'invalid value for "account_type", must be one of #{validator.allowable_values}.'
      end
      @account_type = account_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('String', ['NONE', 'ENK', 'AS', 'NUF', 'ANS', 'DA', 'PRE', 'KS', 'ASA', 'BBL', 'BRL', 'GFS', 'SPA', 'SF', 'IKS', 'KF_FKF', 'FCD', 'EOFG', 'BA', 'STI', 'ORG', 'ESEK', 'SA', 'SAM', 'BO', 'VPFO', 'OS', 'Other'])
      unless validator.valid?(type)
        fail ArgumentError, 'invalid value for "type", must be one of #{validator.allowable_values}.'
      end
      @type = type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] chart_of_accounts_type Object to be assigned
    def chart_of_accounts_type=(chart_of_accounts_type)
      validator = EnumAttributeValidator.new('String', ['DEFAULT', 'MAMUT_STD_PAYROLL', 'MAMUT_NARF_PAYROLL', 'AGRO_FORRETNING_PAYROLL', 'AGRO_LANDBRUK_PAYROLL', 'AGRO_FISKE_PAYROLL', 'AGRO_FORSOKSRING_PAYROLL', 'AGRO_IDRETTSLAG_PAYROLL', 'AGRO_FORENING_PAYROLL'])
      unless validator.valid?(chart_of_accounts_type)
        fail ArgumentError, 'invalid value for "chart_of_accounts_type", must be one of #{validator.allowable_values}.'
      end
      @chart_of_accounts_type = chart_of_accounts_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] vat_status_type Object to be assigned
    def vat_status_type=(vat_status_type)
      validator = EnumAttributeValidator.new('String', ['VAT_REGISTERED', 'VAT_NOT_REGISTERED', 'VAT_APPLICANT'])
      unless validator.valid?(vat_status_type)
        fail ArgumentError, 'invalid value for "vat_status_type", must be one of #{validator.allowable_values}.'
      end
      @vat_status_type = vat_status_type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          administrator == o.administrator &&
          customer_id == o.customer_id &&
          account_type == o.account_type &&
          modules == o.modules &&
          type == o.type &&
          send_emails == o.send_emails &&
          auto_validate_user_login == o.auto_validate_user_login &&
          create_api_token == o.create_api_token &&
          send_invoice_to_customer == o.send_invoice_to_customer &&
          customer_invoice_email == o.customer_invoice_email &&
          number_of_employees == o.number_of_employees &&
          administrator_password == o.administrator_password &&
          chart_of_accounts_type == o.chart_of_accounts_type &&
          vat_status_type == o.vat_status_type
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [administrator, customer_id, account_type, modules, type, send_emails, auto_validate_user_login, create_api_token, send_invoice_to_customer, customer_invoice_email, number_of_employees, administrator_password, chart_of_accounts_type, vat_status_type].hash
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
