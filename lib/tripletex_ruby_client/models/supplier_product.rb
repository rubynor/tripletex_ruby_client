=begin
#Tripletex API

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class SupplierProduct
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    attr_accessor :name

    attr_accessor :number

    attr_accessor :description

    attr_accessor :ean

    # Price purchase (cost) excluding VAT in the product's currency
    attr_accessor :cost_excluding_vat_currency

    # Price of purchase excluding VAT in the product's currency
    attr_accessor :price_excluding_vat_currency

    # Price of purchase including VAT in the product's currency
    attr_accessor :price_including_vat_currency

    attr_accessor :is_inactive

    attr_accessor :product_unit

    attr_accessor :is_stock_item

    attr_accessor :stock_of_goods

    attr_accessor :vat_type

    attr_accessor :currency

    attr_accessor :discount_price

    attr_accessor :supplier

    attr_accessor :resale_product

    attr_accessor :is_deletable

    attr_accessor :vendor_name

    attr_accessor :is_efo_nelfo_product

    attr_accessor :wholesaler_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'version' => :'version',
        :'changes' => :'changes',
        :'url' => :'url',
        :'name' => :'name',
        :'number' => :'number',
        :'description' => :'description',
        :'ean' => :'ean',
        :'cost_excluding_vat_currency' => :'costExcludingVatCurrency',
        :'price_excluding_vat_currency' => :'priceExcludingVatCurrency',
        :'price_including_vat_currency' => :'priceIncludingVatCurrency',
        :'is_inactive' => :'isInactive',
        :'product_unit' => :'productUnit',
        :'is_stock_item' => :'isStockItem',
        :'stock_of_goods' => :'stockOfGoods',
        :'vat_type' => :'vatType',
        :'currency' => :'currency',
        :'discount_price' => :'discountPrice',
        :'supplier' => :'supplier',
        :'resale_product' => :'resaleProduct',
        :'is_deletable' => :'isDeletable',
        :'vendor_name' => :'vendorName',
        :'is_efo_nelfo_product' => :'isEfoNelfoProduct',
        :'wholesaler_id' => :'wholesalerId'
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
        :'number' => :'String',
        :'description' => :'String',
        :'ean' => :'String',
        :'cost_excluding_vat_currency' => :'Float',
        :'price_excluding_vat_currency' => :'Float',
        :'price_including_vat_currency' => :'Float',
        :'is_inactive' => :'BOOLEAN',
        :'product_unit' => :'ProductUnit',
        :'is_stock_item' => :'BOOLEAN',
        :'stock_of_goods' => :'Float',
        :'vat_type' => :'VatType',
        :'currency' => :'Currency',
        :'discount_price' => :'Float',
        :'supplier' => :'Supplier',
        :'resale_product' => :'SupplierProduct',
        :'is_deletable' => :'BOOLEAN',
        :'vendor_name' => :'String',
        :'is_efo_nelfo_product' => :'BOOLEAN',
        :'wholesaler_id' => :'Integer'
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

      if attributes.has_key?(:'number')
        self.number = attributes[:'number']
      end

      if attributes.has_key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.has_key?(:'ean')
        self.ean = attributes[:'ean']
      end

      if attributes.has_key?(:'costExcludingVatCurrency')
        self.cost_excluding_vat_currency = attributes[:'costExcludingVatCurrency']
      end

      if attributes.has_key?(:'priceExcludingVatCurrency')
        self.price_excluding_vat_currency = attributes[:'priceExcludingVatCurrency']
      end

      if attributes.has_key?(:'priceIncludingVatCurrency')
        self.price_including_vat_currency = attributes[:'priceIncludingVatCurrency']
      end

      if attributes.has_key?(:'isInactive')
        self.is_inactive = attributes[:'isInactive']
      end

      if attributes.has_key?(:'productUnit')
        self.product_unit = attributes[:'productUnit']
      end

      if attributes.has_key?(:'isStockItem')
        self.is_stock_item = attributes[:'isStockItem']
      end

      if attributes.has_key?(:'stockOfGoods')
        self.stock_of_goods = attributes[:'stockOfGoods']
      end

      if attributes.has_key?(:'vatType')
        self.vat_type = attributes[:'vatType']
      end

      if attributes.has_key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.has_key?(:'discountPrice')
        self.discount_price = attributes[:'discountPrice']
      end

      if attributes.has_key?(:'supplier')
        self.supplier = attributes[:'supplier']
      end

      if attributes.has_key?(:'resaleProduct')
        self.resale_product = attributes[:'resaleProduct']
      end

      if attributes.has_key?(:'isDeletable')
        self.is_deletable = attributes[:'isDeletable']
      end

      if attributes.has_key?(:'vendorName')
        self.vendor_name = attributes[:'vendorName']
      end

      if attributes.has_key?(:'isEfoNelfoProduct')
        self.is_efo_nelfo_product = attributes[:'isEfoNelfoProduct']
      end

      if attributes.has_key?(:'wholesalerId')
        self.wholesaler_id = attributes[:'wholesalerId']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@name.nil? && @name.to_s.length > 255
        invalid_properties.push('invalid value for "name", the character length must be smaller than or equal to 255.')
      end

      if !@number.nil? && @number.to_s.length > 100
        invalid_properties.push('invalid value for "number", the character length must be smaller than or equal to 100.')
      end

      if !@ean.nil? && @ean.to_s.length > 14
        invalid_properties.push('invalid value for "ean", the character length must be smaller than or equal to 14.')
      end

      if !@wholesaler_id.nil? && @wholesaler_id < 0
        invalid_properties.push('invalid value for "wholesaler_id", must be greater than or equal to 0.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@name.nil? && @name.to_s.length > 255
      return false if !@number.nil? && @number.to_s.length > 100
      return false if !@ean.nil? && @ean.to_s.length > 14
      return false if !@wholesaler_id.nil? && @wholesaler_id < 0
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] name Value to be assigned
    def name=(name)
      if !name.nil? && name.to_s.length > 255
        fail ArgumentError, 'invalid value for "name", the character length must be smaller than or equal to 255.'
      end

      @name = name
    end

    # Custom attribute writer method with validation
    # @param [Object] number Value to be assigned
    def number=(number)
      if !number.nil? && number.to_s.length > 100
        fail ArgumentError, 'invalid value for "number", the character length must be smaller than or equal to 100.'
      end

      @number = number
    end

    # Custom attribute writer method with validation
    # @param [Object] ean Value to be assigned
    def ean=(ean)
      if !ean.nil? && ean.to_s.length > 14
        fail ArgumentError, 'invalid value for "ean", the character length must be smaller than or equal to 14.'
      end

      @ean = ean
    end

    # Custom attribute writer method with validation
    # @param [Object] wholesaler_id Value to be assigned
    def wholesaler_id=(wholesaler_id)
      if !wholesaler_id.nil? && wholesaler_id < 0
        fail ArgumentError, 'invalid value for "wholesaler_id", must be greater than or equal to 0.'
      end

      @wholesaler_id = wholesaler_id
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
          number == o.number &&
          description == o.description &&
          ean == o.ean &&
          cost_excluding_vat_currency == o.cost_excluding_vat_currency &&
          price_excluding_vat_currency == o.price_excluding_vat_currency &&
          price_including_vat_currency == o.price_including_vat_currency &&
          is_inactive == o.is_inactive &&
          product_unit == o.product_unit &&
          is_stock_item == o.is_stock_item &&
          stock_of_goods == o.stock_of_goods &&
          vat_type == o.vat_type &&
          currency == o.currency &&
          discount_price == o.discount_price &&
          supplier == o.supplier &&
          resale_product == o.resale_product &&
          is_deletable == o.is_deletable &&
          vendor_name == o.vendor_name &&
          is_efo_nelfo_product == o.is_efo_nelfo_product &&
          wholesaler_id == o.wholesaler_id
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, name, number, description, ean, cost_excluding_vat_currency, price_excluding_vat_currency, price_including_vat_currency, is_inactive, product_unit, is_stock_item, stock_of_goods, vat_type, currency, discount_price, supplier, resale_product, is_deletable, vendor_name, is_efo_nelfo_product, wholesaler_id].hash
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
