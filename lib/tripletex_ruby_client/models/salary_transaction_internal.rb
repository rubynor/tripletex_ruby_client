=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class SalaryTransactionInternal
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    # Voucher date.
    attr_accessor :date

    attr_accessor :year

    attr_accessor :month

    attr_accessor :period_as_string

    # With historical wage vouchers you can update the wage system with information dated before the opening balance.
    attr_accessor :is_historical

    # Employee National Insurance calculation method
    attr_accessor :payroll_tax_calc_method

    # Comment on voucher
    attr_accessor :voucher_comment

    # Comment to be shown on all payslips
    attr_accessor :payslip_general_comment

    attr_accessor :completed

    # The date payslips are made available to the employee. Defaults to voucherDate.
    attr_accessor :pay_slips_available_date

    attr_accessor :is_filtered_on_regular_salary

    attr_accessor :is_filtered_on_open_posts

    attr_accessor :is_filtered_on_travel_expenses

    attr_accessor :is_filtered_on_expenses

    attr_accessor :is_nets_module_remit

    attr_accessor :is_autopay_module_remit

    attr_accessor :has_bank_transfers

    # Link to individual payslip objects.
    attr_accessor :payslips

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'version' => :'version',
        :'changes' => :'changes',
        :'url' => :'url',
        :'date' => :'date',
        :'year' => :'year',
        :'month' => :'month',
        :'period_as_string' => :'periodAsString',
        :'is_historical' => :'isHistorical',
        :'payroll_tax_calc_method' => :'payrollTaxCalcMethod',
        :'voucher_comment' => :'voucherComment',
        :'payslip_general_comment' => :'payslipGeneralComment',
        :'completed' => :'completed',
        :'pay_slips_available_date' => :'paySlipsAvailableDate',
        :'is_filtered_on_regular_salary' => :'isFilteredOnRegularSalary',
        :'is_filtered_on_open_posts' => :'isFilteredOnOpenPosts',
        :'is_filtered_on_travel_expenses' => :'isFilteredOnTravelExpenses',
        :'is_filtered_on_expenses' => :'isFilteredOnExpenses',
        :'is_nets_module_remit' => :'isNetsModuleRemit',
        :'is_autopay_module_remit' => :'isAutopayModuleRemit',
        :'has_bank_transfers' => :'hasBankTransfers',
        :'payslips' => :'payslips'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'date' => :'String',
        :'year' => :'Integer',
        :'month' => :'Integer',
        :'period_as_string' => :'String',
        :'is_historical' => :'BOOLEAN',
        :'payroll_tax_calc_method' => :'String',
        :'voucher_comment' => :'String',
        :'payslip_general_comment' => :'String',
        :'completed' => :'BOOLEAN',
        :'pay_slips_available_date' => :'String',
        :'is_filtered_on_regular_salary' => :'BOOLEAN',
        :'is_filtered_on_open_posts' => :'BOOLEAN',
        :'is_filtered_on_travel_expenses' => :'BOOLEAN',
        :'is_filtered_on_expenses' => :'BOOLEAN',
        :'is_nets_module_remit' => :'BOOLEAN',
        :'is_autopay_module_remit' => :'BOOLEAN',
        :'has_bank_transfers' => :'BOOLEAN',
        :'payslips' => :'Array<PayslipInternal>'
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

      if attributes.has_key?(:'date')
        self.date = attributes[:'date']
      end

      if attributes.has_key?(:'year')
        self.year = attributes[:'year']
      end

      if attributes.has_key?(:'month')
        self.month = attributes[:'month']
      end

      if attributes.has_key?(:'periodAsString')
        self.period_as_string = attributes[:'periodAsString']
      end

      if attributes.has_key?(:'isHistorical')
        self.is_historical = attributes[:'isHistorical']
      end

      if attributes.has_key?(:'payrollTaxCalcMethod')
        self.payroll_tax_calc_method = attributes[:'payrollTaxCalcMethod']
      end

      if attributes.has_key?(:'voucherComment')
        self.voucher_comment = attributes[:'voucherComment']
      end

      if attributes.has_key?(:'payslipGeneralComment')
        self.payslip_general_comment = attributes[:'payslipGeneralComment']
      end

      if attributes.has_key?(:'completed')
        self.completed = attributes[:'completed']
      end

      if attributes.has_key?(:'paySlipsAvailableDate')
        self.pay_slips_available_date = attributes[:'paySlipsAvailableDate']
      end

      if attributes.has_key?(:'isFilteredOnRegularSalary')
        self.is_filtered_on_regular_salary = attributes[:'isFilteredOnRegularSalary']
      end

      if attributes.has_key?(:'isFilteredOnOpenPosts')
        self.is_filtered_on_open_posts = attributes[:'isFilteredOnOpenPosts']
      end

      if attributes.has_key?(:'isFilteredOnTravelExpenses')
        self.is_filtered_on_travel_expenses = attributes[:'isFilteredOnTravelExpenses']
      end

      if attributes.has_key?(:'isFilteredOnExpenses')
        self.is_filtered_on_expenses = attributes[:'isFilteredOnExpenses']
      end

      if attributes.has_key?(:'isNetsModuleRemit')
        self.is_nets_module_remit = attributes[:'isNetsModuleRemit']
      end

      if attributes.has_key?(:'isAutopayModuleRemit')
        self.is_autopay_module_remit = attributes[:'isAutopayModuleRemit']
      end

      if attributes.has_key?(:'hasBankTransfers')
        self.has_bank_transfers = attributes[:'hasBankTransfers']
      end

      if attributes.has_key?(:'payslips')
        if (value = attributes[:'payslips']).is_a?(Array)
          self.payslips = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @year.nil?
        invalid_properties.push('invalid value for "year", year cannot be nil.')
      end

      if @month.nil?
        invalid_properties.push('invalid value for "month", month cannot be nil.')
      end

      if !@payroll_tax_calc_method.nil? && @payroll_tax_calc_method.to_s.length > 2
        invalid_properties.push('invalid value for "payroll_tax_calc_method", the character length must be smaller than or equal to 2.')
      end

      if @payslips.nil?
        invalid_properties.push('invalid value for "payslips", payslips cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @year.nil?
      return false if @month.nil?
      return false if !@payroll_tax_calc_method.nil? && @payroll_tax_calc_method.to_s.length > 2
      return false if @payslips.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] payroll_tax_calc_method Value to be assigned
    def payroll_tax_calc_method=(payroll_tax_calc_method)
      if !payroll_tax_calc_method.nil? && payroll_tax_calc_method.to_s.length > 2
        fail ArgumentError, 'invalid value for "payroll_tax_calc_method", the character length must be smaller than or equal to 2.'
      end

      @payroll_tax_calc_method = payroll_tax_calc_method
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
          date == o.date &&
          year == o.year &&
          month == o.month &&
          period_as_string == o.period_as_string &&
          is_historical == o.is_historical &&
          payroll_tax_calc_method == o.payroll_tax_calc_method &&
          voucher_comment == o.voucher_comment &&
          payslip_general_comment == o.payslip_general_comment &&
          completed == o.completed &&
          pay_slips_available_date == o.pay_slips_available_date &&
          is_filtered_on_regular_salary == o.is_filtered_on_regular_salary &&
          is_filtered_on_open_posts == o.is_filtered_on_open_posts &&
          is_filtered_on_travel_expenses == o.is_filtered_on_travel_expenses &&
          is_filtered_on_expenses == o.is_filtered_on_expenses &&
          is_nets_module_remit == o.is_nets_module_remit &&
          is_autopay_module_remit == o.is_autopay_module_remit &&
          has_bank_transfers == o.has_bank_transfers &&
          payslips == o.payslips
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, date, year, month, period_as_string, is_historical, payroll_tax_calc_method, voucher_comment, payslip_general_comment, completed, pay_slips_available_date, is_filtered_on_regular_salary, is_filtered_on_open_posts, is_filtered_on_travel_expenses, is_filtered_on_expenses, is_nets_module_remit, is_autopay_module_remit, has_bank_transfers, payslips].hash
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
