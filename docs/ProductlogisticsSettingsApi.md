# TripletexRubyClient::ProductlogisticsSettingsApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](ProductlogisticsSettingsApi.md#get) | **GET** /product/logisticsSettings | [BETA] Get logistics settings of logged in company.
[**put**](ProductlogisticsSettingsApi.md#put) | **PUT** /product/logisticsSettings | [BETA] Update logistics settings of logged in company.


# **get**
> ResponseWrapperLogisticsSettings get(opts)

[BETA] Get logistics settings of logged in company.



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

api_instance = TripletexRubyClient::ProductlogisticsSettingsApi.new

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Get logistics settings of logged in company.
  result = api_instance.get(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProductlogisticsSettingsApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperLogisticsSettings**](ResponseWrapperLogisticsSettings.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **put**
> ResponseWrapperLogisticsSettings put(opts)

[BETA] Update logistics settings of logged in company.



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

api_instance = TripletexRubyClient::ProductlogisticsSettingsApi.new

opts = { 
  body: TripletexRubyClient::LogisticsSettings.new # LogisticsSettings | Partial object describing what should be updated
}

begin
  #[BETA] Update logistics settings of logged in company.
  result = api_instance.put(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProductlogisticsSettingsApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**LogisticsSettings**](LogisticsSettings.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperLogisticsSettings**](ResponseWrapperLogisticsSettings.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



