=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class Product
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    attr_accessor :name

    attr_accessor :number

    attr_accessor :description

    attr_accessor :ean

    attr_accessor :el_number

    attr_accessor :nrf_number

    # Price purchase (cost) excluding VAT in the product's currency
    attr_accessor :cost_excluding_vat_currency

    attr_accessor :expenses

    attr_accessor :expenses_in_percent

    # Cost price of purchase
    attr_accessor :cost_price

    attr_accessor :profit

    attr_accessor :profit_in_percent

    # Price of purchase excluding VAT in the product's currency
    attr_accessor :price_excluding_vat_currency

    # Price of purchase including VAT in the product's currency
    attr_accessor :price_including_vat_currency

    attr_accessor :is_inactive

    attr_accessor :discount_group

    attr_accessor :product_unit

    attr_accessor :is_stock_item

    attr_accessor :stock_of_goods

    attr_accessor :vat_type

    attr_accessor :currency

    attr_accessor :department

    attr_accessor :account

    attr_accessor :discount_price

    attr_accessor :supplier

    attr_accessor :resale_product

    attr_accessor :is_deletable

    attr_accessor :has_supplier_product_connected

    attr_accessor :weight

    attr_accessor :weight_unit

    attr_accessor :volume

    attr_accessor :volume_unit

    attr_accessor :hsn_code

    attr_accessor :image

    attr_accessor :markup_list_percentage

    attr_accessor :markup_net_percentage

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
        :'name' => :'name',
        :'number' => :'number',
        :'description' => :'description',
        :'ean' => :'ean',
        :'el_number' => :'elNumber',
        :'nrf_number' => :'nrfNumber',
        :'cost_excluding_vat_currency' => :'costExcludingVatCurrency',
        :'expenses' => :'expenses',
        :'expenses_in_percent' => :'expensesInPercent',
        :'cost_price' => :'costPrice',
        :'profit' => :'profit',
        :'profit_in_percent' => :'profitInPercent',
        :'price_excluding_vat_currency' => :'priceExcludingVatCurrency',
        :'price_including_vat_currency' => :'priceIncludingVatCurrency',
        :'is_inactive' => :'isInactive',
        :'discount_group' => :'discountGroup',
        :'product_unit' => :'productUnit',
        :'is_stock_item' => :'isStockItem',
        :'stock_of_goods' => :'stockOfGoods',
        :'vat_type' => :'vatType',
        :'currency' => :'currency',
        :'department' => :'department',
        :'account' => :'account',
        :'discount_price' => :'discountPrice',
        :'supplier' => :'supplier',
        :'resale_product' => :'resaleProduct',
        :'is_deletable' => :'isDeletable',
        :'has_supplier_product_connected' => :'hasSupplierProductConnected',
        :'weight' => :'weight',
        :'weight_unit' => :'weightUnit',
        :'volume' => :'volume',
        :'volume_unit' => :'volumeUnit',
        :'hsn_code' => :'hsnCode',
        :'image' => :'image',
        :'markup_list_percentage' => :'markupListPercentage',
        :'markup_net_percentage' => :'markupNetPercentage'
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
        :'el_number' => :'String',
        :'nrf_number' => :'String',
        :'cost_excluding_vat_currency' => :'Float',
        :'expenses' => :'Float',
        :'expenses_in_percent' => :'Float',
        :'cost_price' => :'Float',
        :'profit' => :'Float',
        :'profit_in_percent' => :'Float',
        :'price_excluding_vat_currency' => :'Float',
        :'price_including_vat_currency' => :'Float',
        :'is_inactive' => :'BOOLEAN',
        :'discount_group' => :'DiscountGroup',
        :'product_unit' => :'ProductUnit',
        :'is_stock_item' => :'BOOLEAN',
        :'stock_of_goods' => :'Float',
        :'vat_type' => :'VatType',
        :'currency' => :'Currency',
        :'department' => :'Department',
        :'account' => :'Account',
        :'discount_price' => :'Float',
        :'supplier' => :'Supplier',
        :'resale_product' => :'Product',
        :'is_deletable' => :'BOOLEAN',
        :'has_supplier_product_connected' => :'BOOLEAN',
        :'weight' => :'Float',
        :'weight_unit' => :'String',
        :'volume' => :'Float',
        :'volume_unit' => :'String',
        :'hsn_code' => :'String',
        :'image' => :'Document',
        :'markup_list_percentage' => :'Float',
        :'markup_net_percentage' => :'Float'
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

      if attributes.has_key?(:'elNumber')
        self.el_number = attributes[:'elNumber']
      end

      if attributes.has_key?(:'nrfNumber')
        self.nrf_number = attributes[:'nrfNumber']
      end

      if attributes.has_key?(:'costExcludingVatCurrency')
        self.cost_excluding_vat_currency = attributes[:'costExcludingVatCurrency']
      end

      if attributes.has_key?(:'expenses')
        self.expenses = attributes[:'expenses']
      end

      if attributes.has_key?(:'expensesInPercent')
        self.expenses_in_percent = attributes[:'expensesInPercent']
      end

      if attributes.has_key?(:'costPrice')
        self.cost_price = attributes[:'costPrice']
      end

      if attributes.has_key?(:'profit')
        self.profit = attributes[:'profit']
      end

      if attributes.has_key?(:'profitInPercent')
        self.profit_in_percent = attributes[:'profitInPercent']
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

      if attributes.has_key?(:'discountGroup')
        self.discount_group = attributes[:'discountGroup']
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

      if attributes.has_key?(:'department')
        self.department = attributes[:'department']
      end

      if attributes.has_key?(:'account')
        self.account = attributes[:'account']
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

      if attributes.has_key?(:'hasSupplierProductConnected')
        self.has_supplier_product_connected = attributes[:'hasSupplierProductConnected']
      end

      if attributes.has_key?(:'weight')
        self.weight = attributes[:'weight']
      end

      if attributes.has_key?(:'weightUnit')
        self.weight_unit = attributes[:'weightUnit']
      end

      if attributes.has_key?(:'volume')
        self.volume = attributes[:'volume']
      end

      if attributes.has_key?(:'volumeUnit')
        self.volume_unit = attributes[:'volumeUnit']
      end

      if attributes.has_key?(:'hsnCode')
        self.hsn_code = attributes[:'hsnCode']
      end

      if attributes.has_key?(:'image')
        self.image = attributes[:'image']
      end

      if attributes.has_key?(:'markupListPercentage')
        self.markup_list_percentage = attributes[:'markupListPercentage']
      end

      if attributes.has_key?(:'markupNetPercentage')
        self.markup_net_percentage = attributes[:'markupNetPercentage']
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

      if !@el_number.nil? && @el_number.to_s.length > 14
        invalid_properties.push('invalid value for "el_number", the character length must be smaller than or equal to 14.')
      end

      if !@nrf_number.nil? && @nrf_number.to_s.length > 14
        invalid_properties.push('invalid value for "nrf_number", the character length must be smaller than or equal to 14.')
      end

      if !@hsn_code.nil? && @hsn_code.to_s.length > 20
        invalid_properties.push('invalid value for "hsn_code", the character length must be smaller than or equal to 20.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@name.nil? && @name.to_s.length > 255
      return false if !@number.nil? && @number.to_s.length > 100
      return false if !@ean.nil? && @ean.to_s.length > 14
      return false if !@el_number.nil? && @el_number.to_s.length > 14
      return false if !@nrf_number.nil? && @nrf_number.to_s.length > 14
      weight_unit_validator = EnumAttributeValidator.new('String', ['kg', 'g', 'hg'])
      return false unless weight_unit_validator.valid?(@weight_unit)
      volume_unit_validator = EnumAttributeValidator.new('String', ['cm3', 'dm3', 'm3'])
      return false unless volume_unit_validator.valid?(@volume_unit)
      return false if !@hsn_code.nil? && @hsn_code.to_s.length > 20
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
    # @param [Object] el_number Value to be assigned
    def el_number=(el_number)
      if !el_number.nil? && el_number.to_s.length > 14
        fail ArgumentError, 'invalid value for "el_number", the character length must be smaller than or equal to 14.'
      end

      @el_number = el_number
    end

    # Custom attribute writer method with validation
    # @param [Object] nrf_number Value to be assigned
    def nrf_number=(nrf_number)
      if !nrf_number.nil? && nrf_number.to_s.length > 14
        fail ArgumentError, 'invalid value for "nrf_number", the character length must be smaller than or equal to 14.'
      end

      @nrf_number = nrf_number
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] weight_unit Object to be assigned
    def weight_unit=(weight_unit)
      validator = EnumAttributeValidator.new('String', ['kg', 'g', 'hg'])
      unless validator.valid?(weight_unit)
        fail ArgumentError, 'invalid value for "weight_unit", must be one of #{validator.allowable_values}.'
      end
      @weight_unit = weight_unit
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] volume_unit Object to be assigned
    def volume_unit=(volume_unit)
      validator = EnumAttributeValidator.new('String', ['cm3', 'dm3', 'm3'])
      unless validator.valid?(volume_unit)
        fail ArgumentError, 'invalid value for "volume_unit", must be one of #{validator.allowable_values}.'
      end
      @volume_unit = volume_unit
    end

    # Custom attribute writer method with validation
    # @param [Object] hsn_code Value to be assigned
    def hsn_code=(hsn_code)
      if !hsn_code.nil? && hsn_code.to_s.length > 20
        fail ArgumentError, 'invalid value for "hsn_code", the character length must be smaller than or equal to 20.'
      end

      @hsn_code = hsn_code
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
          el_number == o.el_number &&
          nrf_number == o.nrf_number &&
          cost_excluding_vat_currency == o.cost_excluding_vat_currency &&
          expenses == o.expenses &&
          expenses_in_percent == o.expenses_in_percent &&
          cost_price == o.cost_price &&
          profit == o.profit &&
          profit_in_percent == o.profit_in_percent &&
          price_excluding_vat_currency == o.price_excluding_vat_currency &&
          price_including_vat_currency == o.price_including_vat_currency &&
          is_inactive == o.is_inactive &&
          discount_group == o.discount_group &&
          product_unit == o.product_unit &&
          is_stock_item == o.is_stock_item &&
          stock_of_goods == o.stock_of_goods &&
          vat_type == o.vat_type &&
          currency == o.currency &&
          department == o.department &&
          account == o.account &&
          discount_price == o.discount_price &&
          supplier == o.supplier &&
          resale_product == o.resale_product &&
          is_deletable == o.is_deletable &&
          has_supplier_product_connected == o.has_supplier_product_connected &&
          weight == o.weight &&
          weight_unit == o.weight_unit &&
          volume == o.volume &&
          volume_unit == o.volume_unit &&
          hsn_code == o.hsn_code &&
          image == o.image &&
          markup_list_percentage == o.markup_list_percentage &&
          markup_net_percentage == o.markup_net_percentage
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, name, number, description, ean, el_number, nrf_number, cost_excluding_vat_currency, expenses, expenses_in_percent, cost_price, profit, profit_in_percent, price_excluding_vat_currency, price_including_vat_currency, is_inactive, discount_group, product_unit, is_stock_item, stock_of_goods, vat_type, currency, department, account, discount_price, supplier, resale_product, is_deletable, has_supplier_product_connected, weight, weight_unit, volume, volume_unit, hsn_code, image, markup_list_percentage, markup_net_percentage].hash
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
