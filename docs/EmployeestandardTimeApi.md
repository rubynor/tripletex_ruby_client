# TripletexRubyClient::EmployeestandardTimeApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](EmployeestandardTimeApi.md#get) | **GET** /employee/standardTime/{id} | [BETA] Find standard time by ID.
[**post**](EmployeestandardTimeApi.md#post) | **POST** /employee/standardTime | [BETA] Create standard time.
[**put**](EmployeestandardTimeApi.md#put) | **PUT** /employee/standardTime/{id} | [BETA] Update standard time. 
[**search**](EmployeestandardTimeApi.md#search) | **GET** /employee/standardTime | [BETA] Find all standard times for employee.


# **get**
> ResponseWrapperStandardTime get(id, opts)

[BETA] Find standard time by ID.



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

api_instance = TripletexRubyClient::EmployeestandardTimeApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find standard time by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeestandardTimeApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperStandardTime**](ResponseWrapperStandardTime.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperStandardTime post(opts)

[BETA] Create standard time.



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

api_instance = TripletexRubyClient::EmployeestandardTimeApi.new

opts = { 
  body: TripletexRubyClient::StandardTime.new # StandardTime | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create standard time.
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeestandardTimeApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**StandardTime**](StandardTime.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperStandardTime**](ResponseWrapperStandardTime.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperStandardTime put(id, opts)

[BETA] Update standard time. 



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

api_instance = TripletexRubyClient::EmployeestandardTimeApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::StandardTime.new # StandardTime | Partial object describing what should be updated
}

begin
  #[BETA] Update standard time. 
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeestandardTimeApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**StandardTime**](StandardTime.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperStandardTime**](ResponseWrapperStandardTime.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseStandardTime search(opts)

[BETA] Find all standard times for employee.



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

api_instance = TripletexRubyClient::EmployeestandardTimeApi.new

opts = { 
  employee_id: 56, # Integer | Employee ID. Defaults to ID of token owner.
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find all standard times for employee.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeestandardTimeApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **employee_id** | **Integer**| Employee ID. Defaults to ID of token owner. | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseStandardTime**](ListResponseStandardTime.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



