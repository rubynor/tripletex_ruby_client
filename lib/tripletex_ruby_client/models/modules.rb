=begin
#Tripletex API

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class Modules
    # Not readable. Only for input.
    attr_accessor :accounting

    # Not readable. Only for input.
    attr_accessor :invoice

    # Not readable. Only for input.
    attr_accessor :salary

    attr_accessor :salary_start_date

    # Not readable. Only for input.
    attr_accessor :project

    attr_accessor :ocr

    attr_accessor :remit

    # Not readable. Only for input.
    attr_accessor :electronic_vouchers

    # Not readable. Only for input.
    attr_accessor :electro

    # Not readable. Only for input.
    attr_accessor :vvs

    attr_accessor :agro

    attr_accessor :mamut

    # Only readable for now
    attr_accessor :approve_voucher

    attr_accessor :moduleprojecteconomy

    attr_accessor :moduleemployee

    attr_accessor :module_contact

    attr_accessor :modulecustomer

    attr_accessor :moduledepartment

    attr_accessor :moduleprojectcategory

    attr_accessor :moduleinvoice

    attr_accessor :module_currency

    attr_accessor :module_project_budget

    attr_accessor :module_factoring_visma_finance

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
        :'accounting' => :'accounting',
        :'invoice' => :'invoice',
        :'salary' => :'salary',
        :'salary_start_date' => :'salaryStartDate',
        :'project' => :'project',
        :'ocr' => :'ocr',
        :'remit' => :'remit',
        :'electronic_vouchers' => :'electronicVouchers',
        :'electro' => :'electro',
        :'vvs' => :'vvs',
        :'agro' => :'agro',
        :'mamut' => :'mamut',
        :'approve_voucher' => :'approveVoucher',
        :'moduleprojecteconomy' => :'moduleprojecteconomy',
        :'moduleemployee' => :'moduleemployee',
        :'module_contact' => :'moduleContact',
        :'modulecustomer' => :'modulecustomer',
        :'moduledepartment' => :'moduledepartment',
        :'moduleprojectcategory' => :'moduleprojectcategory',
        :'moduleinvoice' => :'moduleinvoice',
        :'module_currency' => :'moduleCurrency',
        :'module_project_budget' => :'moduleProjectBudget',
        :'module_factoring_visma_finance' => :'moduleFactoringVismaFinance'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'accounting' => :'BOOLEAN',
        :'invoice' => :'BOOLEAN',
        :'salary' => :'BOOLEAN',
        :'salary_start_date' => :'Date',
        :'project' => :'BOOLEAN',
        :'ocr' => :'BOOLEAN',
        :'remit' => :'BOOLEAN',
        :'electronic_vouchers' => :'BOOLEAN',
        :'electro' => :'BOOLEAN',
        :'vvs' => :'BOOLEAN',
        :'agro' => :'BOOLEAN',
        :'mamut' => :'BOOLEAN',
        :'approve_voucher' => :'BOOLEAN',
        :'moduleprojecteconomy' => :'BOOLEAN',
        :'moduleemployee' => :'BOOLEAN',
        :'module_contact' => :'BOOLEAN',
        :'modulecustomer' => :'BOOLEAN',
        :'moduledepartment' => :'BOOLEAN',
        :'moduleprojectcategory' => :'BOOLEAN',
        :'moduleinvoice' => :'BOOLEAN',
        :'module_currency' => :'BOOLEAN',
        :'module_project_budget' => :'BOOLEAN',
        :'module_factoring_visma_finance' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'accounting')
        self.accounting = attributes[:'accounting']
      end

      if attributes.has_key?(:'invoice')
        self.invoice = attributes[:'invoice']
      end

      if attributes.has_key?(:'salary')
        self.salary = attributes[:'salary']
      end

      if attributes.has_key?(:'salaryStartDate')
        self.salary_start_date = attributes[:'salaryStartDate']
      end

      if attributes.has_key?(:'project')
        self.project = attributes[:'project']
      end

      if attributes.has_key?(:'ocr')
        self.ocr = attributes[:'ocr']
      end

      if attributes.has_key?(:'remit')
        self.remit = attributes[:'remit']
      end

      if attributes.has_key?(:'electronicVouchers')
        self.electronic_vouchers = attributes[:'electronicVouchers']
      end

      if attributes.has_key?(:'electro')
        self.electro = attributes[:'electro']
      end

      if attributes.has_key?(:'vvs')
        self.vvs = attributes[:'vvs']
      end

      if attributes.has_key?(:'agro')
        self.agro = attributes[:'agro']
      end

      if attributes.has_key?(:'mamut')
        self.mamut = attributes[:'mamut']
      end

      if attributes.has_key?(:'approveVoucher')
        self.approve_voucher = attributes[:'approveVoucher']
      end

      if attributes.has_key?(:'moduleprojecteconomy')
        self.moduleprojecteconomy = attributes[:'moduleprojecteconomy']
      end

      if attributes.has_key?(:'moduleemployee')
        self.moduleemployee = attributes[:'moduleemployee']
      end

      if attributes.has_key?(:'moduleContact')
        self.module_contact = attributes[:'moduleContact']
      end

      if attributes.has_key?(:'modulecustomer')
        self.modulecustomer = attributes[:'modulecustomer']
      end

      if attributes.has_key?(:'moduledepartment')
        self.moduledepartment = attributes[:'moduledepartment']
      end

      if attributes.has_key?(:'moduleprojectcategory')
        self.moduleprojectcategory = attributes[:'moduleprojectcategory']
      end

      if attributes.has_key?(:'moduleinvoice')
        self.moduleinvoice = attributes[:'moduleinvoice']
      end

      if attributes.has_key?(:'moduleCurrency')
        self.module_currency = attributes[:'moduleCurrency']
      end

      if attributes.has_key?(:'moduleProjectBudget')
        self.module_project_budget = attributes[:'moduleProjectBudget']
      end

      if attributes.has_key?(:'moduleFactoringVismaFinance')
        self.module_factoring_visma_finance = attributes[:'moduleFactoringVismaFinance']
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
      module_factoring_visma_finance_validator = EnumAttributeValidator.new('String', ['UNKNOWN', 'OFF', 'PROCESSING', 'REJECTED', 'ON', 'DEACTIVATED', 'ON_FOR_SEND_ONLY', 'ON_FOR_RECEIVE_ONLY_NOT_UPGRADABLE_TO_SEND', 'ON_FOR_SEND_ONLY_NOT_UPGRADABLE_TO_RECEIVE', 'ON_FOR_SEND_ONLY_BUT_PROCESSING_TO_RECEIVE'])
      return false unless module_factoring_visma_finance_validator.valid?(@module_factoring_visma_finance)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] module_factoring_visma_finance Object to be assigned
    def module_factoring_visma_finance=(module_factoring_visma_finance)
      validator = EnumAttributeValidator.new('String', ['UNKNOWN', 'OFF', 'PROCESSING', 'REJECTED', 'ON', 'DEACTIVATED', 'ON_FOR_SEND_ONLY', 'ON_FOR_RECEIVE_ONLY_NOT_UPGRADABLE_TO_SEND', 'ON_FOR_SEND_ONLY_NOT_UPGRADABLE_TO_RECEIVE', 'ON_FOR_SEND_ONLY_BUT_PROCESSING_TO_RECEIVE'])
      unless validator.valid?(module_factoring_visma_finance)
        fail ArgumentError, 'invalid value for "module_factoring_visma_finance", must be one of #{validator.allowable_values}.'
      end
      @module_factoring_visma_finance = module_factoring_visma_finance
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          accounting == o.accounting &&
          invoice == o.invoice &&
          salary == o.salary &&
          salary_start_date == o.salary_start_date &&
          project == o.project &&
          ocr == o.ocr &&
          remit == o.remit &&
          electronic_vouchers == o.electronic_vouchers &&
          electro == o.electro &&
          vvs == o.vvs &&
          agro == o.agro &&
          mamut == o.mamut &&
          approve_voucher == o.approve_voucher &&
          moduleprojecteconomy == o.moduleprojecteconomy &&
          moduleemployee == o.moduleemployee &&
          module_contact == o.module_contact &&
          modulecustomer == o.modulecustomer &&
          moduledepartment == o.moduledepartment &&
          moduleprojectcategory == o.moduleprojectcategory &&
          moduleinvoice == o.moduleinvoice &&
          module_currency == o.module_currency &&
          module_project_budget == o.module_project_budget &&
          module_factoring_visma_finance == o.module_factoring_visma_finance
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [accounting, invoice, salary, salary_start_date, project, ocr, remit, electronic_vouchers, electro, vvs, agro, mamut, approve_voucher, moduleprojecteconomy, moduleemployee, module_contact, modulecustomer, moduledepartment, moduleprojectcategory, moduleinvoice, module_currency, module_project_budget, module_factoring_visma_finance].hash
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
