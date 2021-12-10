# TripletexRubyClient::TimesheetsalaryTypeSpecificationApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete**](TimesheetsalaryTypeSpecificationApi.md#delete) | **DELETE** /timesheet/salaryTypeSpecification/{id} | [BETA] Delete a timesheet SalaryType Specification
[**get**](TimesheetsalaryTypeSpecificationApi.md#get) | **GET** /timesheet/salaryTypeSpecification/{id} | [BETA] Get timesheet SalaryType Specification for a specific ID
[**post**](TimesheetsalaryTypeSpecificationApi.md#post) | **POST** /timesheet/salaryTypeSpecification | [BETA] Create a timesheet SalaryType Specification. Only one entry per employee/date/SalaryType
[**put**](TimesheetsalaryTypeSpecificationApi.md#put) | **PUT** /timesheet/salaryTypeSpecification/{id} | [BETA] Update a timesheet SalaryType Specification
[**search**](TimesheetsalaryTypeSpecificationApi.md#search) | **GET** /timesheet/salaryTypeSpecification | [BETA] Get list of timesheet SalaryType Specifications


# **delete**
> delete(id)

[BETA] Delete a timesheet SalaryType Specification



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

api_instance = TripletexRubyClient::TimesheetsalaryTypeSpecificationApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Delete a timesheet SalaryType Specification
  api_instance.delete(id)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TimesheetsalaryTypeSpecificationApi->delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get**
> ResponseWrapperTimesheetSalaryTypeSpecification get(id, opts)

[BETA] Get timesheet SalaryType Specification for a specific ID



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

api_instance = TripletexRubyClient::TimesheetsalaryTypeSpecificationApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Get timesheet SalaryType Specification for a specific ID
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TimesheetsalaryTypeSpecificationApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperTimesheetSalaryTypeSpecification**](ResponseWrapperTimesheetSalaryTypeSpecification.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperTimesheetSalaryTypeSpecification post(opts)

[BETA] Create a timesheet SalaryType Specification. Only one entry per employee/date/SalaryType



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

api_instance = TripletexRubyClient::TimesheetsalaryTypeSpecificationApi.new

opts = { 
  body: TripletexRubyClient::TimesheetSalaryTypeSpecification.new # TimesheetSalaryTypeSpecification | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create a timesheet SalaryType Specification. Only one entry per employee/date/SalaryType
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TimesheetsalaryTypeSpecificationApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**TimesheetSalaryTypeSpecification**](TimesheetSalaryTypeSpecification.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperTimesheetSalaryTypeSpecification**](ResponseWrapperTimesheetSalaryTypeSpecification.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **put**
> ResponseWrapperTimesheetSalaryTypeSpecification put(id, opts)

[BETA] Update a timesheet SalaryType Specification



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

api_instance = TripletexRubyClient::TimesheetsalaryTypeSpecificationApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::TimesheetSalaryTypeSpecification.new # TimesheetSalaryTypeSpecification | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Update a timesheet SalaryType Specification
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TimesheetsalaryTypeSpecificationApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**TimesheetSalaryTypeSpecification**](TimesheetSalaryTypeSpecification.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperTimesheetSalaryTypeSpecification**](ResponseWrapperTimesheetSalaryTypeSpecification.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **search**
> ListResponseTimesheetSalaryTypeSpecification search(opts)

[BETA] Get list of timesheet SalaryType Specifications



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

api_instance = TripletexRubyClient::TimesheetsalaryTypeSpecificationApi.new

opts = { 
  date_from: 'date_from_example', # String | From and including
  date_to: 'date_to_example', # String | To and excluding
  employee_id: 56, # Integer | Equals
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Get list of timesheet SalaryType Specifications
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TimesheetsalaryTypeSpecificationApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **date_from** | **String**| From and including | [optional] 
 **date_to** | **String**| To and excluding | [optional] 
 **employee_id** | **Integer**| Equals | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseTimesheetSalaryTypeSpecification**](ListResponseTimesheetSalaryTypeSpecification.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



