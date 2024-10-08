=begin
#Tripletex API

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class PayslipInternal
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    attr_accessor :transaction

    attr_accessor :employee

    # Voucher date.
    attr_accessor :date

    attr_accessor :year

    attr_accessor :month

    # Link to salary specifications.
    attr_accessor :specifications

    # Link to salary specifications.
    attr_accessor :manual_specifications

    attr_accessor :vacation_allowance_amount

    attr_accessor :gross_amount

    attr_accessor :amount

    attr_accessor :number

    attr_accessor :payslip_helper

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'version' => :'version',
        :'changes' => :'changes',
        :'url' => :'url',
        :'transaction' => :'transaction',
        :'employee' => :'employee',
        :'date' => :'date',
        :'year' => :'year',
        :'month' => :'month',
        :'specifications' => :'specifications',
        :'manual_specifications' => :'manualSpecifications',
        :'vacation_allowance_amount' => :'vacationAllowanceAmount',
        :'gross_amount' => :'grossAmount',
        :'amount' => :'amount',
        :'number' => :'number',
        :'payslip_helper' => :'payslipHelper'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'transaction' => :'SalaryTransactionInternal',
        :'employee' => :'Employee',
        :'date' => :'String',
        :'year' => :'Integer',
        :'month' => :'Integer',
        :'specifications' => :'Array<SalarySpecificationInternal>',
        :'manual_specifications' => :'Array<SalarySpecificationInternal>',
        :'vacation_allowance_amount' => :'Float',
        :'gross_amount' => :'Float',
        :'amount' => :'Float',
        :'number' => :'Integer',
        :'payslip_helper' => :'PayslipHelperInternal'
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

      if attributes.has_key?(:'transaction')
        self.transaction = attributes[:'transaction']
      end

      if attributes.has_key?(:'employee')
        self.employee = attributes[:'employee']
      end

      if attributes.has_key?(:'date')
        self.date = attributes[:'date']
      end

      if attributes.has_key?(:'year')
        self.year = attributes[:'year']
      end

      if attributes.has_key?(:'month')
        self.month = attributes[:'month']
      end

      if attributes.has_key?(:'specifications')
        if (value = attributes[:'specifications']).is_a?(Array)
          self.specifications = value
        end
      end

      if attributes.has_key?(:'manualSpecifications')
        if (value = attributes[:'manualSpecifications']).is_a?(Array)
          self.manual_specifications = value
        end
      end

      if attributes.has_key?(:'vacationAllowanceAmount')
        self.vacation_allowance_amount = attributes[:'vacationAllowanceAmount']
      end

      if attributes.has_key?(:'grossAmount')
        self.gross_amount = attributes[:'grossAmount']
      end

      if attributes.has_key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.has_key?(:'number')
        self.number = attributes[:'number']
      end

      if attributes.has_key?(:'payslipHelper')
        self.payslip_helper = attributes[:'payslipHelper']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @employee.nil?
        invalid_properties.push('invalid value for "employee", employee cannot be nil.')
      end

      if !@number.nil? && @number < 0
        invalid_properties.push('invalid value for "number", must be greater than or equal to 0.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @employee.nil?
      return false if !@number.nil? && @number < 0
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] number Value to be assigned
    def number=(number)
      if !number.nil? && number < 0
        fail ArgumentError, 'invalid value for "number", must be greater than or equal to 0.'
      end

      @number = number
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
          transaction == o.transaction &&
          employee == o.employee &&
          date == o.date &&
          year == o.year &&
          month == o.month &&
          specifications == o.specifications &&
          manual_specifications == o.manual_specifications &&
          vacation_allowance_amount == o.vacation_allowance_amount &&
          gross_amount == o.gross_amount &&
          amount == o.amount &&
          number == o.number &&
          payslip_helper == o.payslip_helper
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, transaction, employee, date, year, month, specifications, manual_specifications, vacation_allowance_amount, gross_amount, amount, number, payslip_helper].hash
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
