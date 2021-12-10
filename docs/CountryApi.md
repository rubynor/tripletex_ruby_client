# TripletexRubyClient::CountryApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](CountryApi.md#get) | **GET** /country/{id} | Get country by ID.
[**search**](CountryApi.md#search) | **GET** /country | Find countries corresponding with sent data.


# **get**
> ResponseWrapperCountry get(id, opts)

Get country by ID.



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

api_instance = TripletexRubyClient::CountryApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Get country by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling CountryApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperCountry**](ResponseWrapperCountry.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **search**
> ListResponseCountry search(opts)

Find countries corresponding with sent data.



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

api_instance = TripletexRubyClient::CountryApi.new

opts = { 
  id: 'id_example', # String | List of IDs
  code: 'code_example', # String | List of IDs
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find countries corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling CountryApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of IDs | [optional] 
 **code** | **String**| List of IDs | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseCountry**](ListResponseCountry.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



