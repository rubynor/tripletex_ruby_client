=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class Payment
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    attr_accessor :payment_date

    attr_accessor :booking_date

    attr_accessor :value_date

    # In the specified currency.
    attr_accessor :amount_currency

    attr_accessor :currency

    attr_accessor :creditor_bank_name

    attr_accessor :creditor_bank_address

    attr_accessor :creditor_bank_postal_code

    attr_accessor :creditor_bank_postal_city

    # The payment status.NOT_APPROVED: Payment not approved yet.<br>APPROVED: Payment approved, but not yet sent to bank.<br>SENT_TO_AUTOPAY: Payment sent to bank.<br>RECEIVED_BY_BANK: Payment received by the bank.<br>ACCEPTED_BY_BANK: Payment that was accepted by the bank.<br>FAILED: Payment that failed.<br>CANCELLED: Cancelled payment.<br>SUCCESS: Payment that ended successfully.<br>
    attr_accessor :status

    # The payment status Id. Usually all the payments in one batch have the same status ID, at least to the point of being received by bank.NEW: Payment is new.<br>PENDING_SIGNING: Payment is sent to AutoPay but not signed yet, requires re-approving.<br>CANCELLED: Payment was cancelled by ERP.<br>ERROR: Payment that failed.<br>RECEIVED_BY_BANK: Payment was received by the bank.<br>ACCEPTED_BY_BANK: Payment was accepted by bank.<br>CANCELLED_IN_BANK: Payment was cancelled in bank.<br>REJECTED_BY_BANK: Payment was rejected by bank.<br>PAID: Payment is paid.<br>OTHER: In case status in unknown. Will never be a final status.<br>
    attr_accessor :status_id

    attr_accessor :is_final_status

    attr_accessor :is_foreign_payment

    attr_accessor :is_salary

    attr_accessor :description

    # KID - Kundeidentifikasjonsnummer.
    attr_accessor :kid

    attr_accessor :receiver_reference

    # Vouchere that was paid.
    attr_accessor :source_voucher

    # The payment posting.
    attr_accessor :postings

    # The payment account.
    attr_accessor :account

    # Amount specified in the currency of the bank agreements account.
    attr_accessor :amount_in_account_currency

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
        :'payment_date' => :'paymentDate',
        :'booking_date' => :'bookingDate',
        :'value_date' => :'valueDate',
        :'amount_currency' => :'amountCurrency',
        :'currency' => :'currency',
        :'creditor_bank_name' => :'creditorBankName',
        :'creditor_bank_address' => :'creditorBankAddress',
        :'creditor_bank_postal_code' => :'creditorBankPostalCode',
        :'creditor_bank_postal_city' => :'creditorBankPostalCity',
        :'status' => :'status',
        :'status_id' => :'statusId',
        :'is_final_status' => :'isFinalStatus',
        :'is_foreign_payment' => :'isForeignPayment',
        :'is_salary' => :'isSalary',
        :'description' => :'description',
        :'kid' => :'kid',
        :'receiver_reference' => :'receiverReference',
        :'source_voucher' => :'sourceVoucher',
        :'postings' => :'postings',
        :'account' => :'account',
        :'amount_in_account_currency' => :'amountInAccountCurrency'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'payment_date' => :'String',
        :'booking_date' => :'String',
        :'value_date' => :'String',
        :'amount_currency' => :'Float',
        :'currency' => :'Currency',
        :'creditor_bank_name' => :'String',
        :'creditor_bank_address' => :'String',
        :'creditor_bank_postal_code' => :'String',
        :'creditor_bank_postal_city' => :'String',
        :'status' => :'String',
        :'status_id' => :'String',
        :'is_final_status' => :'BOOLEAN',
        :'is_foreign_payment' => :'BOOLEAN',
        :'is_salary' => :'BOOLEAN',
        :'description' => :'String',
        :'kid' => :'String',
        :'receiver_reference' => :'String',
        :'source_voucher' => :'Voucher',
        :'postings' => :'Posting',
        :'account' => :'Account',
        :'amount_in_account_currency' => :'Float'
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

      if attributes.has_key?(:'paymentDate')
        self.payment_date = attributes[:'paymentDate']
      end

      if attributes.has_key?(:'bookingDate')
        self.booking_date = attributes[:'bookingDate']
      end

      if attributes.has_key?(:'valueDate')
        self.value_date = attributes[:'valueDate']
      end

      if attributes.has_key?(:'amountCurrency')
        self.amount_currency = attributes[:'amountCurrency']
      end

      if attributes.has_key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.has_key?(:'creditorBankName')
        self.creditor_bank_name = attributes[:'creditorBankName']
      end

      if attributes.has_key?(:'creditorBankAddress')
        self.creditor_bank_address = attributes[:'creditorBankAddress']
      end

      if attributes.has_key?(:'creditorBankPostalCode')
        self.creditor_bank_postal_code = attributes[:'creditorBankPostalCode']
      end

      if attributes.has_key?(:'creditorBankPostalCity')
        self.creditor_bank_postal_city = attributes[:'creditorBankPostalCity']
      end

      if attributes.has_key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.has_key?(:'statusId')
        self.status_id = attributes[:'statusId']
      end

      if attributes.has_key?(:'isFinalStatus')
        self.is_final_status = attributes[:'isFinalStatus']
      end

      if attributes.has_key?(:'isForeignPayment')
        self.is_foreign_payment = attributes[:'isForeignPayment']
      end

      if attributes.has_key?(:'isSalary')
        self.is_salary = attributes[:'isSalary']
      end

      if attributes.has_key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.has_key?(:'kid')
        self.kid = attributes[:'kid']
      end

      if attributes.has_key?(:'receiverReference')
        self.receiver_reference = attributes[:'receiverReference']
      end

      if attributes.has_key?(:'sourceVoucher')
        self.source_voucher = attributes[:'sourceVoucher']
      end

      if attributes.has_key?(:'postings')
        self.postings = attributes[:'postings']
      end

      if attributes.has_key?(:'account')
        self.account = attributes[:'account']
      end

      if attributes.has_key?(:'amountInAccountCurrency')
        self.amount_in_account_currency = attributes[:'amountInAccountCurrency']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@creditor_bank_name.nil? && @creditor_bank_name.to_s.length > 255
        invalid_properties.push('invalid value for "creditor_bank_name", the character length must be smaller than or equal to 255.')
      end

      if !@creditor_bank_address.nil? && @creditor_bank_address.to_s.length > 255
        invalid_properties.push('invalid value for "creditor_bank_address", the character length must be smaller than or equal to 255.')
      end

      if !@creditor_bank_postal_code.nil? && @creditor_bank_postal_code.to_s.length > 255
        invalid_properties.push('invalid value for "creditor_bank_postal_code", the character length must be smaller than or equal to 255.')
      end

      if !@creditor_bank_postal_city.nil? && @creditor_bank_postal_city.to_s.length > 255
        invalid_properties.push('invalid value for "creditor_bank_postal_city", the character length must be smaller than or equal to 255.')
      end

      if !@description.nil? && @description.to_s.length > 255
        invalid_properties.push('invalid value for "description", the character length must be smaller than or equal to 255.')
      end

      if !@kid.nil? && @kid.to_s.length > 25
        invalid_properties.push('invalid value for "kid", the character length must be smaller than or equal to 25.')
      end

      if !@receiver_reference.nil? && @receiver_reference.to_s.length > 250
        invalid_properties.push('invalid value for "receiver_reference", the character length must be smaller than or equal to 250.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@creditor_bank_name.nil? && @creditor_bank_name.to_s.length > 255
      return false if !@creditor_bank_address.nil? && @creditor_bank_address.to_s.length > 255
      return false if !@creditor_bank_postal_code.nil? && @creditor_bank_postal_code.to_s.length > 255
      return false if !@creditor_bank_postal_city.nil? && @creditor_bank_postal_city.to_s.length > 255
      status_validator = EnumAttributeValidator.new('String', ['NOT_APPROVED', 'APPROVED', 'SENT_TO_AUTOPAY', 'RECEIVED_BY_BANK', 'ACCEPTED_BY_BANK', 'FAILED', 'CANCELLED', 'SUCCESS'])
      return false unless status_validator.valid?(@status)
      status_id_validator = EnumAttributeValidator.new('String', ['NEW', 'PENDING_SIGNING', 'CANCELLED', 'ERROR', 'RECEIVED_BY_BANK', 'ACCEPTED_BY_BANK', 'CANCELLED_IN_BANK', 'REJECTED_BY_BANK', 'PAID', 'OTHER'])
      return false unless status_id_validator.valid?(@status_id)
      return false if !@description.nil? && @description.to_s.length > 255
      return false if !@kid.nil? && @kid.to_s.length > 25
      return false if !@receiver_reference.nil? && @receiver_reference.to_s.length > 250
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] creditor_bank_name Value to be assigned
    def creditor_bank_name=(creditor_bank_name)
      if !creditor_bank_name.nil? && creditor_bank_name.to_s.length > 255
        fail ArgumentError, 'invalid value for "creditor_bank_name", the character length must be smaller than or equal to 255.'
      end

      @creditor_bank_name = creditor_bank_name
    end

    # Custom attribute writer method with validation
    # @param [Object] creditor_bank_address Value to be assigned
    def creditor_bank_address=(creditor_bank_address)
      if !creditor_bank_address.nil? && creditor_bank_address.to_s.length > 255
        fail ArgumentError, 'invalid value for "creditor_bank_address", the character length must be smaller than or equal to 255.'
      end

      @creditor_bank_address = creditor_bank_address
    end

    # Custom attribute writer method with validation
    # @param [Object] creditor_bank_postal_code Value to be assigned
    def creditor_bank_postal_code=(creditor_bank_postal_code)
      if !creditor_bank_postal_code.nil? && creditor_bank_postal_code.to_s.length > 255
        fail ArgumentError, 'invalid value for "creditor_bank_postal_code", the character length must be smaller than or equal to 255.'
      end

      @creditor_bank_postal_code = creditor_bank_postal_code
    end

    # Custom attribute writer method with validation
    # @param [Object] creditor_bank_postal_city Value to be assigned
    def creditor_bank_postal_city=(creditor_bank_postal_city)
      if !creditor_bank_postal_city.nil? && creditor_bank_postal_city.to_s.length > 255
        fail ArgumentError, 'invalid value for "creditor_bank_postal_city", the character length must be smaller than or equal to 255.'
      end

      @creditor_bank_postal_city = creditor_bank_postal_city
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      validator = EnumAttributeValidator.new('String', ['NOT_APPROVED', 'APPROVED', 'SENT_TO_AUTOPAY', 'RECEIVED_BY_BANK', 'ACCEPTED_BY_BANK', 'FAILED', 'CANCELLED', 'SUCCESS'])
      unless validator.valid?(status)
        fail ArgumentError, 'invalid value for "status", must be one of #{validator.allowable_values}.'
      end
      @status = status
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status_id Object to be assigned
    def status_id=(status_id)
      validator = EnumAttributeValidator.new('String', ['NEW', 'PENDING_SIGNING', 'CANCELLED', 'ERROR', 'RECEIVED_BY_BANK', 'ACCEPTED_BY_BANK', 'CANCELLED_IN_BANK', 'REJECTED_BY_BANK', 'PAID', 'OTHER'])
      unless validator.valid?(status_id)
        fail ArgumentError, 'invalid value for "status_id", must be one of #{validator.allowable_values}.'
      end
      @status_id = status_id
    end

    # Custom attribute writer method with validation
    # @param [Object] description Value to be assigned
    def description=(description)
      if !description.nil? && description.to_s.length > 255
        fail ArgumentError, 'invalid value for "description", the character length must be smaller than or equal to 255.'
      end

      @description = description
    end

    # Custom attribute writer method with validation
    # @param [Object] kid Value to be assigned
    def kid=(kid)
      if !kid.nil? && kid.to_s.length > 25
        fail ArgumentError, 'invalid value for "kid", the character length must be smaller than or equal to 25.'
      end

      @kid = kid
    end

    # Custom attribute writer method with validation
    # @param [Object] receiver_reference Value to be assigned
    def receiver_reference=(receiver_reference)
      if !receiver_reference.nil? && receiver_reference.to_s.length > 250
        fail ArgumentError, 'invalid value for "receiver_reference", the character length must be smaller than or equal to 250.'
      end

      @receiver_reference = receiver_reference
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
          payment_date == o.payment_date &&
          booking_date == o.booking_date &&
          value_date == o.value_date &&
          amount_currency == o.amount_currency &&
          currency == o.currency &&
          creditor_bank_name == o.creditor_bank_name &&
          creditor_bank_address == o.creditor_bank_address &&
          creditor_bank_postal_code == o.creditor_bank_postal_code &&
          creditor_bank_postal_city == o.creditor_bank_postal_city &&
          status == o.status &&
          status_id == o.status_id &&
          is_final_status == o.is_final_status &&
          is_foreign_payment == o.is_foreign_payment &&
          is_salary == o.is_salary &&
          description == o.description &&
          kid == o.kid &&
          receiver_reference == o.receiver_reference &&
          source_voucher == o.source_voucher &&
          postings == o.postings &&
          account == o.account &&
          amount_in_account_currency == o.amount_in_account_currency
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, payment_date, booking_date, value_date, amount_currency, currency, creditor_bank_name, creditor_bank_address, creditor_bank_postal_code, creditor_bank_postal_city, status, status_id, is_final_status, is_foreign_payment, is_salary, description, kid, receiver_reference, source_voucher, postings, account, amount_in_account_currency].hash
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
