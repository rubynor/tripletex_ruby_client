=begin
#Tripletex API

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class Posting
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    attr_accessor :voucher

    attr_accessor :date

    attr_accessor :description

    attr_accessor :account

    # The Amortization account. AmortizationAccountId, amortizationStartDate and amortizationEndDate should be provided. If amortizationStartDate and amortizationEndDate are provided, while amortizationAccountId is NULL, then the default amortization account will be used.
    attr_accessor :amortization_account

    # Amortization start date. AmortizationAccountId, amortizationStartDate and amortizationEndDate should be provided.
    attr_accessor :amortization_start_date

    attr_accessor :amortization_end_date

    attr_accessor :customer

    attr_accessor :supplier

    attr_accessor :employee

    attr_accessor :project

    attr_accessor :product

    attr_accessor :department

    attr_accessor :vat_type

    attr_accessor :amount

    attr_accessor :amount_currency

    attr_accessor :amount_gross

    attr_accessor :amount_gross_currency

    attr_accessor :currency

    attr_accessor :close_group

    attr_accessor :invoice_number

    attr_accessor :term_of_payment

    attr_accessor :row

    attr_accessor :type

    # External reference for identifying payment basis of the posting, e.g., KID, customer identification or credit note number.
    attr_accessor :external_ref

    attr_accessor :system_generated

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
        :'voucher' => :'voucher',
        :'date' => :'date',
        :'description' => :'description',
        :'account' => :'account',
        :'amortization_account' => :'amortizationAccount',
        :'amortization_start_date' => :'amortizationStartDate',
        :'amortization_end_date' => :'amortizationEndDate',
        :'customer' => :'customer',
        :'supplier' => :'supplier',
        :'employee' => :'employee',
        :'project' => :'project',
        :'product' => :'product',
        :'department' => :'department',
        :'vat_type' => :'vatType',
        :'amount' => :'amount',
        :'amount_currency' => :'amountCurrency',
        :'amount_gross' => :'amountGross',
        :'amount_gross_currency' => :'amountGrossCurrency',
        :'currency' => :'currency',
        :'close_group' => :'closeGroup',
        :'invoice_number' => :'invoiceNumber',
        :'term_of_payment' => :'termOfPayment',
        :'row' => :'row',
        :'type' => :'type',
        :'external_ref' => :'externalRef',
        :'system_generated' => :'systemGenerated'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'voucher' => :'Voucher',
        :'date' => :'String',
        :'description' => :'String',
        :'account' => :'Account',
        :'amortization_account' => :'Account',
        :'amortization_start_date' => :'String',
        :'amortization_end_date' => :'String',
        :'customer' => :'Customer',
        :'supplier' => :'Supplier',
        :'employee' => :'Employee',
        :'project' => :'Project',
        :'product' => :'Product',
        :'department' => :'Department',
        :'vat_type' => :'VatType',
        :'amount' => :'Float',
        :'amount_currency' => :'Float',
        :'amount_gross' => :'Float',
        :'amount_gross_currency' => :'Float',
        :'currency' => :'Currency',
        :'close_group' => :'CloseGroup',
        :'invoice_number' => :'String',
        :'term_of_payment' => :'String',
        :'row' => :'Integer',
        :'type' => :'String',
        :'external_ref' => :'String',
        :'system_generated' => :'BOOLEAN'
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

      if attributes.has_key?(:'voucher')
        self.voucher = attributes[:'voucher']
      end

      if attributes.has_key?(:'date')
        self.date = attributes[:'date']
      end

      if attributes.has_key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.has_key?(:'account')
        self.account = attributes[:'account']
      end

      if attributes.has_key?(:'amortizationAccount')
        self.amortization_account = attributes[:'amortizationAccount']
      end

      if attributes.has_key?(:'amortizationStartDate')
        self.amortization_start_date = attributes[:'amortizationStartDate']
      end

      if attributes.has_key?(:'amortizationEndDate')
        self.amortization_end_date = attributes[:'amortizationEndDate']
      end

      if attributes.has_key?(:'customer')
        self.customer = attributes[:'customer']
      end

      if attributes.has_key?(:'supplier')
        self.supplier = attributes[:'supplier']
      end

      if attributes.has_key?(:'employee')
        self.employee = attributes[:'employee']
      end

      if attributes.has_key?(:'project')
        self.project = attributes[:'project']
      end

      if attributes.has_key?(:'product')
        self.product = attributes[:'product']
      end

      if attributes.has_key?(:'department')
        self.department = attributes[:'department']
      end

      if attributes.has_key?(:'vatType')
        self.vat_type = attributes[:'vatType']
      end

      if attributes.has_key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.has_key?(:'amountCurrency')
        self.amount_currency = attributes[:'amountCurrency']
      end

      if attributes.has_key?(:'amountGross')
        self.amount_gross = attributes[:'amountGross']
      end

      if attributes.has_key?(:'amountGrossCurrency')
        self.amount_gross_currency = attributes[:'amountGrossCurrency']
      end

      if attributes.has_key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.has_key?(:'closeGroup')
        self.close_group = attributes[:'closeGroup']
      end

      if attributes.has_key?(:'invoiceNumber')
        self.invoice_number = attributes[:'invoiceNumber']
      end

      if attributes.has_key?(:'termOfPayment')
        self.term_of_payment = attributes[:'termOfPayment']
      end

      if attributes.has_key?(:'row')
        self.row = attributes[:'row']
      end

      if attributes.has_key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.has_key?(:'externalRef')
        self.external_ref = attributes[:'externalRef']
      end

      if attributes.has_key?(:'systemGenerated')
        self.system_generated = attributes[:'systemGenerated']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@invoice_number.nil? && @invoice_number.to_s.length > 100
        invalid_properties.push('invalid value for "invoice_number", the character length must be smaller than or equal to 100.')
      end

      if !@row.nil? && @row < 0
        invalid_properties.push('invalid value for "row", must be greater than or equal to 0.')
      end

      if !@external_ref.nil? && @external_ref.to_s.length > 100
        invalid_properties.push('invalid value for "external_ref", the character length must be smaller than or equal to 100.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@invoice_number.nil? && @invoice_number.to_s.length > 100
      return false if !@row.nil? && @row < 0
      type_validator = EnumAttributeValidator.new('String', ['INCOMING_PAYMENT', 'INCOMING_PAYMENT_OPPOSITE', 'INVOICE_EXPENSE', 'OUTGOING_INVOICE_CUSTOMER_POSTING'])
      return false unless type_validator.valid?(@type)
      return false if !@external_ref.nil? && @external_ref.to_s.length > 100
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] invoice_number Value to be assigned
    def invoice_number=(invoice_number)
      if !invoice_number.nil? && invoice_number.to_s.length > 100
        fail ArgumentError, 'invalid value for "invoice_number", the character length must be smaller than or equal to 100.'
      end

      @invoice_number = invoice_number
    end

    # Custom attribute writer method with validation
    # @param [Object] row Value to be assigned
    def row=(row)
      if !row.nil? && row < 0
        fail ArgumentError, 'invalid value for "row", must be greater than or equal to 0.'
      end

      @row = row
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('String', ['INCOMING_PAYMENT', 'INCOMING_PAYMENT_OPPOSITE', 'INVOICE_EXPENSE', 'OUTGOING_INVOICE_CUSTOMER_POSTING'])
      unless validator.valid?(type)
        fail ArgumentError, 'invalid value for "type", must be one of #{validator.allowable_values}.'
      end
      @type = type
    end

    # Custom attribute writer method with validation
    # @param [Object] external_ref Value to be assigned
    def external_ref=(external_ref)
      if !external_ref.nil? && external_ref.to_s.length > 100
        fail ArgumentError, 'invalid value for "external_ref", the character length must be smaller than or equal to 100.'
      end

      @external_ref = external_ref
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
          voucher == o.voucher &&
          date == o.date &&
          description == o.description &&
          account == o.account &&
          amortization_account == o.amortization_account &&
          amortization_start_date == o.amortization_start_date &&
          amortization_end_date == o.amortization_end_date &&
          customer == o.customer &&
          supplier == o.supplier &&
          employee == o.employee &&
          project == o.project &&
          product == o.product &&
          department == o.department &&
          vat_type == o.vat_type &&
          amount == o.amount &&
          amount_currency == o.amount_currency &&
          amount_gross == o.amount_gross &&
          amount_gross_currency == o.amount_gross_currency &&
          currency == o.currency &&
          close_group == o.close_group &&
          invoice_number == o.invoice_number &&
          term_of_payment == o.term_of_payment &&
          row == o.row &&
          type == o.type &&
          external_ref == o.external_ref &&
          system_generated == o.system_generated
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, voucher, date, description, account, amortization_account, amortization_start_date, amortization_end_date, customer, supplier, employee, project, product, department, vat_type, amount, amount_currency, amount_gross, amount_gross_currency, currency, close_group, invoice_number, term_of_payment, row, type, external_ref, system_generated].hash
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
