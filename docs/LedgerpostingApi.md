# TripletexRubyClient::LedgerpostingApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](LedgerpostingApi.md#get) | **GET** /ledger/posting/{id} | Find postings by ID.
[**open_post**](LedgerpostingApi.md#open_post) | **GET** /ledger/posting/openPost | Find open posts corresponding with sent data.
[**search**](LedgerpostingApi.md#search) | **GET** /ledger/posting | Find postings corresponding with sent data.


# **get**
> ResponseWrapperPosting get(id, opts)

Find postings by ID.



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

api_instance = TripletexRubyClient::LedgerpostingApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find postings by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling LedgerpostingApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperPosting**](ResponseWrapperPosting.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **open_post**
> ListResponsePosting open_post(date, opts)

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

api_instance = TripletexRubyClient::LedgerpostingApi.new

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
  puts "Exception when calling LedgerpostingApi->open_post: #{e}"
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

[**ListResponsePosting**](ListResponsePosting.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **search**
> ListResponsePosting search(date_from, date_to, opts)

Find postings corresponding with sent data.



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

api_instance = TripletexRubyClient::LedgerpostingApi.new

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
  type: 'type_example', # String | Element ID
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find postings corresponding with sent data.
  result = api_instance.search(date_from, date_to, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling LedgerpostingApi->search: #{e}"
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
 **type** | **String**| Element ID | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponsePosting**](ListResponsePosting.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



