# TripletexRubyClient::EventApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**example**](EventApi.md#example) | **GET** /event/{eventType} | [BETA] Get example webhook payload
[**get**](EventApi.md#get) | **GET** /event | [BETA] Get all (WebHook) event keys.


# **example**
> ResponseWrapperEventInfoDTO example(event_type, opts)

[BETA] Get example webhook payload



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

api_instance = TripletexRubyClient::EventApi.new

event_type = 'event_type_example' # String | Event type, from /event endpoint

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Get example webhook payload
  result = api_instance.example(event_type, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EventApi->example: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **event_type** | **String**| Event type, from /event endpoint | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperEventInfoDTO**](ResponseWrapperEventInfoDTO.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get**
> ResponseWrapperMapStringEventInfoDescription get(opts)

[BETA] Get all (WebHook) event keys.



### Example
```ruby
# load the gem
require 'tripletex_ruby_client'

api_instance = TripletexRubyClient::EventApi.new

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Get all (WebHook) event keys.
  result = api_instance.get(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EventApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperMapStringEventInfoDescription**](ResponseWrapperMapStringEventInfoDescription.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



