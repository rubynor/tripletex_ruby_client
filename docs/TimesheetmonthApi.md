# TripletexRubyClient::TimesheetmonthApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**approve**](TimesheetmonthApi.md#approve) | **PUT** /timesheet/month/:approve | approve month(s).  If id is provided the other args are ignored
[**complete**](TimesheetmonthApi.md#complete) | **PUT** /timesheet/month/:complete | complete month(s).  If id is provided the other args are ignored
[**get**](TimesheetmonthApi.md#get) | **GET** /timesheet/month/{id} | Find monthly status entry by ID.
[**get_by_month_number**](TimesheetmonthApi.md#get_by_month_number) | **GET** /timesheet/month/byMonthNumber | Find monthly status for given month.
[**reopen**](TimesheetmonthApi.md#reopen) | **PUT** /timesheet/month/:reopen | reopen month(s).  If id is provided the other args are ignored
[**unapprove**](TimesheetmonthApi.md#unapprove) | **PUT** /timesheet/month/:unapprove | unapprove month(s).  If id is provided the other args are ignored


# **approve**
> ListResponseMonthlyStatus approve(opts)

approve month(s).  If id is provided the other args are ignored



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

api_instance = TripletexRubyClient::TimesheetmonthApi.new

opts = { 
  id: 56, # Integer | Element ID
  employee_ids: 'employee_ids_example', # String | List of IDs. Defaults to ID of token owner.
  month_year: 'month_year_example', # String | 2020-01
  approved_until_date: 'approved_until_date_example' # String | yyyy-MM-dd. Defaults to today.. Defaults to end of month
}

begin
  #approve month(s).  If id is provided the other args are ignored
  result = api_instance.approve(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TimesheetmonthApi->approve: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | [optional] 
 **employee_ids** | **String**| List of IDs. Defaults to ID of token owner. | [optional] 
 **month_year** | **String**| 2020-01 | [optional] 
 **approved_until_date** | **String**| yyyy-MM-dd. Defaults to today.. Defaults to end of month | [optional] 

### Return type

[**ListResponseMonthlyStatus**](ListResponseMonthlyStatus.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **complete**
> ListResponseMonthlyStatus complete(opts)

complete month(s).  If id is provided the other args are ignored



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

api_instance = TripletexRubyClient::TimesheetmonthApi.new

opts = { 
  id: 56, # Integer | Element ID
  employee_ids: 'employee_ids_example', # String | List of IDs. Defaults to ID of token owner.
  month_year: 'month_year_example' # String | 2020-01
}

begin
  #complete month(s).  If id is provided the other args are ignored
  result = api_instance.complete(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TimesheetmonthApi->complete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | [optional] 
 **employee_ids** | **String**| List of IDs. Defaults to ID of token owner. | [optional] 
 **month_year** | **String**| 2020-01 | [optional] 

### Return type

[**ListResponseMonthlyStatus**](ListResponseMonthlyStatus.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get**
> ResponseWrapperMonthlyStatus get(id, opts)

Find monthly status entry by ID.



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

api_instance = TripletexRubyClient::TimesheetmonthApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find monthly status entry by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TimesheetmonthApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperMonthlyStatus**](ResponseWrapperMonthlyStatus.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get_by_month_number**
> ListResponseMonthlyStatus get_by_month_number(employee_ids, month_year, opts)

Find monthly status for given month.



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

api_instance = TripletexRubyClient::TimesheetmonthApi.new

employee_ids = 'employee_ids_example' # String | List of IDs. Defaults to ID of token owner.

month_year = 'month_year_example' # String | 2020-01

opts = { 
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find monthly status for given month.
  result = api_instance.get_by_month_number(employee_ids, month_year, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TimesheetmonthApi->get_by_month_number: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **employee_ids** | **String**| List of IDs. Defaults to ID of token owner. | 
 **month_year** | **String**| 2020-01 | 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseMonthlyStatus**](ListResponseMonthlyStatus.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **reopen**
> ListResponseMonthlyStatus reopen(opts)

reopen month(s).  If id is provided the other args are ignored



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

api_instance = TripletexRubyClient::TimesheetmonthApi.new

opts = { 
  id: 56, # Integer | Element ID
  employee_ids: 'employee_ids_example', # String | List of IDs. Defaults to ID of token owner.
  month_year: 'month_year_example' # String | 2020-01
}

begin
  #reopen month(s).  If id is provided the other args are ignored
  result = api_instance.reopen(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TimesheetmonthApi->reopen: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | [optional] 
 **employee_ids** | **String**| List of IDs. Defaults to ID of token owner. | [optional] 
 **month_year** | **String**| 2020-01 | [optional] 

### Return type

[**ListResponseMonthlyStatus**](ListResponseMonthlyStatus.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **unapprove**
> ListResponseMonthlyStatus unapprove(opts)

unapprove month(s).  If id is provided the other args are ignored



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

api_instance = TripletexRubyClient::TimesheetmonthApi.new

opts = { 
  id: 56, # Integer | Element ID
  employee_ids: 'employee_ids_example', # String | List of IDs. Defaults to ID of token owner.
  month_year: 'month_year_example' # String | 2020-01
}

begin
  #unapprove month(s).  If id is provided the other args are ignored
  result = api_instance.unapprove(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TimesheetmonthApi->unapprove: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | [optional] 
 **employee_ids** | **String**| List of IDs. Defaults to ID of token owner. | [optional] 
 **month_year** | **String**| 2020-01 | [optional] 

### Return type

[**ListResponseMonthlyStatus**](ListResponseMonthlyStatus.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



