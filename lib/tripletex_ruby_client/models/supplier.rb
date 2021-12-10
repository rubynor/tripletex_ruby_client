=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class Supplier
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    attr_accessor :name

    attr_accessor :organization_number

    attr_accessor :supplier_number

    attr_accessor :customer_number

    attr_accessor :is_supplier

    # Determine if the supplier is also a customer
    attr_accessor :is_customer

    attr_accessor :is_inactive

    attr_accessor :email

    # [DEPRECATED] List of the bank account numbers for this supplier.  Norwegian bank account numbers only.
    attr_accessor :bank_accounts

    attr_accessor :invoice_email

    # The email address of the customer where the noticing emails are sent in case of an overdue
    attr_accessor :overdue_notice_email

    attr_accessor :phone_number

    attr_accessor :phone_number_mobile

    attr_accessor :description

    attr_accessor :is_private_individual

    attr_accessor :show_products

    attr_accessor :account_manager

    attr_accessor :postal_address

    attr_accessor :physical_address

    attr_accessor :delivery_address

    # Category 1 of this supplier
    attr_accessor :category1

    # Category 2 of this supplier
    attr_accessor :category2

    # Category 3 of this supplier
    attr_accessor :category3

    # List of bankAccount for this supplier
    attr_accessor :bank_account_presentation

    # The preferred currency for this supplier
    attr_accessor :currency

    # Can be used to specify the ledger account of the supplier if it's different from the default 2400 account
    attr_accessor :ledger_account

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'version' => :'version',
        :'changes' => :'changes',
        :'url' => :'url',
        :'name' => :'name',
        :'organization_number' => :'organizationNumber',
        :'supplier_number' => :'supplierNumber',
        :'customer_number' => :'customerNumber',
        :'is_supplier' => :'isSupplier',
        :'is_customer' => :'isCustomer',
        :'is_inactive' => :'isInactive',
        :'email' => :'email',
        :'bank_accounts' => :'bankAccounts',
        :'invoice_email' => :'invoiceEmail',
        :'overdue_notice_email' => :'overdueNoticeEmail',
        :'phone_number' => :'phoneNumber',
        :'phone_number_mobile' => :'phoneNumberMobile',
        :'description' => :'description',
        :'is_private_individual' => :'isPrivateIndividual',
        :'show_products' => :'showProducts',
        :'account_manager' => :'accountManager',
        :'postal_address' => :'postalAddress',
        :'physical_address' => :'physicalAddress',
        :'delivery_address' => :'deliveryAddress',
        :'category1' => :'category1',
        :'category2' => :'category2',
        :'category3' => :'category3',
        :'bank_account_presentation' => :'bankAccountPresentation',
        :'currency' => :'currency',
        :'ledger_account' => :'ledgerAccount'
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
        :'organization_number' => :'String',
        :'supplier_number' => :'Integer',
        :'customer_number' => :'Integer',
        :'is_supplier' => :'BOOLEAN',
        :'is_customer' => :'BOOLEAN',
        :'is_inactive' => :'BOOLEAN',
        :'email' => :'String',
        :'bank_accounts' => :'Array<String>',
        :'invoice_email' => :'String',
        :'overdue_notice_email' => :'String',
        :'phone_number' => :'String',
        :'phone_number_mobile' => :'String',
        :'description' => :'String',
        :'is_private_individual' => :'BOOLEAN',
        :'show_products' => :'BOOLEAN',
        :'account_manager' => :'Employee',
        :'postal_address' => :'Address',
        :'physical_address' => :'Address',
        :'delivery_address' => :'DeliveryAddress',
        :'category1' => :'CustomerCategory',
        :'category2' => :'CustomerCategory',
        :'category3' => :'CustomerCategory',
        :'bank_account_presentation' => :'Array<CompanyBankAccountPresentation>',
        :'currency' => :'Currency',
        :'ledger_account' => :'Account'
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

      if attributes.has_key?(:'organizationNumber')
        self.organization_number = attributes[:'organizationNumber']
      end

      if attributes.has_key?(:'supplierNumber')
        self.supplier_number = attributes[:'supplierNumber']
      end

      if attributes.has_key?(:'customerNumber')
        self.customer_number = attributes[:'customerNumber']
      end

      if attributes.has_key?(:'isSupplier')
        self.is_supplier = attributes[:'isSupplier']
      end

      if attributes.has_key?(:'isCustomer')
        self.is_customer = attributes[:'isCustomer']
      end

      if attributes.has_key?(:'isInactive')
        self.is_inactive = attributes[:'isInactive']
      end

      if attributes.has_key?(:'email')
        self.email = attributes[:'email']
      end

      if attributes.has_key?(:'bankAccounts')
        if (value = attributes[:'bankAccounts']).is_a?(Array)
          self.bank_accounts = value
        end
      end

      if attributes.has_key?(:'invoiceEmail')
        self.invoice_email = attributes[:'invoiceEmail']
      end

      if attributes.has_key?(:'overdueNoticeEmail')
        self.overdue_notice_email = attributes[:'overdueNoticeEmail']
      end

      if attributes.has_key?(:'phoneNumber')
        self.phone_number = attributes[:'phoneNumber']
      end

      if attributes.has_key?(:'phoneNumberMobile')
        self.phone_number_mobile = attributes[:'phoneNumberMobile']
      end

      if attributes.has_key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.has_key?(:'isPrivateIndividual')
        self.is_private_individual = attributes[:'isPrivateIndividual']
      end

      if attributes.has_key?(:'showProducts')
        self.show_products = attributes[:'showProducts']
      end

      if attributes.has_key?(:'accountManager')
        self.account_manager = attributes[:'accountManager']
      end

      if attributes.has_key?(:'postalAddress')
        self.postal_address = attributes[:'postalAddress']
      end

      if attributes.has_key?(:'physicalAddress')
        self.physical_address = attributes[:'physicalAddress']
      end

      if attributes.has_key?(:'deliveryAddress')
        self.delivery_address = attributes[:'deliveryAddress']
      end

      if attributes.has_key?(:'category1')
        self.category1 = attributes[:'category1']
      end

      if attributes.has_key?(:'category2')
        self.category2 = attributes[:'category2']
      end

      if attributes.has_key?(:'category3')
        self.category3 = attributes[:'category3']
      end

      if attributes.has_key?(:'bankAccountPresentation')
        if (value = attributes[:'bankAccountPresentation']).is_a?(Array)
          self.bank_account_presentation = value
        end
      end

      if attributes.has_key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.has_key?(:'ledgerAccount')
        self.ledger_account = attributes[:'ledgerAccount']
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

      if !@organization_number.nil? && @organization_number.to_s.length > 100
        invalid_properties.push('invalid value for "organization_number", the character length must be smaller than or equal to 100.')
      end

      if !@email.nil? && @email.to_s.length > 254
        invalid_properties.push('invalid value for "email", the character length must be smaller than or equal to 254.')
      end

      if !@email.nil? && @email.to_s.length < 0
        invalid_properties.push('invalid value for "email", the character length must be great than or equal to 0.')
      end

      if !@invoice_email.nil? && @invoice_email.to_s.length > 254
        invalid_properties.push('invalid value for "invoice_email", the character length must be smaller than or equal to 254.')
      end

      if !@invoice_email.nil? && @invoice_email.to_s.length < 0
        invalid_properties.push('invalid value for "invoice_email", the character length must be great than or equal to 0.')
      end

      if !@overdue_notice_email.nil? && @overdue_notice_email.to_s.length > 254
        invalid_properties.push('invalid value for "overdue_notice_email", the character length must be smaller than or equal to 254.')
      end

      if !@overdue_notice_email.nil? && @overdue_notice_email.to_s.length < 0
        invalid_properties.push('invalid value for "overdue_notice_email", the character length must be great than or equal to 0.')
      end

      if !@phone_number.nil? && @phone_number.to_s.length > 100
        invalid_properties.push('invalid value for "phone_number", the character length must be smaller than or equal to 100.')
      end

      if !@phone_number_mobile.nil? && @phone_number_mobile.to_s.length > 100
        invalid_properties.push('invalid value for "phone_number_mobile", the character length must be smaller than or equal to 100.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @name.nil?
      return false if @name.to_s.length > 255
      return false if !@organization_number.nil? && @organization_number.to_s.length > 100
      return false if !@email.nil? && @email.to_s.length > 254
      return false if !@email.nil? && @email.to_s.length < 0
      return false if !@invoice_email.nil? && @invoice_email.to_s.length > 254
      return false if !@invoice_email.nil? && @invoice_email.to_s.length < 0
      return false if !@overdue_notice_email.nil? && @overdue_notice_email.to_s.length > 254
      return false if !@overdue_notice_email.nil? && @overdue_notice_email.to_s.length < 0
      return false if !@phone_number.nil? && @phone_number.to_s.length > 100
      return false if !@phone_number_mobile.nil? && @phone_number_mobile.to_s.length > 100
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
    # @param [Object] organization_number Value to be assigned
    def organization_number=(organization_number)
      if !organization_number.nil? && organization_number.to_s.length > 100
        fail ArgumentError, 'invalid value for "organization_number", the character length must be smaller than or equal to 100.'
      end

      @organization_number = organization_number
    end

    # Custom attribute writer method with validation
    # @param [Object] email Value to be assigned
    def email=(email)
      if !email.nil? && email.to_s.length > 254
        fail ArgumentError, 'invalid value for "email", the character length must be smaller than or equal to 254.'
      end

      if !email.nil? && email.to_s.length < 0
        fail ArgumentError, 'invalid value for "email", the character length must be great than or equal to 0.'
      end

      @email = email
    end

    # Custom attribute writer method with validation
    # @param [Object] invoice_email Value to be assigned
    def invoice_email=(invoice_email)
      if !invoice_email.nil? && invoice_email.to_s.length > 254
        fail ArgumentError, 'invalid value for "invoice_email", the character length must be smaller than or equal to 254.'
      end

      if !invoice_email.nil? && invoice_email.to_s.length < 0
        fail ArgumentError, 'invalid value for "invoice_email", the character length must be great than or equal to 0.'
      end

      @invoice_email = invoice_email
    end

    # Custom attribute writer method with validation
    # @param [Object] overdue_notice_email Value to be assigned
    def overdue_notice_email=(overdue_notice_email)
      if !overdue_notice_email.nil? && overdue_notice_email.to_s.length > 254
        fail ArgumentError, 'invalid value for "overdue_notice_email", the character length must be smaller than or equal to 254.'
      end

      if !overdue_notice_email.nil? && overdue_notice_email.to_s.length < 0
        fail ArgumentError, 'invalid value for "overdue_notice_email", the character length must be great than or equal to 0.'
      end

      @overdue_notice_email = overdue_notice_email
    end

    # Custom attribute writer method with validation
    # @param [Object] phone_number Value to be assigned
    def phone_number=(phone_number)
      if !phone_number.nil? && phone_number.to_s.length > 100
        fail ArgumentError, 'invalid value for "phone_number", the character length must be smaller than or equal to 100.'
      end

      @phone_number = phone_number
    end

    # Custom attribute writer method with validation
    # @param [Object] phone_number_mobile Value to be assigned
    def phone_number_mobile=(phone_number_mobile)
      if !phone_number_mobile.nil? && phone_number_mobile.to_s.length > 100
        fail ArgumentError, 'invalid value for "phone_number_mobile", the character length must be smaller than or equal to 100.'
      end

      @phone_number_mobile = phone_number_mobile
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
          organization_number == o.organization_number &&
          supplier_number == o.supplier_number &&
          customer_number == o.customer_number &&
          is_supplier == o.is_supplier &&
          is_customer == o.is_customer &&
          is_inactive == o.is_inactive &&
          email == o.email &&
          bank_accounts == o.bank_accounts &&
          invoice_email == o.invoice_email &&
          overdue_notice_email == o.overdue_notice_email &&
          phone_number == o.phone_number &&
          phone_number_mobile == o.phone_number_mobile &&
          description == o.description &&
          is_private_individual == o.is_private_individual &&
          show_products == o.show_products &&
          account_manager == o.account_manager &&
          postal_address == o.postal_address &&
          physical_address == o.physical_address &&
          delivery_address == o.delivery_address &&
          category1 == o.category1 &&
          category2 == o.category2 &&
          category3 == o.category3 &&
          bank_account_presentation == o.bank_account_presentation &&
          currency == o.currency &&
          ledger_account == o.ledger_account
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, name, organization_number, supplier_number, customer_number, is_supplier, is_customer, is_inactive, email, bank_accounts, invoice_email, overdue_notice_email, phone_number, phone_number_mobile, description, is_private_individual, show_products, account_manager, postal_address, physical_address, delivery_address, category1, category2, category3, bank_account_presentation, currency, ledger_account].hash
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
