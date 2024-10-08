=begin
#Tripletex API

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class SalarySpecificationInternal
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    # Type of specification; only TYPE_MANUAL are user create- and editable
    attr_accessor :specification_type

    attr_accessor :rate

    attr_accessor :count

    attr_accessor :project

    attr_accessor :department

    attr_accessor :salary_type

    attr_accessor :payslip

    attr_accessor :employee

    attr_accessor :description

    attr_accessor :year

    attr_accessor :month

    attr_accessor :amount

    # Salary specification supplement. Required if the salaryType requires supplementary information.
    attr_accessor :supplement

    attr_accessor :external_changes_since_last_time

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
        :'specification_type' => :'specificationType',
        :'rate' => :'rate',
        :'count' => :'count',
        :'project' => :'project',
        :'department' => :'department',
        :'salary_type' => :'salaryType',
        :'payslip' => :'payslip',
        :'employee' => :'employee',
        :'description' => :'description',
        :'year' => :'year',
        :'month' => :'month',
        :'amount' => :'amount',
        :'supplement' => :'supplement',
        :'external_changes_since_last_time' => :'externalChangesSinceLastTime'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'specification_type' => :'String',
        :'rate' => :'Float',
        :'count' => :'Float',
        :'project' => :'Project',
        :'department' => :'Department',
        :'salary_type' => :'SalaryTypeInternal',
        :'payslip' => :'PayslipInternal',
        :'employee' => :'Employee',
        :'description' => :'String',
        :'year' => :'Integer',
        :'month' => :'Integer',
        :'amount' => :'Float',
        :'supplement' => :'SalarySpecSupplementInternal',
        :'external_changes_since_last_time' => :'BOOLEAN'
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

      if attributes.has_key?(:'specificationType')
        self.specification_type = attributes[:'specificationType']
      end

      if attributes.has_key?(:'rate')
        self.rate = attributes[:'rate']
      end

      if attributes.has_key?(:'count')
        self.count = attributes[:'count']
      end

      if attributes.has_key?(:'project')
        self.project = attributes[:'project']
      end

      if attributes.has_key?(:'department')
        self.department = attributes[:'department']
      end

      if attributes.has_key?(:'salaryType')
        self.salary_type = attributes[:'salaryType']
      end

      if attributes.has_key?(:'payslip')
        self.payslip = attributes[:'payslip']
      end

      if attributes.has_key?(:'employee')
        self.employee = attributes[:'employee']
      end

      if attributes.has_key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.has_key?(:'year')
        self.year = attributes[:'year']
      end

      if attributes.has_key?(:'month')
        self.month = attributes[:'month']
      end

      if attributes.has_key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.has_key?(:'supplement')
        self.supplement = attributes[:'supplement']
      end

      if attributes.has_key?(:'externalChangesSinceLastTime')
        self.external_changes_since_last_time = attributes[:'externalChangesSinceLastTime']
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
      specification_type_validator = EnumAttributeValidator.new('String', ['TYPE_MONTHLY_PAY', 'TYPE_HOURLIST', 'TYPE_HOURS', 'TYPE_TRAVEL_REPORT', 'TYPE_TAX', 'TYPE_MANUAL', 'TYPE_VACATION_ALLOWANCE', 'TYPE_VACATION_ALLOWANCE_EXTRA', 'TYPE_VACATION_CORRECTION', 'TYPE_VACATION_FULL_MONTH_DEDUCTION', 'TYPE_LEDGER', 'TYPE_FLEXI_ADJUSTMENT', 'TYPE_MESAN_BONUS', 'TYPE_REGULAR', 'TYPE_ABSENCE', 'TYPE_READJUSTMENT'])
      return false unless specification_type_validator.valid?(@specification_type)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] specification_type Object to be assigned
    def specification_type=(specification_type)
      validator = EnumAttributeValidator.new('String', ['TYPE_MONTHLY_PAY', 'TYPE_HOURLIST', 'TYPE_HOURS', 'TYPE_TRAVEL_REPORT', 'TYPE_TAX', 'TYPE_MANUAL', 'TYPE_VACATION_ALLOWANCE', 'TYPE_VACATION_ALLOWANCE_EXTRA', 'TYPE_VACATION_CORRECTION', 'TYPE_VACATION_FULL_MONTH_DEDUCTION', 'TYPE_LEDGER', 'TYPE_FLEXI_ADJUSTMENT', 'TYPE_MESAN_BONUS', 'TYPE_REGULAR', 'TYPE_ABSENCE', 'TYPE_READJUSTMENT'])
      unless validator.valid?(specification_type)
        fail ArgumentError, 'invalid value for "specification_type", must be one of #{validator.allowable_values}.'
      end
      @specification_type = specification_type
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
          specification_type == o.specification_type &&
          rate == o.rate &&
          count == o.count &&
          project == o.project &&
          department == o.department &&
          salary_type == o.salary_type &&
          payslip == o.payslip &&
          employee == o.employee &&
          description == o.description &&
          year == o.year &&
          month == o.month &&
          amount == o.amount &&
          supplement == o.supplement &&
          external_changes_since_last_time == o.external_changes_since_last_time
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, specification_type, rate, count, project, department, salary_type, payslip, employee, description, year, month, amount, supplement, external_changes_since_last_time].hash
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
