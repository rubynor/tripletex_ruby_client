# TripletexRubyClient::SalarycompilationApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**download_pdf**](SalarycompilationApi.md#download_pdf) | **GET** /salary/compilation/pdf | [BETA] Find salary compilation (PDF document) by employee.
[**get**](SalarycompilationApi.md#get) | **GET** /salary/compilation | [BETA] Find salary compilation by employee.


# **download_pdf**
> String download_pdf(employee_id, opts)

[BETA] Find salary compilation (PDF document) by employee.



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

api_instance = TripletexRubyClient::SalarycompilationApi.new

employee_id = 56 # Integer | Element ID

opts = { 
  year: 56 # Integer | Must be between 1900-2100. Defaults to previous year.
}

begin
  #[BETA] Find salary compilation (PDF document) by employee.
  result = api_instance.download_pdf(employee_id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SalarycompilationApi->download_pdf: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **employee_id** | **Integer**| Element ID | 
 **year** | **Integer**| Must be between 1900-2100. Defaults to previous year. | [optional] 

### Return type

**String**

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream



# **get**
> ResponseWrapperSalaryCompilation get(employee_id, opts)

[BETA] Find salary compilation by employee.



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

api_instance = TripletexRubyClient::SalarycompilationApi.new

employee_id = 56 # Integer | Element ID

opts = { 
  year: 56, # Integer | Must be between 1900-2100. Defaults to previous year.
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find salary compilation by employee.
  result = api_instance.get(employee_id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SalarycompilationApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **employee_id** | **Integer**| Element ID | 
 **year** | **Integer**| Must be between 1900-2100. Defaults to previous year. | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperSalaryCompilation**](ResponseWrapperSalaryCompilation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



