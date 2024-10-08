=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'uri'

module TripletexRubyClient
  class LedgervoucherhistoricalApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # [BETA] Close postings.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :posting_ids List of Posting IDs to close separated by comma.  The postings should have the same customer, supplier or employee. The sum of amount for all postings MUST be 0.0, otherwise an exception will be thrown.
    # @return [nil]
    def close_postings(opts = {})
      close_postings_with_http_info(opts)
      nil
    end

    # [BETA] Close postings.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :posting_ids List of Posting IDs to close separated by comma.  The postings should have the same customer, supplier or employee. The sum of amount for all postings MUST be 0.0, otherwise an exception will be thrown.
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def close_postings_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: LedgervoucherhistoricalApi.close_postings ...'
      end
      # resource path
      local_var_path = '/ledger/voucher/historical/:closePostings'

      # query parameters
      query_params = {}
      query_params[:'postingIds'] = opts[:'posting_ids'] if !opts[:'posting_ids'].nil?

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LedgervoucherhistoricalApi#close_postings\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Create one employee, based on import from external system. Validation is less strict, ie. employee department isn't required.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Employee] :body JSON representing the new object to be created. Should not have ID and version set.
    # @return [ResponseWrapperEmployee]
    def post_employee(opts = {})
      data, _status_code, _headers = post_employee_with_http_info(opts)
      data
    end

    # [BETA] Create one employee, based on import from external system. Validation is less strict, ie. employee department isn&#39;t required.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Employee] :body JSON representing the new object to be created. Should not have ID and version set.
    # @return [Array<(ResponseWrapperEmployee, Fixnum, Hash)>] ResponseWrapperEmployee data, response status code and response headers
    def post_employee_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: LedgervoucherhistoricalApi.post_employee ...'
      end
      # resource path
      local_var_path = '/ledger/voucher/historical/employee'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(opts[:'body'])
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ResponseWrapperEmployee')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LedgervoucherhistoricalApi#post_employee\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] API endpoint for creating historical vouchers. These are vouchers created outside Tripletex, and should be from closed accounting years. The intended usage is to get access to historical transcations in Tripletex. Also creates postings. All amount fields in postings will be used. VAT postings must be included, these are not generated automatically like they are for normal vouchers in Tripletex. Requires the \\\"All vouchers\\\" and \\\"Advanced Voucher\\\" permissions.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<HistoricalVoucher>] :body List of vouchers and related postings to import. Max 500.  
    # @option opts [String] :comment Import comment, include the name and version of the source system.
    # @return [ListResponseHistoricalVoucher]
    def post_historical(opts = {})
      data, _status_code, _headers = post_historical_with_http_info(opts)
      data
    end

    # [BETA] API endpoint for creating historical vouchers. These are vouchers created outside Tripletex, and should be from closed accounting years. The intended usage is to get access to historical transcations in Tripletex. Also creates postings. All amount fields in postings will be used. VAT postings must be included, these are not generated automatically like they are for normal vouchers in Tripletex. Requires the \\\&quot;All vouchers\\\&quot; and \\\&quot;Advanced Voucher\\\&quot; permissions.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<HistoricalVoucher>] :body List of vouchers and related postings to import. Max 500.  
    # @option opts [String] :comment Import comment, include the name and version of the source system.
    # @return [Array<(ListResponseHistoricalVoucher, Fixnum, Hash)>] ListResponseHistoricalVoucher data, response status code and response headers
    def post_historical_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: LedgervoucherhistoricalApi.post_historical ...'
      end
      # resource path
      local_var_path = '/ledger/voucher/historical/historical'

      # query parameters
      query_params = {}
      query_params[:'comment'] = opts[:'comment'] if !opts[:'comment'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(opts[:'body'])
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ListResponseHistoricalVoucher')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LedgervoucherhistoricalApi#post_historical\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # [BETA] Deletes all historical vouchers. Requires the \"All vouchers\" and \"Advanced Voucher\" permissions.
    # 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def reverse_historical_vouchers(opts = {})
      reverse_historical_vouchers_with_http_info(opts)
      nil
    end

    # [BETA] Deletes all historical vouchers. Requires the \&quot;All vouchers\&quot; and \&quot;Advanced Voucher\&quot; permissions.
    # 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def reverse_historical_vouchers_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: LedgervoucherhistoricalApi.reverse_historical_vouchers ...'
      end
      # resource path
      local_var_path = '/ledger/voucher/historical/:reverseHistoricalVouchers'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LedgervoucherhistoricalApi#reverse_historical_vouchers\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Upload attachment to voucher. If the voucher already has an attachment the content will be appended to the existing attachment as new PDF page(s). Valid document formats are PDF, PNG, JPEG and TIFF. Non PDF formats will be converted to PDF. Send as multipart form.
    # 
    # @param voucher_id Voucher ID to upload attachment to.
    # @param file The file
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def upload_attachment(voucher_id, file, opts = {})
      upload_attachment_with_http_info(voucher_id, file, opts)
      nil
    end

    # Upload attachment to voucher. If the voucher already has an attachment the content will be appended to the existing attachment as new PDF page(s). Valid document formats are PDF, PNG, JPEG and TIFF. Non PDF formats will be converted to PDF. Send as multipart form.
    # 
    # @param voucher_id Voucher ID to upload attachment to.
    # @param file The file
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def upload_attachment_with_http_info(voucher_id, file, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: LedgervoucherhistoricalApi.upload_attachment ...'
      end
      # verify the required parameter 'voucher_id' is set
      if @api_client.config.client_side_validation && voucher_id.nil?
        fail ArgumentError, "Missing the required parameter 'voucher_id' when calling LedgervoucherhistoricalApi.upload_attachment"
      end
      # verify the required parameter 'file' is set
      if @api_client.config.client_side_validation && file.nil?
        fail ArgumentError, "Missing the required parameter 'file' when calling LedgervoucherhistoricalApi.upload_attachment"
      end
      # resource path
      local_var_path = '/ledger/voucher/historical/{voucherId}/attachment'.sub('{' + 'voucherId' + '}', voucher_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['multipart/form-data'])

      # form parameters
      form_params = {}
      form_params['file'] = file

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LedgervoucherhistoricalApi#upload_attachment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
