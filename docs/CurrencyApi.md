# TripletexRubyClient::CurrencyApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](CurrencyApi.md#get) | **GET** /currency/{id} | Get currency by ID.
[**get_rate**](CurrencyApi.md#get_rate) | **GET** /currency/{id}/rate | Find currency exchange rate corresponding with sent data.
[**search**](CurrencyApi.md#search) | **GET** /currency | Find currencies corresponding with sent data.


# **get**
> ResponseWrapperCurrency get(id, opts)

Get currency by ID.



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

api_instance = TripletexRubyClient::CurrencyApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Get currency by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling CurrencyApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperCurrency**](ResponseWrapperCurrency.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get_rate**
> ResponseWrapperCurrencyExchangeRate get_rate(id, date, opts)

Find currency exchange rate corresponding with sent data.



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

api_instance = TripletexRubyClient::CurrencyApi.new

id = 56 # Integer | Currency id

date = 'date_example' # String | Format is yyyy-MM-dd

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find currency exchange rate corresponding with sent data.
  result = api_instance.get_rate(id, date, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling CurrencyApi->get_rate: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Currency id | 
 **date** | **String**| Format is yyyy-MM-dd | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperCurrencyExchangeRate**](ResponseWrapperCurrencyExchangeRate.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **search**
> ListResponseCurrency search(opts)

Find currencies corresponding with sent data.



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

api_instance = TripletexRubyClient::CurrencyApi.new

opts = { 
  id: 'id_example', # String | List of IDs
  code: 'code_example', # String | Currency codes
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find currencies corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling CurrencyApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of IDs | [optional] 
 **code** | **String**| Currency codes | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseCurrency**](ListResponseCurrency.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



