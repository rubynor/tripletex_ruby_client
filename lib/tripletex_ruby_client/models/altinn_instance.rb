=begin
#Tripletex API

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class AltinnInstance
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    # The altinn archive reference
    attr_accessor :altinn_id

    # The partyId in altinn - refering to the organization
    attr_accessor :party_id

    # The id of the instance in Altinn
    attr_accessor :instance_guid

    # The initials and date of when the instance was created
    attr_accessor :created_info

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'version' => :'version',
        :'changes' => :'changes',
        :'url' => :'url',
        :'altinn_id' => :'altinnId',
        :'party_id' => :'partyId',
        :'instance_guid' => :'instanceGuid',
        :'created_info' => :'createdInfo'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'altinn_id' => :'String',
        :'party_id' => :'String',
        :'instance_guid' => :'String',
        :'created_info' => :'String'
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

      if attributes.has_key?(:'altinnId')
        self.altinn_id = attributes[:'altinnId']
      end

      if attributes.has_key?(:'partyId')
        self.party_id = attributes[:'partyId']
      end

      if attributes.has_key?(:'instanceGuid')
        self.instance_guid = attributes[:'instanceGuid']
      end

      if attributes.has_key?(:'createdInfo')
        self.created_info = attributes[:'createdInfo']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@altinn_id.nil? && @altinn_id.to_s.length > 255
        invalid_properties.push('invalid value for "altinn_id", the character length must be smaller than or equal to 255.')
      end

      if !@party_id.nil? && @party_id.to_s.length > 255
        invalid_properties.push('invalid value for "party_id", the character length must be smaller than or equal to 255.')
      end

      if !@instance_guid.nil? && @instance_guid.to_s.length > 255
        invalid_properties.push('invalid value for "instance_guid", the character length must be smaller than or equal to 255.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@altinn_id.nil? && @altinn_id.to_s.length > 255
      return false if !@party_id.nil? && @party_id.to_s.length > 255
      return false if !@instance_guid.nil? && @instance_guid.to_s.length > 255
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] altinn_id Value to be assigned
    def altinn_id=(altinn_id)
      if !altinn_id.nil? && altinn_id.to_s.length > 255
        fail ArgumentError, 'invalid value for "altinn_id", the character length must be smaller than or equal to 255.'
      end

      @altinn_id = altinn_id
    end

    # Custom attribute writer method with validation
    # @param [Object] party_id Value to be assigned
    def party_id=(party_id)
      if !party_id.nil? && party_id.to_s.length > 255
        fail ArgumentError, 'invalid value for "party_id", the character length must be smaller than or equal to 255.'
      end

      @party_id = party_id
    end

    # Custom attribute writer method with validation
    # @param [Object] instance_guid Value to be assigned
    def instance_guid=(instance_guid)
      if !instance_guid.nil? && instance_guid.to_s.length > 255
        fail ArgumentError, 'invalid value for "instance_guid", the character length must be smaller than or equal to 255.'
      end

      @instance_guid = instance_guid
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
          altinn_id == o.altinn_id &&
          party_id == o.party_id &&
          instance_guid == o.instance_guid &&
          created_info == o.created_info
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, altinn_id, party_id, instance_guid, created_info].hash
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
