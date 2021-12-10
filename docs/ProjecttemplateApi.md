# TripletexRubyClient::ProjecttemplateApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](ProjecttemplateApi.md#get) | **GET** /project/template/{id} | Get project template by ID.


# **get**
> ResponseWrapperProjectTemplate get(id, opts)

Get project template by ID.



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

api_instance = TripletexRubyClient::ProjecttemplateApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: '*' # String | Fields filter pattern
}

begin
  #Get project template by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjecttemplateApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] [default to *]

### Return type

[**ResponseWrapperProjectTemplate**](ResponseWrapperProjectTemplate.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



