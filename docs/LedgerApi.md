# TripletexRubyClient::LedgerApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**open_post**](LedgerApi.md#open_post) | **GET** /ledger/openPost | Find open posts corresponding with sent data.
[**search**](LedgerApi.md#search) | **GET** /ledger | Get ledger (hovedbok).


# **open_post**
> ListResponseLedgerAccount open_post(date, opts)

Find open posts corresponding with sent data.



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

api_instance = TripletexRubyClient::LedgerApi.new

date = 'date_example' # String | Invoice date. Format is yyyy-MM-dd (to and excl.).

opts = { 
  account_id: 56, # Integer | Element ID
  supplier_id: 56, # Integer | Element ID
  customer_id: 56, # Integer | Element ID
  employee_id: 56, # Integer | Element ID
  department_id: 56, # Integer | Element ID
  project_id: 56, # Integer | Element ID
  product_id: 56, # Integer | Element ID
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find open posts corresponding with sent data.
  result = api_instance.open_post(date, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling LedgerApi->open_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **date** | **String**| Invoice date. Format is yyyy-MM-dd (to and excl.). | 
 **account_id** | **Integer**| Element ID | [optional] 
 **supplier_id** | **Integer**| Element ID | [optional] 
 **customer_id** | **Integer**| Element ID | [optional] 
 **employee_id** | **Integer**| Element ID | [optional] 
 **department_id** | **Integer**| Element ID | [optional] 
 **project_id** | **Integer**| Element ID | [optional] 
 **product_id** | **Integer**| Element ID | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseLedgerAccount**](ListResponseLedgerAccount.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **search**
> ListResponseLedgerAccount search(date_from, date_to, opts)

Get ledger (hovedbok).



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

api_instance = TripletexRubyClient::LedgerApi.new

date_from = 'date_from_example' # String | Format is yyyy-MM-dd (from and incl.).

date_to = 'date_to_example' # String | Format is yyyy-MM-dd (to and excl.).

opts = { 
  open_postings: 'open_postings_example', # String | Deprecated
  account_id: 56, # Integer | Element ID
  supplier_id: 56, # Integer | Element ID
  customer_id: 56, # Integer | Element ID
  employee_id: 56, # Integer | Element ID
  department_id: 56, # Integer | Element ID
  project_id: 56, # Integer | Element ID
  product_id: 56, # Integer | Element ID
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Get ledger (hovedbok).
  result = api_instance.search(date_from, date_to, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling LedgerApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **date_from** | **String**| Format is yyyy-MM-dd (from and incl.). | 
 **date_to** | **String**| Format is yyyy-MM-dd (to and excl.). | 
 **open_postings** | **String**| Deprecated | [optional] 
 **account_id** | **Integer**| Element ID | [optional] 
 **supplier_id** | **Integer**| Element ID | [optional] 
 **customer_id** | **Integer**| Element ID | [optional] 
 **employee_id** | **Integer**| Element ID | [optional] 
 **department_id** | **Integer**| Element ID | [optional] 
 **project_id** | **Integer**| Element ID | [optional] 
 **product_id** | **Integer**| Element ID | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseLedgerAccount**](ListResponseLedgerAccount.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



