# TripletexRubyClient::EmployeeemploymentleaveOfAbsenceApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](EmployeeemploymentleaveOfAbsenceApi.md#get) | **GET** /employee/employment/leaveOfAbsence/{id} | [BETA] Find leave of absence by ID.
[**post**](EmployeeemploymentleaveOfAbsenceApi.md#post) | **POST** /employee/employment/leaveOfAbsence | [BETA] Create leave of absence.
[**post_list**](EmployeeemploymentleaveOfAbsenceApi.md#post_list) | **POST** /employee/employment/leaveOfAbsence/list | [BETA] Create multiple leave of absences.
[**put**](EmployeeemploymentleaveOfAbsenceApi.md#put) | **PUT** /employee/employment/leaveOfAbsence/{id} | [BETA] Update leave of absence. 


# **get**
> ResponseWrapperLeaveOfAbsence get(id, opts)

[BETA] Find leave of absence by ID.



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

api_instance = TripletexRubyClient::EmployeeemploymentleaveOfAbsenceApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find leave of absence by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeeemploymentleaveOfAbsenceApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperLeaveOfAbsence**](ResponseWrapperLeaveOfAbsence.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperLeaveOfAbsence post(opts)

[BETA] Create leave of absence.



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

api_instance = TripletexRubyClient::EmployeeemploymentleaveOfAbsenceApi.new

opts = { 
  body: TripletexRubyClient::LeaveOfAbsence.new # LeaveOfAbsence | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create leave of absence.
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeeemploymentleaveOfAbsenceApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**LeaveOfAbsence**](LeaveOfAbsence.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperLeaveOfAbsence**](ResponseWrapperLeaveOfAbsence.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_list**
> ListResponseLeaveOfAbsence post_list(opts)

[BETA] Create multiple leave of absences.



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

api_instance = TripletexRubyClient::EmployeeemploymentleaveOfAbsenceApi.new

opts = { 
  body: [TripletexRubyClient::LeaveOfAbsence.new] # Array<LeaveOfAbsence> | JSON representing a list of new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create multiple leave of absences.
  result = api_instance.post_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeeemploymentleaveOfAbsenceApi->post_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;LeaveOfAbsence&gt;**](LeaveOfAbsence.md)| JSON representing a list of new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ListResponseLeaveOfAbsence**](ListResponseLeaveOfAbsence.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperLeaveOfAbsence put(id, opts)

[BETA] Update leave of absence. 



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

api_instance = TripletexRubyClient::EmployeeemploymentleaveOfAbsenceApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::LeaveOfAbsence.new # LeaveOfAbsence | Partial object describing what should be updated
}

begin
  #[BETA] Update leave of absence. 
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeeemploymentleaveOfAbsenceApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**LeaveOfAbsence**](LeaveOfAbsence.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperLeaveOfAbsence**](ResponseWrapperLeaveOfAbsence.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



