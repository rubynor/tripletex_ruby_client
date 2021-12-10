# TripletexRubyClient::TravelExpenseaccommodationAllowanceApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete**](TravelExpenseaccommodationAllowanceApi.md#delete) | **DELETE** /travelExpense/accommodationAllowance/{id} | [BETA] Delete accommodation allowance.
[**get**](TravelExpenseaccommodationAllowanceApi.md#get) | **GET** /travelExpense/accommodationAllowance/{id} | [BETA] Get travel accommodation allowance by ID.
[**post**](TravelExpenseaccommodationAllowanceApi.md#post) | **POST** /travelExpense/accommodationAllowance | [BETA] Create accommodation allowance.
[**put**](TravelExpenseaccommodationAllowanceApi.md#put) | **PUT** /travelExpense/accommodationAllowance/{id} | [BETA] Update accommodation allowance.
[**search**](TravelExpenseaccommodationAllowanceApi.md#search) | **GET** /travelExpense/accommodationAllowance | [BETA] Find accommodation allowances corresponding with sent data.


# **delete**
> delete(id)

[BETA] Delete accommodation allowance.



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

api_instance = TripletexRubyClient::TravelExpenseaccommodationAllowanceApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Delete accommodation allowance.
  api_instance.delete(id)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseaccommodationAllowanceApi->delete: #{e}"
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
> ResponseWrapperAccommodationAllowance get(id, opts)

[BETA] Get travel accommodation allowance by ID.



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

api_instance = TripletexRubyClient::TravelExpenseaccommodationAllowanceApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Get travel accommodation allowance by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseaccommodationAllowanceApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperAccommodationAllowance**](ResponseWrapperAccommodationAllowance.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperAccommodationAllowance post(opts)

[BETA] Create accommodation allowance.



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

api_instance = TripletexRubyClient::TravelExpenseaccommodationAllowanceApi.new

opts = { 
  body: TripletexRubyClient::AccommodationAllowance.new # AccommodationAllowance | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create accommodation allowance.
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseaccommodationAllowanceApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**AccommodationAllowance**](AccommodationAllowance.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperAccommodationAllowance**](ResponseWrapperAccommodationAllowance.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperAccommodationAllowance put(id, opts)

[BETA] Update accommodation allowance.



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

api_instance = TripletexRubyClient::TravelExpenseaccommodationAllowanceApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::AccommodationAllowance.new # AccommodationAllowance | Partial object describing what should be updated
}

begin
  #[BETA] Update accommodation allowance.
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseaccommodationAllowanceApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**AccommodationAllowance**](AccommodationAllowance.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperAccommodationAllowance**](ResponseWrapperAccommodationAllowance.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseAccommodationAllowance search(opts)

[BETA] Find accommodation allowances corresponding with sent data.



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

api_instance = TripletexRubyClient::TravelExpenseaccommodationAllowanceApi.new

opts = { 
  travel_expense_id: 'travel_expense_id_example', # String | Equals
  rate_type_id: 'rate_type_id_example', # String | Equals
  rate_category_id: 'rate_category_id_example', # String | Equals
  rate_from: 'rate_from_example', # String | From and including
  rate_to: 'rate_to_example', # String | To and excluding
  count_from: 56, # Integer | From and including
  count_to: 56, # Integer | To and excluding
  amount_from: 'amount_from_example', # String | From and including
  amount_to: 'amount_to_example', # String | To and excluding
  location: 'location_example', # String | Containing
  address: 'address_example', # String | Containing
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find accommodation allowances corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseaccommodationAllowanceApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **travel_expense_id** | **String**| Equals | [optional] 
 **rate_type_id** | **String**| Equals | [optional] 
 **rate_category_id** | **String**| Equals | [optional] 
 **rate_from** | **String**| From and including | [optional] 
 **rate_to** | **String**| To and excluding | [optional] 
 **count_from** | **Integer**| From and including | [optional] 
 **count_to** | **Integer**| To and excluding | [optional] 
 **amount_from** | **String**| From and including | [optional] 
 **amount_to** | **String**| To and excluding | [optional] 
 **location** | **String**| Containing | [optional] 
 **address** | **String**| Containing | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseAccommodationAllowance**](ListResponseAccommodationAllowance.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



