# TripletexRubyClient::SalarytypeApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](SalarytypeApi.md#get) | **GET** /salary/type/{id} | [BETA] Find salary type by ID.
[**search**](SalarytypeApi.md#search) | **GET** /salary/type | [BETA] Find salary type corresponding with sent data.


# **get**
> ResponseWrapperSalaryType get(id, opts)

[BETA] Find salary type by ID.



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

api_instance = TripletexRubyClient::SalarytypeApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find salary type by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SalarytypeApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperSalaryType**](ResponseWrapperSalaryType.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **search**
> ListResponseSalaryType search(opts)

[BETA] Find salary type corresponding with sent data.



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

api_instance = TripletexRubyClient::SalarytypeApi.new

opts = { 
  id: 'id_example', # String | List of IDs
  number: 'number_example', # String | Containing
  name: 'name_example', # String | Containing
  description: 'description_example', # String | Containing
  show_in_timesheet: true, # BOOLEAN | Equals
  is_inactive: true, # BOOLEAN | Equals
  employee_ids: 'employee_ids_example', # String | Equals
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find salary type corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SalarytypeApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of IDs | [optional] 
 **number** | **String**| Containing | [optional] 
 **name** | **String**| Containing | [optional] 
 **description** | **String**| Containing | [optional] 
 **show_in_timesheet** | **BOOLEAN**| Equals | [optional] 
 **is_inactive** | **BOOLEAN**| Equals | [optional] 
 **employee_ids** | **String**| Equals | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseSalaryType**](ListResponseSalaryType.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



