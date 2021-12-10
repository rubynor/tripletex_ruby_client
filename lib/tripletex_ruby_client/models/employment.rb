=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class Employment
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    attr_accessor :employee

    # Existing employment ID used by the current accounting system
    attr_accessor :employment_id

    attr_accessor :start_date

    attr_accessor :end_date

    # Define the employment end reason.
    attr_accessor :employment_end_reason

    attr_accessor :division

    attr_accessor :last_salary_change_date

    # Activate pensions and other benefits with no employment relationship.
    attr_accessor :no_employment_relationship

    # Determines if company is main employer for the employee. Default value is true.<br />Some values will be default set if not sent upon creation of employment: <br/> If isMainEmployer is NOT sent and tax deduction code loennFraHovedarbeidsgiver is sent, isMainEmployer will be set to true. <br /> If isMainEmployer is NOT sent and tax deduction code loennFraBiarbeidsgiver is sent, isMainEmployer will be set to false. <br /> If true and deduction code is NOT sent, value of tax deduction code will be set to loennFraHovedarbeidsgiver. <br /> If false and deduction code is NOT sent, value of tax deduction code will be set to loennFraBiarbeidsgiver. <br /> For other types of Tax Deduction Codes, isMainEmployer does not influence anything.
    attr_accessor :is_main_employer

    # EMPTY - represents that a tax deduction code is not set on the employment. It is illegal to set the field to this value.  <br /> Default value of this field is loennFraHovedarbeidsgiver or loennFraBiarbeidsgiver depending on boolean isMainEmployer
    attr_accessor :tax_deduction_code

    # Employment types tied to the employment
    attr_accessor :employment_details

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
        :'employee' => :'employee',
        :'employment_id' => :'employmentId',
        :'start_date' => :'startDate',
        :'end_date' => :'endDate',
        :'employment_end_reason' => :'employmentEndReason',
        :'division' => :'division',
        :'last_salary_change_date' => :'lastSalaryChangeDate',
        :'no_employment_relationship' => :'noEmploymentRelationship',
        :'is_main_employer' => :'isMainEmployer',
        :'tax_deduction_code' => :'taxDeductionCode',
        :'employment_details' => :'employmentDetails'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'employee' => :'Employee',
        :'employment_id' => :'String',
        :'start_date' => :'String',
        :'end_date' => :'String',
        :'employment_end_reason' => :'String',
        :'division' => :'Division',
        :'last_salary_change_date' => :'String',
        :'no_employment_relationship' => :'BOOLEAN',
        :'is_main_employer' => :'BOOLEAN',
        :'tax_deduction_code' => :'String',
        :'employment_details' => :'Array<EmploymentDetails>'
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

      if attributes.has_key?(:'employee')
        self.employee = attributes[:'employee']
      end

      if attributes.has_key?(:'employmentId')
        self.employment_id = attributes[:'employmentId']
      end

      if attributes.has_key?(:'startDate')
        self.start_date = attributes[:'startDate']
      end

      if attributes.has_key?(:'endDate')
        self.end_date = attributes[:'endDate']
      end

      if attributes.has_key?(:'employmentEndReason')
        self.employment_end_reason = attributes[:'employmentEndReason']
      end

      if attributes.has_key?(:'division')
        self.division = attributes[:'division']
      end

      if attributes.has_key?(:'lastSalaryChangeDate')
        self.last_salary_change_date = attributes[:'lastSalaryChangeDate']
      end

      if attributes.has_key?(:'noEmploymentRelationship')
        self.no_employment_relationship = attributes[:'noEmploymentRelationship']
      end

      if attributes.has_key?(:'isMainEmployer')
        self.is_main_employer = attributes[:'isMainEmployer']
      end

      if attributes.has_key?(:'taxDeductionCode')
        self.tax_deduction_code = attributes[:'taxDeductionCode']
      end

      if attributes.has_key?(:'employmentDetails')
        if (value = attributes[:'employmentDetails']).is_a?(Array)
          self.employment_details = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@employment_id.nil? && @employment_id.to_s.length > 255
        invalid_properties.push('invalid value for "employment_id", the character length must be smaller than or equal to 255.')
      end

      if @start_date.nil?
        invalid_properties.push('invalid value for "start_date", start_date cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@employment_id.nil? && @employment_id.to_s.length > 255
      return false if @start_date.nil?
      employment_end_reason_validator = EnumAttributeValidator.new('String', ['EMPLOYMENT_END_EXPIRED', 'EMPLOYMENT_END_EMPLOYEE', 'EMPLOYMENT_END_EMPLOYER', 'EMPLOYMENT_END_WRONGLY_REPORTED', 'EMPLOYMENT_END_SYSTEM_OR_ACCOUNTANT_CHANGE', 'EMPLOYMENT_END_INTERNAL_CHANGE'])
      return false unless employment_end_reason_validator.valid?(@employment_end_reason)
      tax_deduction_code_validator = EnumAttributeValidator.new('String', ['loennFraHovedarbeidsgiver', 'loennFraBiarbeidsgiver', 'pensjon', 'loennTilUtenrikstjenestemann', 'loennKunTrygdeavgiftTilUtenlandskBorger', 'loennKunTrygdeavgiftTilUtenlandskBorgerSomGrensegjenger', 'introduksjonsstoenad', 'ufoereytelserFraAndre', 'EMPTY'])
      return false unless tax_deduction_code_validator.valid?(@tax_deduction_code)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] employment_id Value to be assigned
    def employment_id=(employment_id)
      if !employment_id.nil? && employment_id.to_s.length > 255
        fail ArgumentError, 'invalid value for "employment_id", the character length must be smaller than or equal to 255.'
      end

      @employment_id = employment_id
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] employment_end_reason Object to be assigned
    def employment_end_reason=(employment_end_reason)
      validator = EnumAttributeValidator.new('String', ['EMPLOYMENT_END_EXPIRED', 'EMPLOYMENT_END_EMPLOYEE', 'EMPLOYMENT_END_EMPLOYER', 'EMPLOYMENT_END_WRONGLY_REPORTED', 'EMPLOYMENT_END_SYSTEM_OR_ACCOUNTANT_CHANGE', 'EMPLOYMENT_END_INTERNAL_CHANGE'])
      unless validator.valid?(employment_end_reason)
        fail ArgumentError, 'invalid value for "employment_end_reason", must be one of #{validator.allowable_values}.'
      end
      @employment_end_reason = employment_end_reason
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] tax_deduction_code Object to be assigned
    def tax_deduction_code=(tax_deduction_code)
      validator = EnumAttributeValidator.new('String', ['loennFraHovedarbeidsgiver', 'loennFraBiarbeidsgiver', 'pensjon', 'loennTilUtenrikstjenestemann', 'loennKunTrygdeavgiftTilUtenlandskBorger', 'loennKunTrygdeavgiftTilUtenlandskBorgerSomGrensegjenger', 'introduksjonsstoenad', 'ufoereytelserFraAndre', 'EMPTY'])
      unless validator.valid?(tax_deduction_code)
        fail ArgumentError, 'invalid value for "tax_deduction_code", must be one of #{validator.allowable_values}.'
      end
      @tax_deduction_code = tax_deduction_code
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
          employee == o.employee &&
          employment_id == o.employment_id &&
          start_date == o.start_date &&
          end_date == o.end_date &&
          employment_end_reason == o.employment_end_reason &&
          division == o.division &&
          last_salary_change_date == o.last_salary_change_date &&
          no_employment_relationship == o.no_employment_relationship &&
          is_main_employer == o.is_main_employer &&
          tax_deduction_code == o.tax_deduction_code &&
          employment_details == o.employment_details
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, employee, employment_id, start_date, end_date, employment_end_reason, division, last_salary_change_date, no_employment_relationship, is_main_employer, tax_deduction_code, employment_details].hash
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
