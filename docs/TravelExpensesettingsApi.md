# TripletexRubyClient::TravelExpensesettingsApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](TravelExpensesettingsApi.md#get) | **GET** /travelExpense/settings | [BETA] Get travel expense settings of logged in company.


# **get**
> ResponseWrapperTravelExpenseSettings get(opts)

[BETA] Get travel expense settings of logged in company.



### Example
```ruby
# load the gem
require 'tripletex_ruby_client'
# setup authorization
# # Setup authorization - as autogenerated by swagger-codegen
# TripletexRubyClient.configure do |config|
#   # Configure HTTP basic authorization: tokenAuthScheme
#   config.username = 'YOUR USERNAME'
#   config.password = 'YOUR PASSWORD'
# end
# Setup authorization
# 
TripletexRubyClient.configure do |config|
  # Configure HTTP basic authorization: tokenAuthScheme
  config.consumer_token = ENV["TT_CONSUMER_TOKEN"]
  config.employee_token = ENV["TT_EMPLOYEE_TOKEN"]
  config.host = Rails.env.production? ? 'https://tripletex.no' : 'https://api.tripletex.io'
  config.token_expiration_time = Rails.env.production? ? 1.month : 1.day
end
api_instance = TripletexRubyClient::TravelExpensesettingsApi.new

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Get travel expense settings of logged in company.
  result = api_instance.get(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpensesettingsApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperTravelExpenseSettings**](ResponseWrapperTravelExpenseSettings.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



