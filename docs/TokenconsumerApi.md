# TripletexRubyClient::TokenconsumerApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_by_token**](TokenconsumerApi.md#get_by_token) | **GET** /token/consumer/byToken | Get consumer token by token string.


# **get_by_token**
> ResponseWrapperConsumerToken get_by_token(token, opts)

Get consumer token by token string.



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

api_instance = TripletexRubyClient::TokenconsumerApi.new

token = 'token_example' # String | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Get consumer token by token string.
  result = api_instance.get_by_token(token, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TokenconsumerApi->get_by_token: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **token** | **String**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperConsumerToken**](ResponseWrapperConsumerToken.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



