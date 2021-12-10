# TripletexRubyClient::EmployeeentitlementApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**client**](EmployeeentitlementApi.md#client) | **GET** /employee/entitlement/client | [BETA] Find all entitlements at client for user.
[**get**](EmployeeentitlementApi.md#get) | **GET** /employee/entitlement/{id} | Get entitlement by ID.
[**grant_client_entitlements_by_template**](EmployeeentitlementApi.md#grant_client_entitlements_by_template) | **PUT** /employee/entitlement/:grantClientEntitlementsByTemplate | [BETA] Update employee entitlements in client account.
[**grant_entitlements_by_template**](EmployeeentitlementApi.md#grant_entitlements_by_template) | **PUT** /employee/entitlement/:grantEntitlementsByTemplate | [BETA] Update employee entitlements.
[**search**](EmployeeentitlementApi.md#search) | **GET** /employee/entitlement | Find all entitlements for user.


# **client**
> ListResponseEntitlement client(opts)

[BETA] Find all entitlements at client for user.



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

api_instance = TripletexRubyClient::EmployeeentitlementApi.new

opts = { 
  employee_id: 56, # Integer | Employee ID. Defaults to ID of token owner.
  customer_id: 56, # Integer | Client ID
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find all entitlements at client for user.
  result = api_instance.client(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeeentitlementApi->client: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **employee_id** | **Integer**| Employee ID. Defaults to ID of token owner. | [optional] 
 **customer_id** | **Integer**| Client ID | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseEntitlement**](ListResponseEntitlement.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get**
> ResponseWrapperEntitlement get(id, opts)

Get entitlement by ID.



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

api_instance = TripletexRubyClient::EmployeeentitlementApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Get entitlement by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeeentitlementApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperEntitlement**](ResponseWrapperEntitlement.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **grant_client_entitlements_by_template**
> grant_client_entitlements_by_template(employee_id, customer_id, template, opts)

[BETA] Update employee entitlements in client account.



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

api_instance = TripletexRubyClient::EmployeeentitlementApi.new

employee_id = 56 # Integer | Employee ID

customer_id = 56 # Integer | Client ID

template = 'template_example' # String | Template

opts = { 
  add_to_existing: false # BOOLEAN | Add template to existing entitlements
}

begin
  #[BETA] Update employee entitlements in client account.
  api_instance.grant_client_entitlements_by_template(employee_id, customer_id, template, opts)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeeentitlementApi->grant_client_entitlements_by_template: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **employee_id** | **Integer**| Employee ID | 
 **customer_id** | **Integer**| Client ID | 
 **template** | **String**| Template | 
 **add_to_existing** | **BOOLEAN**| Add template to existing entitlements | [optional] [default to false]

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **grant_entitlements_by_template**
> grant_entitlements_by_template(employee_id, template)

[BETA] Update employee entitlements.

The user will only receive the entitlements which are possible with the registered user type

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

api_instance = TripletexRubyClient::EmployeeentitlementApi.new

employee_id = 56 # Integer | Employee ID

template = 'template_example' # String | Template


begin
  #[BETA] Update employee entitlements.
  api_instance.grant_entitlements_by_template(employee_id, template)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeeentitlementApi->grant_entitlements_by_template: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **employee_id** | **Integer**| Employee ID | 
 **template** | **String**| Template | 

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **search**
> ListResponseEntitlement search(opts)

Find all entitlements for user.



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

api_instance = TripletexRubyClient::EmployeeentitlementApi.new

opts = { 
  employee_id: 56, # Integer | Employee ID. Defaults to ID of token owner.
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find all entitlements for user.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EmployeeentitlementApi->search: #{e}"
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

[**ListResponseEntitlement**](ListResponseEntitlement.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



