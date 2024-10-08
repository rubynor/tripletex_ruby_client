=begin
#Tripletex API

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class Account
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    attr_accessor :number

    attr_accessor :name

    attr_accessor :description

    attr_accessor :type

    # List of legal vat types for this account.
    attr_accessor :legal_vat_types

    # Supported ledger types, default is GENERAL. Only available for customers with the module multiple ledgers.
    attr_accessor :ledger_type

    # The default vat type for this account.
    attr_accessor :vat_type

    # True if all entries on this account must have the vat type given by vatType.
    attr_accessor :vat_locked

    # If given, all entries on this account must have this currency.
    attr_accessor :currency

    # True if it should be possible to close entries on this account and it is possible to filter on open entries.
    attr_accessor :is_closeable

    # True if this account is applicable for supplier invoice registration.
    attr_accessor :is_applicable_for_supplier_invoice

    # True if this account must be reconciled before the accounting period closure.
    attr_accessor :require_reconciliation

    # Inactive accounts will not show up in UI lists.
    attr_accessor :is_inactive

    attr_accessor :is_bank_account

    attr_accessor :is_invoice_account

    attr_accessor :bank_account_number

    attr_accessor :bank_account_country

    attr_accessor :bank_name

    attr_accessor :bank_account_iban

    attr_accessor :bank_account_swift

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
        :'number' => :'number',
        :'name' => :'name',
        :'description' => :'description',
        :'type' => :'type',
        :'legal_vat_types' => :'legalVatTypes',
        :'ledger_type' => :'ledgerType',
        :'vat_type' => :'vatType',
        :'vat_locked' => :'vatLocked',
        :'currency' => :'currency',
        :'is_closeable' => :'isCloseable',
        :'is_applicable_for_supplier_invoice' => :'isApplicableForSupplierInvoice',
        :'require_reconciliation' => :'requireReconciliation',
        :'is_inactive' => :'isInactive',
        :'is_bank_account' => :'isBankAccount',
        :'is_invoice_account' => :'isInvoiceAccount',
        :'bank_account_number' => :'bankAccountNumber',
        :'bank_account_country' => :'bankAccountCountry',
        :'bank_name' => :'bankName',
        :'bank_account_iban' => :'bankAccountIBAN',
        :'bank_account_swift' => :'bankAccountSWIFT'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'number' => :'Integer',
        :'name' => :'String',
        :'description' => :'String',
        :'type' => :'String',
        :'legal_vat_types' => :'Array<VatType>',
        :'ledger_type' => :'String',
        :'vat_type' => :'VatType',
        :'vat_locked' => :'BOOLEAN',
        :'currency' => :'Currency',
        :'is_closeable' => :'BOOLEAN',
        :'is_applicable_for_supplier_invoice' => :'BOOLEAN',
        :'require_reconciliation' => :'BOOLEAN',
        :'is_inactive' => :'BOOLEAN',
        :'is_bank_account' => :'BOOLEAN',
        :'is_invoice_account' => :'BOOLEAN',
        :'bank_account_number' => :'String',
        :'bank_account_country' => :'Country',
        :'bank_name' => :'String',
        :'bank_account_iban' => :'String',
        :'bank_account_swift' => :'String'
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

      if attributes.has_key?(:'number')
        self.number = attributes[:'number']
      end

      if attributes.has_key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.has_key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.has_key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.has_key?(:'legalVatTypes')
        if (value = attributes[:'legalVatTypes']).is_a?(Array)
          self.legal_vat_types = value
        end
      end

      if attributes.has_key?(:'ledgerType')
        self.ledger_type = attributes[:'ledgerType']
      end

      if attributes.has_key?(:'vatType')
        self.vat_type = attributes[:'vatType']
      end

      if attributes.has_key?(:'vatLocked')
        self.vat_locked = attributes[:'vatLocked']
      end

      if attributes.has_key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.has_key?(:'isCloseable')
        self.is_closeable = attributes[:'isCloseable']
      end

      if attributes.has_key?(:'isApplicableForSupplierInvoice')
        self.is_applicable_for_supplier_invoice = attributes[:'isApplicableForSupplierInvoice']
      end

      if attributes.has_key?(:'requireReconciliation')
        self.require_reconciliation = attributes[:'requireReconciliation']
      end

      if attributes.has_key?(:'isInactive')
        self.is_inactive = attributes[:'isInactive']
      end

      if attributes.has_key?(:'isBankAccount')
        self.is_bank_account = attributes[:'isBankAccount']
      end

      if attributes.has_key?(:'isInvoiceAccount')
        self.is_invoice_account = attributes[:'isInvoiceAccount']
      end

      if attributes.has_key?(:'bankAccountNumber')
        self.bank_account_number = attributes[:'bankAccountNumber']
      end

      if attributes.has_key?(:'bankAccountCountry')
        self.bank_account_country = attributes[:'bankAccountCountry']
      end

      if attributes.has_key?(:'bankName')
        self.bank_name = attributes[:'bankName']
      end

      if attributes.has_key?(:'bankAccountIBAN')
        self.bank_account_iban = attributes[:'bankAccountIBAN']
      end

      if attributes.has_key?(:'bankAccountSWIFT')
        self.bank_account_swift = attributes[:'bankAccountSWIFT']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @number.nil?
        invalid_properties.push('invalid value for "number", number cannot be nil.')
      end

      if @number < 0
        invalid_properties.push('invalid value for "number", must be greater than or equal to 0.')
      end

      if @name.nil?
        invalid_properties.push('invalid value for "name", name cannot be nil.')
      end

      if @name.to_s.length > 255
        invalid_properties.push('invalid value for "name", the character length must be smaller than or equal to 255.')
      end

      if !@bank_account_number.nil? && @bank_account_number.to_s.length > 100
        invalid_properties.push('invalid value for "bank_account_number", the character length must be smaller than or equal to 100.')
      end

      if !@bank_name.nil? && @bank_name.to_s.length > 255
        invalid_properties.push('invalid value for "bank_name", the character length must be smaller than or equal to 255.')
      end

      if !@bank_account_iban.nil? && @bank_account_iban.to_s.length > 100
        invalid_properties.push('invalid value for "bank_account_iban", the character length must be smaller than or equal to 100.')
      end

      if !@bank_account_swift.nil? && @bank_account_swift.to_s.length > 100
        invalid_properties.push('invalid value for "bank_account_swift", the character length must be smaller than or equal to 100.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @number.nil?
      return false if @number < 0
      return false if @name.nil?
      return false if @name.to_s.length > 255
      type_validator = EnumAttributeValidator.new('String', ['ASSETS', 'EQUITY', 'LIABILITIES', 'OPERATING_REVENUES', 'OPERATING_EXPENSES', 'INVESTMENT_INCOME', 'COST_OF_CAPITAL', 'TAX_ON_ORDINARY_ACTIVITIES', 'EXTRAORDINARY_INCOME', 'EXTRAORDINARY_COST', 'TAX_ON_EXTRAORDINARY_ACTIVITIES', 'ANNUAL_RESULT', 'TRANSFERS_AND_ALLOCATIONS'])
      return false unless type_validator.valid?(@type)
      ledger_type_validator = EnumAttributeValidator.new('String', ['GENERAL', 'CUSTOMER', 'VENDOR', 'EMPLOYEE', 'ASSET'])
      return false unless ledger_type_validator.valid?(@ledger_type)
      return false if !@bank_account_number.nil? && @bank_account_number.to_s.length > 100
      return false if !@bank_name.nil? && @bank_name.to_s.length > 255
      return false if !@bank_account_iban.nil? && @bank_account_iban.to_s.length > 100
      return false if !@bank_account_swift.nil? && @bank_account_swift.to_s.length > 100
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] number Value to be assigned
    def number=(number)
      if number.nil?
        fail ArgumentError, 'number cannot be nil'
      end

      if number < 0
        fail ArgumentError, 'invalid value for "number", must be greater than or equal to 0.'
      end

      @number = number
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('String', ['ASSETS', 'EQUITY', 'LIABILITIES', 'OPERATING_REVENUES', 'OPERATING_EXPENSES', 'INVESTMENT_INCOME', 'COST_OF_CAPITAL', 'TAX_ON_ORDINARY_ACTIVITIES', 'EXTRAORDINARY_INCOME', 'EXTRAORDINARY_COST', 'TAX_ON_EXTRAORDINARY_ACTIVITIES', 'ANNUAL_RESULT', 'TRANSFERS_AND_ALLOCATIONS'])
      unless validator.valid?(type)
        fail ArgumentError, 'invalid value for "type", must be one of #{validator.allowable_values}.'
      end
      @type = type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] ledger_type Object to be assigned
    def ledger_type=(ledger_type)
      validator = EnumAttributeValidator.new('String', ['GENERAL', 'CUSTOMER', 'VENDOR', 'EMPLOYEE', 'ASSET'])
      unless validator.valid?(ledger_type)
        fail ArgumentError, 'invalid value for "ledger_type", must be one of #{validator.allowable_values}.'
      end
      @ledger_type = ledger_type
    end

    # Custom attribute writer method with validation
    # @param [Object] bank_account_number Value to be assigned
    def bank_account_number=(bank_account_number)
      if !bank_account_number.nil? && bank_account_number.to_s.length > 100
        fail ArgumentError, 'invalid value for "bank_account_number", the character length must be smaller than or equal to 100.'
      end

      @bank_account_number = bank_account_number
    end

    # Custom attribute writer method with validation
    # @param [Object] bank_name Value to be assigned
    def bank_name=(bank_name)
      if !bank_name.nil? && bank_name.to_s.length > 255
        fail ArgumentError, 'invalid value for "bank_name", the character length must be smaller than or equal to 255.'
      end

      @bank_name = bank_name
    end

    # Custom attribute writer method with validation
    # @param [Object] bank_account_iban Value to be assigned
    def bank_account_iban=(bank_account_iban)
      if !bank_account_iban.nil? && bank_account_iban.to_s.length > 100
        fail ArgumentError, 'invalid value for "bank_account_iban", the character length must be smaller than or equal to 100.'
      end

      @bank_account_iban = bank_account_iban
    end

    # Custom attribute writer method with validation
    # @param [Object] bank_account_swift Value to be assigned
    def bank_account_swift=(bank_account_swift)
      if !bank_account_swift.nil? && bank_account_swift.to_s.length > 100
        fail ArgumentError, 'invalid value for "bank_account_swift", the character length must be smaller than or equal to 100.'
      end

      @bank_account_swift = bank_account_swift
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
          number == o.number &&
          name == o.name &&
          description == o.description &&
          type == o.type &&
          legal_vat_types == o.legal_vat_types &&
          ledger_type == o.ledger_type &&
          vat_type == o.vat_type &&
          vat_locked == o.vat_locked &&
          currency == o.currency &&
          is_closeable == o.is_closeable &&
          is_applicable_for_supplier_invoice == o.is_applicable_for_supplier_invoice &&
          require_reconciliation == o.require_reconciliation &&
          is_inactive == o.is_inactive &&
          is_bank_account == o.is_bank_account &&
          is_invoice_account == o.is_invoice_account &&
          bank_account_number == o.bank_account_number &&
          bank_account_country == o.bank_account_country &&
          bank_name == o.bank_name &&
          bank_account_iban == o.bank_account_iban &&
          bank_account_swift == o.bank_account_swift
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, number, name, description, type, legal_vat_types, ledger_type, vat_type, vat_locked, currency, is_closeable, is_applicable_for_supplier_invoice, require_reconciliation, is_inactive, is_bank_account, is_invoice_account, bank_account_number, bank_account_country, bank_name, bank_account_iban, bank_account_swift].hash
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
