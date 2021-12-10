=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class BankAgreement
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    # The IBAN property.
    attr_accessor :iban

    # The BBAN property.
    attr_accessor :bban

    # The description property.
    attr_accessor :description

    # The account for bank agreement.
    attr_accessor :account

    attr_accessor :uploader_employee

    attr_accessor :date_created

    attr_accessor :bank

    attr_accessor :country

    attr_accessor :currency

    attr_accessor :is_active

    # The showAdviceCurrencyMismatch property.
    attr_accessor :show_advice_currency_mismatch

    attr_accessor :account_in_bank_id

    attr_accessor :division

    attr_accessor :ccm_agreement_id

    attr_accessor :organisation_number

    attr_accessor :approve_in_online_banking

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'version' => :'version',
        :'changes' => :'changes',
        :'url' => :'url',
        :'iban' => :'iban',
        :'bban' => :'bban',
        :'description' => :'description',
        :'account' => :'account',
        :'uploader_employee' => :'uploaderEmployee',
        :'date_created' => :'dateCreated',
        :'bank' => :'bank',
        :'country' => :'country',
        :'currency' => :'currency',
        :'is_active' => :'isActive',
        :'show_advice_currency_mismatch' => :'showAdviceCurrencyMismatch',
        :'account_in_bank_id' => :'accountInBankId',
        :'division' => :'division',
        :'ccm_agreement_id' => :'ccmAgreementId',
        :'organisation_number' => :'organisationNumber',
        :'approve_in_online_banking' => :'approveInOnlineBanking'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'iban' => :'String',
        :'bban' => :'String',
        :'description' => :'String',
        :'account' => :'Account',
        :'uploader_employee' => :'Employee',
        :'date_created' => :'String',
        :'bank' => :'Bank',
        :'country' => :'Country',
        :'currency' => :'Currency',
        :'is_active' => :'BOOLEAN',
        :'show_advice_currency_mismatch' => :'BOOLEAN',
        :'account_in_bank_id' => :'String',
        :'division' => :'String',
        :'ccm_agreement_id' => :'String',
        :'organisation_number' => :'String',
        :'approve_in_online_banking' => :'BOOLEAN'
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

      if attributes.has_key?(:'iban')
        self.iban = attributes[:'iban']
      end

      if attributes.has_key?(:'bban')
        self.bban = attributes[:'bban']
      end

      if attributes.has_key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.has_key?(:'account')
        self.account = attributes[:'account']
      end

      if attributes.has_key?(:'uploaderEmployee')
        self.uploader_employee = attributes[:'uploaderEmployee']
      end

      if attributes.has_key?(:'dateCreated')
        self.date_created = attributes[:'dateCreated']
      end

      if attributes.has_key?(:'bank')
        self.bank = attributes[:'bank']
      end

      if attributes.has_key?(:'country')
        self.country = attributes[:'country']
      end

      if attributes.has_key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.has_key?(:'isActive')
        self.is_active = attributes[:'isActive']
      end

      if attributes.has_key?(:'showAdviceCurrencyMismatch')
        self.show_advice_currency_mismatch = attributes[:'showAdviceCurrencyMismatch']
      end

      if attributes.has_key?(:'accountInBankId')
        self.account_in_bank_id = attributes[:'accountInBankId']
      end

      if attributes.has_key?(:'division')
        self.division = attributes[:'division']
      end

      if attributes.has_key?(:'ccmAgreementId')
        self.ccm_agreement_id = attributes[:'ccmAgreementId']
      end

      if attributes.has_key?(:'organisationNumber')
        self.organisation_number = attributes[:'organisationNumber']
      end

      if attributes.has_key?(:'approveInOnlineBanking')
        self.approve_in_online_banking = attributes[:'approveInOnlineBanking']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@iban.nil? && @iban.to_s.length > 50
        invalid_properties.push('invalid value for "iban", the character length must be smaller than or equal to 50.')
      end

      if !@bban.nil? && @bban.to_s.length > 50
        invalid_properties.push('invalid value for "bban", the character length must be smaller than or equal to 50.')
      end

      if !@description.nil? && @description.to_s.length > 250
        invalid_properties.push('invalid value for "description", the character length must be smaller than or equal to 250.')
      end

      if !@account_in_bank_id.nil? && @account_in_bank_id.to_s.length > 50
        invalid_properties.push('invalid value for "account_in_bank_id", the character length must be smaller than or equal to 50.')
      end

      if !@division.nil? && @division.to_s.length > 50
        invalid_properties.push('invalid value for "division", the character length must be smaller than or equal to 50.')
      end

      if !@ccm_agreement_id.nil? && @ccm_agreement_id.to_s.length > 50
        invalid_properties.push('invalid value for "ccm_agreement_id", the character length must be smaller than or equal to 50.')
      end

      if !@organisation_number.nil? && @organisation_number.to_s.length > 50
        invalid_properties.push('invalid value for "organisation_number", the character length must be smaller than or equal to 50.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@iban.nil? && @iban.to_s.length > 50
      return false if !@bban.nil? && @bban.to_s.length > 50
      return false if !@description.nil? && @description.to_s.length > 250
      return false if !@account_in_bank_id.nil? && @account_in_bank_id.to_s.length > 50
      return false if !@division.nil? && @division.to_s.length > 50
      return false if !@ccm_agreement_id.nil? && @ccm_agreement_id.to_s.length > 50
      return false if !@organisation_number.nil? && @organisation_number.to_s.length > 50
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] iban Value to be assigned
    def iban=(iban)
      if !iban.nil? && iban.to_s.length > 50
        fail ArgumentError, 'invalid value for "iban", the character length must be smaller than or equal to 50.'
      end

      @iban = iban
    end

    # Custom attribute writer method with validation
    # @param [Object] bban Value to be assigned
    def bban=(bban)
      if !bban.nil? && bban.to_s.length > 50
        fail ArgumentError, 'invalid value for "bban", the character length must be smaller than or equal to 50.'
      end

      @bban = bban
    end

    # Custom attribute writer method with validation
    # @param [Object] description Value to be assigned
    def description=(description)
      if !description.nil? && description.to_s.length > 250
        fail ArgumentError, 'invalid value for "description", the character length must be smaller than or equal to 250.'
      end

      @description = description
    end

    # Custom attribute writer method with validation
    # @param [Object] account_in_bank_id Value to be assigned
    def account_in_bank_id=(account_in_bank_id)
      if !account_in_bank_id.nil? && account_in_bank_id.to_s.length > 50
        fail ArgumentError, 'invalid value for "account_in_bank_id", the character length must be smaller than or equal to 50.'
      end

      @account_in_bank_id = account_in_bank_id
    end

    # Custom attribute writer method with validation
    # @param [Object] division Value to be assigned
    def division=(division)
      if !division.nil? && division.to_s.length > 50
        fail ArgumentError, 'invalid value for "division", the character length must be smaller than or equal to 50.'
      end

      @division = division
    end

    # Custom attribute writer method with validation
    # @param [Object] ccm_agreement_id Value to be assigned
    def ccm_agreement_id=(ccm_agreement_id)
      if !ccm_agreement_id.nil? && ccm_agreement_id.to_s.length > 50
        fail ArgumentError, 'invalid value for "ccm_agreement_id", the character length must be smaller than or equal to 50.'
      end

      @ccm_agreement_id = ccm_agreement_id
    end

    # Custom attribute writer method with validation
    # @param [Object] organisation_number Value to be assigned
    def organisation_number=(organisation_number)
      if !organisation_number.nil? && organisation_number.to_s.length > 50
        fail ArgumentError, 'invalid value for "organisation_number", the character length must be smaller than or equal to 50.'
      end

      @organisation_number = organisation_number
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
          iban == o.iban &&
          bban == o.bban &&
          description == o.description &&
          account == o.account &&
          uploader_employee == o.uploader_employee &&
          date_created == o.date_created &&
          bank == o.bank &&
          country == o.country &&
          currency == o.currency &&
          is_active == o.is_active &&
          show_advice_currency_mismatch == o.show_advice_currency_mismatch &&
          account_in_bank_id == o.account_in_bank_id &&
          division == o.division &&
          ccm_agreement_id == o.ccm_agreement_id &&
          organisation_number == o.organisation_number &&
          approve_in_online_banking == o.approve_in_online_banking
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, iban, bban, description, account, uploader_employee, date_created, bank, country, currency, is_active, show_advice_currency_mismatch, account_in_bank_id, division, ccm_agreement_id, organisation_number, approve_in_online_banking].hash
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
