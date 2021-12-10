# TripletexRubyClient::EmployeeemploymentleaveOfAbsenceTypeApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**search**](EmployeeemploymentleaveOfAbsenceTypeApi.md#search) | **GET** /employee/employment/leaveOfAbsenceType | [BETA] Find all leave of absence type IDs.


# **search**
> ListResponseLeaveOfAbsenceType search(opts)

[BETA] Find all leave of absence type IDs.



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

api_instance = TripletexRubyClient::EmployeeemploymentleaveOfAbsenceTypeApi.new

opts = { 
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find all leave of absence type IDs.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeeemploymentleaveOfAbsenceTypeApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseLeaveOfAbsenceType**](ListResponseLeaveOfAbsenceType.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



