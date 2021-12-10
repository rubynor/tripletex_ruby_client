# TripletexRubyClient::TokensessionApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create**](TokensessionApi.md#create) | **PUT** /token/session/:create | Create session token.
[**delete**](TokensessionApi.md#delete) | **DELETE** /token/session/{token} | Delete session token.
[**who_am_i**](TokensessionApi.md#who_am_i) | **GET** /token/session/&gt;whoAmI | Find information about the current user.


# **create**
> ResponseWrapperSessionToken create(consumer_token, employee_token, expiration_date)

Create session token.



### Example
```ruby
# load the gem
require 'tripletex_ruby_client'

api_instance = TripletexRubyClient::TokensessionApi.new

consumer_token = 'consumer_token_example' # String | Token of the API consumer

employee_token = 'employee_token_example' # String | The employees token

expiration_date = 'expiration_date_example' # String | Expiration date for the combined token


begin
  #Create session token.
  result = api_instance.create(consumer_token, employee_token, expiration_date)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TokensessionApi->create: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **consumer_token** | **String**| Token of the API consumer | 
 **employee_token** | **String**| The employees token | 
 **expiration_date** | **String**| Expiration date for the combined token | 

### Return type

[**ResponseWrapperSessionToken**](ResponseWrapperSessionToken.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **delete**
> delete(token)

Delete session token.



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

api_instance = TripletexRubyClient::TokensessionApi.new

token = 'token_example' # String | The login token string to delete


begin
  #Delete session token.
  api_instance.delete(token)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TokensessionApi->delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **token** | **String**| The login token string to delete | 

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **who_am_i**
> ResponseWrapperLoggedInUserInfoDTO who_am_i(opts)

Find information about the current user.



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

api_instance = TripletexRubyClient::TokensessionApi.new

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find information about the current user.
  result = api_instance.who_am_i(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TokensessionApi->who_am_i: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperLoggedInUserInfoDTO**](ResponseWrapperLoggedInUserInfoDTO.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



