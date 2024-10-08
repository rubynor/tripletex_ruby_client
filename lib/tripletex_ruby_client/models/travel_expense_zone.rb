=begin
#Tripletex API

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class TravelExpenseZone
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    # The ISO 3166-1 Alpha2 code of the country (2 letters). https://en.wikipedia.org/wiki/ISO_3166-1
    attr_accessor :country_code

    attr_accessor :zone_name

    attr_accessor :is_disabled

    # The Government name 
    attr_accessor :government_name

    attr_accessor :continent

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'version' => :'version',
        :'changes' => :'changes',
        :'url' => :'url',
        :'country_code' => :'countryCode',
        :'zone_name' => :'zoneName',
        :'is_disabled' => :'isDisabled',
        :'government_name' => :'governmentName',
        :'continent' => :'continent'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'country_code' => :'String',
        :'zone_name' => :'String',
        :'is_disabled' => :'BOOLEAN',
        :'government_name' => :'String',
        :'continent' => :'String'
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

      if attributes.has_key?(:'countryCode')
        self.country_code = attributes[:'countryCode']
      end

      if attributes.has_key?(:'zoneName')
        self.zone_name = attributes[:'zoneName']
      end

      if attributes.has_key?(:'isDisabled')
        self.is_disabled = attributes[:'isDisabled']
      end

      if attributes.has_key?(:'governmentName')
        self.government_name = attributes[:'governmentName']
      end

      if attributes.has_key?(:'continent')
        self.continent = attributes[:'continent']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@zone_name.nil? && @zone_name.to_s.length > 255
        invalid_properties.push('invalid value for "zone_name", the character length must be smaller than or equal to 255.')
      end

      if !@government_name.nil? && @government_name.to_s.length > 255
        invalid_properties.push('invalid value for "government_name", the character length must be smaller than or equal to 255.')
      end

      if !@continent.nil? && @continent.to_s.length > 50
        invalid_properties.push('invalid value for "continent", the character length must be smaller than or equal to 50.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@zone_name.nil? && @zone_name.to_s.length > 255
      return false if !@government_name.nil? && @government_name.to_s.length > 255
      return false if !@continent.nil? && @continent.to_s.length > 50
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] zone_name Value to be assigned
    def zone_name=(zone_name)
      if !zone_name.nil? && zone_name.to_s.length > 255
        fail ArgumentError, 'invalid value for "zone_name", the character length must be smaller than or equal to 255.'
      end

      @zone_name = zone_name
    end

    # Custom attribute writer method with validation
    # @param [Object] government_name Value to be assigned
    def government_name=(government_name)
      if !government_name.nil? && government_name.to_s.length > 255
        fail ArgumentError, 'invalid value for "government_name", the character length must be smaller than or equal to 255.'
      end

      @government_name = government_name
    end

    # Custom attribute writer method with validation
    # @param [Object] continent Value to be assigned
    def continent=(continent)
      if !continent.nil? && continent.to_s.length > 50
        fail ArgumentError, 'invalid value for "continent", the character length must be smaller than or equal to 50.'
      end

      @continent = continent
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
          country_code == o.country_code &&
          zone_name == o.zone_name &&
          is_disabled == o.is_disabled &&
          government_name == o.government_name &&
          continent == o.continent
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, country_code, zone_name, is_disabled, government_name, continent].hash
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
