# TripletexRubyClient::ResultbudgetApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_company_result_budget**](ResultbudgetApi.md#get_company_result_budget) | **GET** /resultbudget/company | Get result budget for company
[**get_department_result_budget**](ResultbudgetApi.md#get_department_result_budget) | **GET** /resultbudget/department/{id} | Get result budget associated with a departmentId
[**get_employee_result_budget**](ResultbudgetApi.md#get_employee_result_budget) | **GET** /resultbudget/employee/{id} | Get result budget associated with an employeeId
[**get_product_result_budget**](ResultbudgetApi.md#get_product_result_budget) | **GET** /resultbudget/product/{id} | Get result budget associated with a productId
[**get_project_result_budget**](ResultbudgetApi.md#get_project_result_budget) | **GET** /resultbudget/project/{id} | Get result budget associated with a projectId


# **get_company_result_budget**
> ListResponseResultBudget get_company_result_budget(opts)

Get result budget for company



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

api_instance = TripletexRubyClient::ResultbudgetApi.new

opts = { 
  year: 56, # Integer | Must be between 1900-2100. Defaults to current year.
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Get result budget for company
  result = api_instance.get_company_result_budget(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ResultbudgetApi->get_company_result_budget: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **year** | **Integer**| Must be between 1900-2100. Defaults to current year. | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseResultBudget**](ListResponseResultBudget.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get_department_result_budget**
> ListResponseResultBudget get_department_result_budget(id, opts)

Get result budget associated with a departmentId



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

api_instance = TripletexRubyClient::ResultbudgetApi.new

id = 56 # Integer | Element ID

opts = { 
  year: 56, # Integer | Must be between 1900-2100. Defaults to current year.
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Get result budget associated with a departmentId
  result = api_instance.get_department_result_budget(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ResultbudgetApi->get_department_result_budget: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **year** | **Integer**| Must be between 1900-2100. Defaults to current year. | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseResultBudget**](ListResponseResultBudget.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get_employee_result_budget**
> ListResponseResultBudget get_employee_result_budget(id, opts)

Get result budget associated with an employeeId



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

api_instance = TripletexRubyClient::ResultbudgetApi.new

id = 56 # Integer | Element ID

opts = { 
  year: 56, # Integer | Must be between 1900-2100. Defaults to current year.
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Get result budget associated with an employeeId
  result = api_instance.get_employee_result_budget(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ResultbudgetApi->get_employee_result_budget: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **year** | **Integer**| Must be between 1900-2100. Defaults to current year. | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseResultBudget**](ListResponseResultBudget.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get_product_result_budget**
> ListResponseResultBudget get_product_result_budget(id, opts)

Get result budget associated with a productId



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

api_instance = TripletexRubyClient::ResultbudgetApi.new

id = 56 # Integer | Element ID

opts = { 
  year: 56, # Integer | Must be between 1900-2100. Defaults to current year.
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Get result budget associated with a productId
  result = api_instance.get_product_result_budget(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ResultbudgetApi->get_product_result_budget: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **year** | **Integer**| Must be between 1900-2100. Defaults to current year. | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseResultBudget**](ListResponseResultBudget.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get_project_result_budget**
> ListResponseResultBudget get_project_result_budget(id, opts)

Get result budget associated with a projectId



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

api_instance = TripletexRubyClient::ResultbudgetApi.new

id = 56 # Integer | Element ID

opts = { 
  year: 56, # Integer | Must be between 1900-2100. Defaults to current year.
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Get result budget associated with a projectId
  result = api_instance.get_project_result_budget(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ResultbudgetApi->get_project_result_budget: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **year** | **Integer**| Must be between 1900-2100. Defaults to current year. | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseResultBudget**](ListResponseResultBudget.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



