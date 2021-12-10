=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class PurchaseOrder
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    # Purchase order number
    attr_accessor :number

    # Email when purchase order is send by email.
    attr_accessor :receiver_email

    # Discount Percentage
    attr_accessor :discount

    # Message on packing note.Wholesaler specific.
    attr_accessor :packing_note_message

    # Message to transporter.Wholesaler specific.
    attr_accessor :transporter_message

    # Delivery information and invoice comments
    attr_accessor :comments

    attr_accessor :supplier

    attr_accessor :delivery_date

    # Order lines tied to the purchase order
    attr_accessor :order_lines

    # Project/order
    attr_accessor :project

    # Department/order
    attr_accessor :department

    # Delivery address
    attr_accessor :delivery_address

    attr_accessor :creation_date

    attr_accessor :is_closed

    attr_accessor :our_contact

    # Recipient when purchase order is send by email.
    attr_accessor :supplier_contact

    # Attention
    attr_accessor :attention

    attr_accessor :status

    # Company currency
    attr_accessor :currency

    attr_accessor :restorder

    # Transport type
    attr_accessor :transport_type

    # Pickup point, wholesaler specific
    attr_accessor :pickup_point

    # The PDF representing this PurchaseOrder
    attr_accessor :document

    # The attachments on this PurchaseOrder (if any)
    attr_accessor :attachment

    # The machine readable document (such as EHF or EFO/NELFO) this PurchaseOrder is based on (if any)
    attr_accessor :edi_document

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
        :'receiver_email' => :'receiverEmail',
        :'discount' => :'discount',
        :'packing_note_message' => :'packingNoteMessage',
        :'transporter_message' => :'transporterMessage',
        :'comments' => :'comments',
        :'supplier' => :'supplier',
        :'delivery_date' => :'deliveryDate',
        :'order_lines' => :'orderLines',
        :'project' => :'project',
        :'department' => :'department',
        :'delivery_address' => :'deliveryAddress',
        :'creation_date' => :'creationDate',
        :'is_closed' => :'isClosed',
        :'our_contact' => :'ourContact',
        :'supplier_contact' => :'supplierContact',
        :'attention' => :'attention',
        :'status' => :'status',
        :'currency' => :'currency',
        :'restorder' => :'restorder',
        :'transport_type' => :'transportType',
        :'pickup_point' => :'pickupPoint',
        :'document' => :'document',
        :'attachment' => :'attachment',
        :'edi_document' => :'ediDocument'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'number' => :'String',
        :'receiver_email' => :'String',
        :'discount' => :'Float',
        :'packing_note_message' => :'String',
        :'transporter_message' => :'String',
        :'comments' => :'String',
        :'supplier' => :'Supplier',
        :'delivery_date' => :'String',
        :'order_lines' => :'Array<PurchaseOrderline>',
        :'project' => :'Project',
        :'department' => :'Department',
        :'delivery_address' => :'Address',
        :'creation_date' => :'String',
        :'is_closed' => :'BOOLEAN',
        :'our_contact' => :'Employee',
        :'supplier_contact' => :'Employee',
        :'attention' => :'Employee',
        :'status' => :'String',
        :'currency' => :'Currency',
        :'restorder' => :'PurchaseOrder',
        :'transport_type' => :'TransportType',
        :'pickup_point' => :'PickupPoint',
        :'document' => :'Document',
        :'attachment' => :'Document',
        :'edi_document' => :'Document'
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

      if attributes.has_key?(:'receiverEmail')
        self.receiver_email = attributes[:'receiverEmail']
      end

      if attributes.has_key?(:'discount')
        self.discount = attributes[:'discount']
      end

      if attributes.has_key?(:'packingNoteMessage')
        self.packing_note_message = attributes[:'packingNoteMessage']
      end

      if attributes.has_key?(:'transporterMessage')
        self.transporter_message = attributes[:'transporterMessage']
      end

      if attributes.has_key?(:'comments')
        self.comments = attributes[:'comments']
      end

      if attributes.has_key?(:'supplier')
        self.supplier = attributes[:'supplier']
      end

      if attributes.has_key?(:'deliveryDate')
        self.delivery_date = attributes[:'deliveryDate']
      end

      if attributes.has_key?(:'orderLines')
        if (value = attributes[:'orderLines']).is_a?(Array)
          self.order_lines = value
        end
      end

      if attributes.has_key?(:'project')
        self.project = attributes[:'project']
      end

      if attributes.has_key?(:'department')
        self.department = attributes[:'department']
      end

      if attributes.has_key?(:'deliveryAddress')
        self.delivery_address = attributes[:'deliveryAddress']
      end

      if attributes.has_key?(:'creationDate')
        self.creation_date = attributes[:'creationDate']
      end

      if attributes.has_key?(:'isClosed')
        self.is_closed = attributes[:'isClosed']
      end

      if attributes.has_key?(:'ourContact')
        self.our_contact = attributes[:'ourContact']
      end

      if attributes.has_key?(:'supplierContact')
        self.supplier_contact = attributes[:'supplierContact']
      end

      if attributes.has_key?(:'attention')
        self.attention = attributes[:'attention']
      end

      if attributes.has_key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.has_key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.has_key?(:'restorder')
        self.restorder = attributes[:'restorder']
      end

      if attributes.has_key?(:'transportType')
        self.transport_type = attributes[:'transportType']
      end

      if attributes.has_key?(:'pickupPoint')
        self.pickup_point = attributes[:'pickupPoint']
      end

      if attributes.has_key?(:'document')
        self.document = attributes[:'document']
      end

      if attributes.has_key?(:'attachment')
        self.attachment = attributes[:'attachment']
      end

      if attributes.has_key?(:'ediDocument')
        self.edi_document = attributes[:'ediDocument']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@number.nil? && @number.to_s.length > 100
        invalid_properties.push('invalid value for "number", the character length must be smaller than or equal to 100.')
      end

      if !@receiver_email.nil? && @receiver_email.to_s.length > 100
        invalid_properties.push('invalid value for "receiver_email", the character length must be smaller than or equal to 100.')
      end

      if !@packing_note_message.nil? && @packing_note_message.to_s.length > 50
        invalid_properties.push('invalid value for "packing_note_message", the character length must be smaller than or equal to 50.')
      end

      if !@transporter_message.nil? && @transporter_message.to_s.length > 255
        invalid_properties.push('invalid value for "transporter_message", the character length must be smaller than or equal to 255.')
      end

      if @supplier.nil?
        invalid_properties.push('invalid value for "supplier", supplier cannot be nil.')
      end

      if @delivery_date.nil?
        invalid_properties.push('invalid value for "delivery_date", delivery_date cannot be nil.')
      end

      if @our_contact.nil?
        invalid_properties.push('invalid value for "our_contact", our_contact cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@number.nil? && @number.to_s.length > 100
      return false if !@receiver_email.nil? && @receiver_email.to_s.length > 100
      return false if !@packing_note_message.nil? && @packing_note_message.to_s.length > 50
      return false if !@transporter_message.nil? && @transporter_message.to_s.length > 255
      return false if @supplier.nil?
      return false if @delivery_date.nil?
      return false if @our_contact.nil?
      status_validator = EnumAttributeValidator.new('String', ['STATUS_OPEN', 'STATUS_SENT', 'STATUS_RECEIVING', 'STATUS_CONFIRMED_DEVIATION_DETECTED', 'STATUS_DEVIATION_OPEN', 'STATUS_DEVIATION_CONFIRMED', 'STATUS_CONFIRMED', 'STATUS_CANCELLED'])
      return false unless status_validator.valid?(@status)
      true
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
    # @param [Object] receiver_email Value to be assigned
    def receiver_email=(receiver_email)
      if !receiver_email.nil? && receiver_email.to_s.length > 100
        fail ArgumentError, 'invalid value for "receiver_email", the character length must be smaller than or equal to 100.'
      end

      @receiver_email = receiver_email
    end

    # Custom attribute writer method with validation
    # @param [Object] packing_note_message Value to be assigned
    def packing_note_message=(packing_note_message)
      if !packing_note_message.nil? && packing_note_message.to_s.length > 50
        fail ArgumentError, 'invalid value for "packing_note_message", the character length must be smaller than or equal to 50.'
      end

      @packing_note_message = packing_note_message
    end

    # Custom attribute writer method with validation
    # @param [Object] transporter_message Value to be assigned
    def transporter_message=(transporter_message)
      if !transporter_message.nil? && transporter_message.to_s.length > 255
        fail ArgumentError, 'invalid value for "transporter_message", the character length must be smaller than or equal to 255.'
      end

      @transporter_message = transporter_message
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      validator = EnumAttributeValidator.new('String', ['STATUS_OPEN', 'STATUS_SENT', 'STATUS_RECEIVING', 'STATUS_CONFIRMED_DEVIATION_DETECTED', 'STATUS_DEVIATION_OPEN', 'STATUS_DEVIATION_CONFIRMED', 'STATUS_CONFIRMED', 'STATUS_CANCELLED'])
      unless validator.valid?(status)
        fail ArgumentError, 'invalid value for "status", must be one of #{validator.allowable_values}.'
      end
      @status = status
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
          receiver_email == o.receiver_email &&
          discount == o.discount &&
          packing_note_message == o.packing_note_message &&
          transporter_message == o.transporter_message &&
          comments == o.comments &&
          supplier == o.supplier &&
          delivery_date == o.delivery_date &&
          order_lines == o.order_lines &&
          project == o.project &&
          department == o.department &&
          delivery_address == o.delivery_address &&
          creation_date == o.creation_date &&
          is_closed == o.is_closed &&
          our_contact == o.our_contact &&
          supplier_contact == o.supplier_contact &&
          attention == o.attention &&
          status == o.status &&
          currency == o.currency &&
          restorder == o.restorder &&
          transport_type == o.transport_type &&
          pickup_point == o.pickup_point &&
          document == o.document &&
          attachment == o.attachment &&
          edi_document == o.edi_document
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, number, receiver_email, discount, packing_note_message, transporter_message, comments, supplier, delivery_date, order_lines, project, department, delivery_address, creation_date, is_closed, our_contact, supplier_contact, attention, status, currency, restorder, transport_type, pickup_point, document, attachment, edi_document].hash
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
