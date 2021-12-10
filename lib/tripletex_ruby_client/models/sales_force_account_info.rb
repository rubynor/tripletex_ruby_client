=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class SalesForceAccountInfo
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    attr_accessor :customer_id

    attr_accessor :customer_company_id

    attr_accessor :is_reseller

    attr_accessor :is_accountant

    attr_accessor :is_auditor

    attr_accessor :is_suspended

    # Tripletex account register Date
    attr_accessor :register_date

    # Tripletex account start Date
    attr_accessor :start_date

    # Tripletex account end Date
    attr_accessor :end_date

    # Active main module
    attr_accessor :active_main_module

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
        :'customer_id' => :'customerId',
        :'customer_company_id' => :'customerCompanyId',
        :'is_reseller' => :'isReseller',
        :'is_accountant' => :'isAccountant',
        :'is_auditor' => :'isAuditor',
        :'is_suspended' => :'isSuspended',
        :'register_date' => :'registerDate',
        :'start_date' => :'startDate',
        :'end_date' => :'endDate',
        :'active_main_module' => :'activeMainModule'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'customer_id' => :'Integer',
        :'customer_company_id' => :'Integer',
        :'is_reseller' => :'BOOLEAN',
        :'is_accountant' => :'BOOLEAN',
        :'is_auditor' => :'BOOLEAN',
        :'is_suspended' => :'BOOLEAN',
        :'register_date' => :'String',
        :'start_date' => :'String',
        :'end_date' => :'String',
        :'active_main_module' => :'String'
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

      if attributes.has_key?(:'customerId')
        self.customer_id = attributes[:'customerId']
      end

      if attributes.has_key?(:'customerCompanyId')
        self.customer_company_id = attributes[:'customerCompanyId']
      end

      if attributes.has_key?(:'isReseller')
        self.is_reseller = attributes[:'isReseller']
      end

      if attributes.has_key?(:'isAccountant')
        self.is_accountant = attributes[:'isAccountant']
      end

      if attributes.has_key?(:'isAuditor')
        self.is_auditor = attributes[:'isAuditor']
      end

      if attributes.has_key?(:'isSuspended')
        self.is_suspended = attributes[:'isSuspended']
      end

      if attributes.has_key?(:'registerDate')
        self.register_date = attributes[:'registerDate']
      end

      if attributes.has_key?(:'startDate')
        self.start_date = attributes[:'startDate']
      end

      if attributes.has_key?(:'endDate')
        self.end_date = attributes[:'endDate']
      end

      if attributes.has_key?(:'activeMainModule')
        self.active_main_module = attributes[:'activeMainModule']
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
      active_main_module_validator = EnumAttributeValidator.new('String', ['ACCOUNTING', 'INVOICE', 'CRM', 'PROJECT', 'WAGE', 'NETS_PRINT', 'NETS_PRINT_SALARY', 'OCR', 'REMIT', 'SMS_NOTIFICATION', 'VOUCHER_SCANNING', 'TIME_TRACKING', 'VVS_ELECTRO', 'UBEGRENSET_BILAG_VVS_ELEKTRO', 'INVOICE_OPTION_VIPPS', 'INVOICE_OPTION_EFAKTURA', 'INVOICE_OPTION_AVTALEGIRO', 'INVOICE_OPTION_PAPER', 'FACTORING_APRILA', 'INVOICE_OPTION_AUTOINVOICE_OUTBOUND_EHF', 'API_V2', 'SMART_SCAN', 'BILAG_0_100_mikro', 'BILAG_0_500_vanlig_legacy', 'BILAG_501_1000_vanlig_legacy', 'BILAG_1001_2000_vanlig_legacy', 'BILAG_2001_3500_vanlig_legacy', 'BILAG_3501_5000_vanlig_legacy', 'BILAG_5001_10001_vanlig_legacy', 'UBEGRENSET_BILAG_vanlig_legacy', 'BILAG_0_500_prosjekt_legacy', 'BILAG_501_1000_prosjekt_legacy', 'BILAG_1001_2000_prosjekt_legacy', 'BILAG_2001_3500_prosjekt_legacy', 'BILAG_3501_5000_prosjekt_legacy', 'BILAG_5001_10001_prosjekt_legacy', 'UBEGRENSET_BILAG_prosjekt_legacy', 'MIKRO', 'MINI', 'MEDIUM', 'TOTAL', 'BASIS', 'SMART', 'AGRO_CLIENT', 'MAMUT', 'KOMPLETT', 'SMART_WAGE', 'SMART_TIME_TRACKING', 'BILAG_0_500', 'BILAG_501_1000', 'BILAG_1001_2000', 'BILAG_2001_3500', 'BILAG_3501_5000', 'BILAG_5001_10001', 'UBEGRENSET_BILAG', 'READ_ONLY_ACCESS', 'READ_ONLY_ACCESS_FREE', 'AUTOPAY', 'VOUCHER_APPROVAL', 'SMART_PROJECT', 'ACCOUNT_OFFICE', 'UNLIMITED_VOUCHER_ACCOUNT_OFFICE', 'COMPANY_SERVICE_FOR_PAYING_ACCOUNT_OFFICES', 'AGRO_WAGE', 'INVOICE_OPTION_AUTOINVOICE_INCOMING_EHF', 'MAMUT_PROJECT', 'MAMUT_WITH_WAGE', 'USER_SERVICE_HISTORIC_CUSTOMERS_NON_STANDARD', 'ENCRYPTED_PAYSLIP', 'AGRO_LICENCE', 'AGRO_DOCUMENT_CENTER', 'AGRO_INVOICE', 'FIVE_EMPLOYEES', 'AUTOPLUS_MINI', 'AUTOPLUS_MEDIUM', 'AUTOPLUS_STOR', 'CASH_CREDIT_APRILA', 'NO1TS', 'NO1TS_TRAVELREPORT', 'NO1TS_ACCOUNTING', 'AGRO_INVOICE_MIGRATED', 'USER_CATEGORY_1_LICENSE', 'USER_CATEGORY_2_LICENSE', 'USER_CATEGORY_3_LICENSE', 'VOUCHER_FACTORY', 'OCR_AUTOPAY', 'CLOSED_ACCOUNT', 'LOGISTICS', 'INTEGRATION_PARTNER'])
      return false unless active_main_module_validator.valid?(@active_main_module)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] active_main_module Object to be assigned
    def active_main_module=(active_main_module)
      validator = EnumAttributeValidator.new('String', ['ACCOUNTING', 'INVOICE', 'CRM', 'PROJECT', 'WAGE', 'NETS_PRINT', 'NETS_PRINT_SALARY', 'OCR', 'REMIT', 'SMS_NOTIFICATION', 'VOUCHER_SCANNING', 'TIME_TRACKING', 'VVS_ELECTRO', 'UBEGRENSET_BILAG_VVS_ELEKTRO', 'INVOICE_OPTION_VIPPS', 'INVOICE_OPTION_EFAKTURA', 'INVOICE_OPTION_AVTALEGIRO', 'INVOICE_OPTION_PAPER', 'FACTORING_APRILA', 'INVOICE_OPTION_AUTOINVOICE_OUTBOUND_EHF', 'API_V2', 'SMART_SCAN', 'BILAG_0_100_mikro', 'BILAG_0_500_vanlig_legacy', 'BILAG_501_1000_vanlig_legacy', 'BILAG_1001_2000_vanlig_legacy', 'BILAG_2001_3500_vanlig_legacy', 'BILAG_3501_5000_vanlig_legacy', 'BILAG_5001_10001_vanlig_legacy', 'UBEGRENSET_BILAG_vanlig_legacy', 'BILAG_0_500_prosjekt_legacy', 'BILAG_501_1000_prosjekt_legacy', 'BILAG_1001_2000_prosjekt_legacy', 'BILAG_2001_3500_prosjekt_legacy', 'BILAG_3501_5000_prosjekt_legacy', 'BILAG_5001_10001_prosjekt_legacy', 'UBEGRENSET_BILAG_prosjekt_legacy', 'MIKRO', 'MINI', 'MEDIUM', 'TOTAL', 'BASIS', 'SMART', 'AGRO_CLIENT', 'MAMUT', 'KOMPLETT', 'SMART_WAGE', 'SMART_TIME_TRACKING', 'BILAG_0_500', 'BILAG_501_1000', 'BILAG_1001_2000', 'BILAG_2001_3500', 'BILAG_3501_5000', 'BILAG_5001_10001', 'UBEGRENSET_BILAG', 'READ_ONLY_ACCESS', 'READ_ONLY_ACCESS_FREE', 'AUTOPAY', 'VOUCHER_APPROVAL', 'SMART_PROJECT', 'ACCOUNT_OFFICE', 'UNLIMITED_VOUCHER_ACCOUNT_OFFICE', 'COMPANY_SERVICE_FOR_PAYING_ACCOUNT_OFFICES', 'AGRO_WAGE', 'INVOICE_OPTION_AUTOINVOICE_INCOMING_EHF', 'MAMUT_PROJECT', 'MAMUT_WITH_WAGE', 'USER_SERVICE_HISTORIC_CUSTOMERS_NON_STANDARD', 'ENCRYPTED_PAYSLIP', 'AGRO_LICENCE', 'AGRO_DOCUMENT_CENTER', 'AGRO_INVOICE', 'FIVE_EMPLOYEES', 'AUTOPLUS_MINI', 'AUTOPLUS_MEDIUM', 'AUTOPLUS_STOR', 'CASH_CREDIT_APRILA', 'NO1TS', 'NO1TS_TRAVELREPORT', 'NO1TS_ACCOUNTING', 'AGRO_INVOICE_MIGRATED', 'USER_CATEGORY_1_LICENSE', 'USER_CATEGORY_2_LICENSE', 'USER_CATEGORY_3_LICENSE', 'VOUCHER_FACTORY', 'OCR_AUTOPAY', 'CLOSED_ACCOUNT', 'LOGISTICS', 'INTEGRATION_PARTNER'])
      unless validator.valid?(active_main_module)
        fail ArgumentError, 'invalid value for "active_main_module", must be one of #{validator.allowable_values}.'
      end
      @active_main_module = active_main_module
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
          customer_id == o.customer_id &&
          customer_company_id == o.customer_company_id &&
          is_reseller == o.is_reseller &&
          is_accountant == o.is_accountant &&
          is_auditor == o.is_auditor &&
          is_suspended == o.is_suspended &&
          register_date == o.register_date &&
          start_date == o.start_date &&
          end_date == o.end_date &&
          active_main_module == o.active_main_module
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, customer_id, customer_company_id, is_reseller, is_accountant, is_auditor, is_suspended, register_date, start_date, end_date, active_main_module].hash
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
