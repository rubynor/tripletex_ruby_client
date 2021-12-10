# TripletexRubyClient::CompanyaltinnApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**put**](CompanyaltinnApi.md#put) | **PUT** /company/settings/altinn | [BETA] Update AltInn id and password.
[**search**](CompanyaltinnApi.md#search) | **GET** /company/settings/altinn | [BETA] Find Altinn id for login in company.


# **put**
> ResponseWrapperAltinnCompanyModule put(opts)

[BETA] Update AltInn id and password.



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

api_instance = TripletexRubyClient::CompanyaltinnApi.new

opts = { 
  body: TripletexRubyClient::AltinnCompanyModule.new # AltinnCompanyModule | Partial object describing what should be updated
}

begin
  #[BETA] Update AltInn id and password.
  result = api_instance.put(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling CompanyaltinnApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**AltinnCompanyModule**](AltinnCompanyModule.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperAltinnCompanyModule**](ResponseWrapperAltinnCompanyModule.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ResponseWrapperAltinnCompanyModule search(opts)

[BETA] Find Altinn id for login in company.



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

api_instance = TripletexRubyClient::CompanyaltinnApi.new

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find Altinn id for login in company.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling CompanyaltinnApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperAltinnCompanyModule**](ResponseWrapperAltinnCompanyModule.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



