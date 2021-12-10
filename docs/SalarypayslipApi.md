# TripletexRubyClient::SalarypayslipApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**download_pdf**](SalarypayslipApi.md#download_pdf) | **GET** /salary/payslip/{id}/pdf | [BETA] Find payslip (PDF document) by ID.
[**get**](SalarypayslipApi.md#get) | **GET** /salary/payslip/{id} | [BETA] Find payslip by ID.
[**search**](SalarypayslipApi.md#search) | **GET** /salary/payslip | [BETA] Find payslips corresponding with sent data.


# **download_pdf**
> String download_pdf(id)

[BETA] Find payslip (PDF document) by ID.



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

api_instance = TripletexRubyClient::SalarypayslipApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Find payslip (PDF document) by ID.
  result = api_instance.download_pdf(id)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SalarypayslipApi->download_pdf: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 

### Return type

**String**

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream



# **get**
> ResponseWrapperPayslip get(id, opts)

[BETA] Find payslip by ID.



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

api_instance = TripletexRubyClient::SalarypayslipApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find payslip by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SalarypayslipApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperPayslip**](ResponseWrapperPayslip.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **search**
> ListResponsePayslip search(opts)

[BETA] Find payslips corresponding with sent data.



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

api_instance = TripletexRubyClient::SalarypayslipApi.new

opts = { 
  id: 'id_example', # String | List of IDs
  employee_id: 'employee_id_example', # String | List of IDs
  wage_transaction_id: 'wage_transaction_id_example', # String | List of IDs
  activity_id: 'activity_id_example', # String | List of IDs
  year_from: 56, # Integer | From and including
  year_to: 56, # Integer | To and excluding
  month_from: 56, # Integer | From and including
  month_to: 56, # Integer | To and excluding
  voucher_date_from: 'voucher_date_from_example', # String | From and including
  voucher_date_to: 'voucher_date_to_example', # String | To and excluding
  comment: 'comment_example', # String | Containing
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find payslips corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SalarypayslipApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of IDs | [optional] 
 **employee_id** | **String**| List of IDs | [optional] 
 **wage_transaction_id** | **String**| List of IDs | [optional] 
 **activity_id** | **String**| List of IDs | [optional] 
 **year_from** | **Integer**| From and including | [optional] 
 **year_to** | **Integer**| To and excluding | [optional] 
 **month_from** | **Integer**| From and including | [optional] 
 **month_to** | **Integer**| To and excluding | [optional] 
 **voucher_date_from** | **String**| From and including | [optional] 
 **voucher_date_to** | **String**| To and excluding | [optional] 
 **comment** | **String**| Containing | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponsePayslip**](ListResponsePayslip.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



