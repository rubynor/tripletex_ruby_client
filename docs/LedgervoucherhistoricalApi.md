# TripletexRubyClient::LedgervoucherhistoricalApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**close_postings**](LedgervoucherhistoricalApi.md#close_postings) | **PUT** /ledger/voucher/historical/:closePostings | [BETA] Close postings.
[**post_employee**](LedgervoucherhistoricalApi.md#post_employee) | **POST** /ledger/voucher/historical/employee | [BETA] Create one employee, based on import from external system. Validation is less strict, ie. employee department isn&#39;t required.
[**post_historical**](LedgervoucherhistoricalApi.md#post_historical) | **POST** /ledger/voucher/historical/historical | [BETA] API endpoint for creating historical vouchers. These are vouchers created outside Tripletex, and should be from closed accounting years. The intended usage is to get access to historical transcations in Tripletex. Also creates postings. All amount fields in postings will be used. VAT postings must be included, these are not generated automatically like they are for normal vouchers in Tripletex. Requires the \\\&quot;All vouchers\\\&quot; and \\\&quot;Advanced Voucher\\\&quot; permissions.
[**reverse_historical_vouchers**](LedgervoucherhistoricalApi.md#reverse_historical_vouchers) | **PUT** /ledger/voucher/historical/:reverseHistoricalVouchers | [BETA] Deletes all historical vouchers. Requires the \&quot;All vouchers\&quot; and \&quot;Advanced Voucher\&quot; permissions.
[**upload_attachment**](LedgervoucherhistoricalApi.md#upload_attachment) | **POST** /ledger/voucher/historical/{voucherId}/attachment | Upload attachment to voucher. If the voucher already has an attachment the content will be appended to the existing attachment as new PDF page(s). Valid document formats are PDF, PNG, JPEG and TIFF. Non PDF formats will be converted to PDF. Send as multipart form.


# **close_postings**
> close_postings(opts)

[BETA] Close postings.



### Example
```ruby
# load the gem
require 'tripletex_ruby_client'
# setup authorization
TripletexRubyClient.configure do |config|
  # Configure HTTP basic authorization: tokenAuthScheme
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = TripletexRubyClient::LedgervoucherhistoricalApi.new

opts = { 
  posting_ids: 'posting_ids_example' # String | List of Posting IDs to close separated by comma.  The postings should have the same customer, supplier or employee. The sum of amount for all postings MUST be 0.0, otherwise an exception will be thrown.
}

begin
  #[BETA] Close postings.
  api_instance.close_postings(opts)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling LedgervoucherhistoricalApi->close_postings: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **posting_ids** | **String**| List of Posting IDs to close separated by comma.  The postings should have the same customer, supplier or employee. The sum of amount for all postings MUST be 0.0, otherwise an exception will be thrown. | [optional] 

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post_employee**
> ResponseWrapperEmployee post_employee(opts)

[BETA] Create one employee, based on import from external system. Validation is less strict, ie. employee department isn't required.



### Example
```ruby
# load the gem
require 'tripletex_ruby_client'
# setup authorization
TripletexRubyClient.configure do |config|
  # Configure HTTP basic authorization: tokenAuthScheme
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = TripletexRubyClient::LedgervoucherhistoricalApi.new

opts = { 
  body: TripletexRubyClient::Employee.new # Employee | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create one employee, based on import from external system. Validation is less strict, ie. employee department isn't required.
  result = api_instance.post_employee(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling LedgervoucherhistoricalApi->post_employee: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Employee**](Employee.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperEmployee**](ResponseWrapperEmployee.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_historical**
> ListResponseHistoricalVoucher post_historical(opts)

[BETA] API endpoint for creating historical vouchers. These are vouchers created outside Tripletex, and should be from closed accounting years. The intended usage is to get access to historical transcations in Tripletex. Also creates postings. All amount fields in postings will be used. VAT postings must be included, these are not generated automatically like they are for normal vouchers in Tripletex. Requires the \\\"All vouchers\\\" and \\\"Advanced Voucher\\\" permissions.



### Example
```ruby
# load the gem
require 'tripletex_ruby_client'
# setup authorization
TripletexRubyClient.configure do |config|
  # Configure HTTP basic authorization: tokenAuthScheme
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = TripletexRubyClient::LedgervoucherhistoricalApi.new

opts = { 
  body: [TripletexRubyClient::HistoricalVoucher.new], # Array<HistoricalVoucher> | List of vouchers and related postings to import. Max 500.  
  comment: 'comment_example' # String | Import comment, include the name and version of the source system.
}

begin
  #[BETA] API endpoint for creating historical vouchers. These are vouchers created outside Tripletex, and should be from closed accounting years. The intended usage is to get access to historical transcations in Tripletex. Also creates postings. All amount fields in postings will be used. VAT postings must be included, these are not generated automatically like they are for normal vouchers in Tripletex. Requires the \\\"All vouchers\\\" and \\\"Advanced Voucher\\\" permissions.
  result = api_instance.post_historical(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling LedgervoucherhistoricalApi->post_historical: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;HistoricalVoucher&gt;**](HistoricalVoucher.md)| List of vouchers and related postings to import. Max 500.   | [optional] 
 **comment** | **String**| Import comment, include the name and version of the source system. | [optional] 

### Return type

[**ListResponseHistoricalVoucher**](ListResponseHistoricalVoucher.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **reverse_historical_vouchers**
> reverse_historical_vouchers

[BETA] Deletes all historical vouchers. Requires the \"All vouchers\" and \"Advanced Voucher\" permissions.



### Example
```ruby
# load the gem
require 'tripletex_ruby_client'
# setup authorization
TripletexRubyClient.configure do |config|
  # Configure HTTP basic authorization: tokenAuthScheme
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = TripletexRubyClient::LedgervoucherhistoricalApi.new

begin
  #[BETA] Deletes all historical vouchers. Requires the \"All vouchers\" and \"Advanced Voucher\" permissions.
  api_instance.reverse_historical_vouchers
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling LedgervoucherhistoricalApi->reverse_historical_vouchers: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **upload_attachment**
> upload_attachment(voucher_id, file)

Upload attachment to voucher. If the voucher already has an attachment the content will be appended to the existing attachment as new PDF page(s). Valid document formats are PDF, PNG, JPEG and TIFF. Non PDF formats will be converted to PDF. Send as multipart form.



### Example
```ruby
# load the gem
require 'tripletex_ruby_client'
# setup authorization
TripletexRubyClient.configure do |config|
  # Configure HTTP basic authorization: tokenAuthScheme
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = TripletexRubyClient::LedgervoucherhistoricalApi.new

voucher_id = 56 # Integer | Voucher ID to upload attachment to.

file = File.new('/path/to/file.txt') # File | The file


begin
  #Upload attachment to voucher. If the voucher already has an attachment the content will be appended to the existing attachment as new PDF page(s). Valid document formats are PDF, PNG, JPEG and TIFF. Non PDF formats will be converted to PDF. Send as multipart form.
  api_instance.upload_attachment(voucher_id, file)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling LedgervoucherhistoricalApi->upload_attachment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **voucher_id** | **Integer**| Voucher ID to upload attachment to. | 
 **file** | **File**| The file | 

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined



