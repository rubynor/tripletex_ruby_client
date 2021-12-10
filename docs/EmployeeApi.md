# TripletexRubyClient::EmployeeApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](EmployeeApi.md#get) | **GET** /employee/{id} | Get employee by ID.
[**post**](EmployeeApi.md#post) | **POST** /employee | [BETA] Create one employee.
[**post_list**](EmployeeApi.md#post_list) | **POST** /employee/list | [BETA] Create several employees.
[**put**](EmployeeApi.md#put) | **PUT** /employee/{id} | Update employee.
[**search**](EmployeeApi.md#search) | **GET** /employee | Find employees corresponding with sent data.


# **get**
> ResponseWrapperEmployee get(id, opts)

Get employee by ID.



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

api_instance = TripletexRubyClient::EmployeeApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Get employee by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeeApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperEmployee**](ResponseWrapperEmployee.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperEmployee post(opts)

[BETA] Create one employee.



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

api_instance = TripletexRubyClient::EmployeeApi.new

opts = { 
  body: TripletexRubyClient::Employee.new # Employee | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create one employee.
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeeApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Employee**](Employee.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperEmployee**](ResponseWrapperEmployee.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_list**
> ListResponseEmployee post_list(opts)

[BETA] Create several employees.



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

api_instance = TripletexRubyClient::EmployeeApi.new

opts = { 
  body: [TripletexRubyClient::Employee.new] # Array<Employee> | JSON representing a list of new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create several employees.
  result = api_instance.post_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeeApi->post_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;Employee&gt;**](Employee.md)| JSON representing a list of new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ListResponseEmployee**](ListResponseEmployee.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperEmployee put(id, opts)

Update employee.



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

api_instance = TripletexRubyClient::EmployeeApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::Employee.new # Employee | Partial object describing what should be updated
}

begin
  #Update employee.
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeeApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**Employee**](Employee.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperEmployee**](ResponseWrapperEmployee.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseEmployee search(opts)

Find employees corresponding with sent data.



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

api_instance = TripletexRubyClient::EmployeeApi.new

opts = { 
  id: 'id_example', # String | List of IDs
  first_name: 'first_name_example', # String | Containing
  last_name: 'last_name_example', # String | Containing
  employee_number: 'employee_number_example', # String | Containing
  allow_information_registration: true, # BOOLEAN | Equals
  include_contacts: false, # BOOLEAN | Equals
  department_id: 'department_id_example', # String | List of IDs
  only_project_managers: true, # BOOLEAN | Equals
  only_contacts: false, # BOOLEAN | Equals
  assignable_project_managers: true, # BOOLEAN | Equals
  period_start: 'period_start_example', # String | Equals
  period_end: 'period_end_example', # String | Equals
  has_system_access: true, # BOOLEAN | Equals
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find employees corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeeApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of IDs | [optional] 
 **first_name** | **String**| Containing | [optional] 
 **last_name** | **String**| Containing | [optional] 
 **employee_number** | **String**| Containing | [optional] 
 **allow_information_registration** | **BOOLEAN**| Equals | [optional] 
 **include_contacts** | **BOOLEAN**| Equals | [optional] [default to false]
 **department_id** | **String**| List of IDs | [optional] 
 **only_project_managers** | **BOOLEAN**| Equals | [optional] 
 **only_contacts** | **BOOLEAN**| Equals | [optional] [default to false]
 **assignable_project_managers** | **BOOLEAN**| Equals | [optional] 
 **period_start** | **String**| Equals | [optional] 
 **period_end** | **String**| Equals | [optional] 
 **has_system_access** | **BOOLEAN**| Equals | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseEmployee**](ListResponseEmployee.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



