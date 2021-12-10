# TripletexRubyClient::EmployeepreferencesApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**logged_in_employee_preferences**](EmployeepreferencesApi.md#logged_in_employee_preferences) | **GET** /employee/preferences/&gt;loggedInEmployeePreferences | [BETA] Get employee preferences for current user
[**search**](EmployeepreferencesApi.md#search) | **GET** /employee/preferences | [BETA] Find employee category corresponding with sent data.


# **logged_in_employee_preferences**
> ResponseWrapperEmployeePreferences logged_in_employee_preferences(opts)

[BETA] Get employee preferences for current user



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

api_instance = TripletexRubyClient::EmployeepreferencesApi.new

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Get employee preferences for current user
  result = api_instance.logged_in_employee_preferences(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeepreferencesApi->logged_in_employee_preferences: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperEmployeePreferences**](ResponseWrapperEmployeePreferences.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **search**
> ResponseWrapperEmployeePreferences search(opts)

[BETA] Find employee category corresponding with sent data.



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

api_instance = TripletexRubyClient::EmployeepreferencesApi.new

opts = { 
  id: 'id_example', # String | Equals
  employee_id: 56, # Integer | Equals
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find employee category corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeepreferencesApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Equals | [optional] 
 **employee_id** | **Integer**| Equals | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperEmployeePreferences**](ResponseWrapperEmployeePreferences.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



