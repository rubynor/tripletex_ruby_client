# TripletexRubyClient::TravelExpensepassengerApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete**](TravelExpensepassengerApi.md#delete) | **DELETE** /travelExpense/passenger/{id} | [BETA] Delete passenger.
[**get**](TravelExpensepassengerApi.md#get) | **GET** /travelExpense/passenger/{id} | [BETA] Get passenger by ID.
[**post**](TravelExpensepassengerApi.md#post) | **POST** /travelExpense/passenger | [BETA] Create passenger.
[**put**](TravelExpensepassengerApi.md#put) | **PUT** /travelExpense/passenger/{id} | [BETA] Update passenger.
[**search**](TravelExpensepassengerApi.md#search) | **GET** /travelExpense/passenger | [BETA] Find passengers corresponding with sent data.


# **delete**
> delete(id)

[BETA] Delete passenger.



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

api_instance = TripletexRubyClient::TravelExpensepassengerApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Delete passenger.
  api_instance.delete(id)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpensepassengerApi->delete: #{e}"
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
> ResponseWrapperPassenger get(id, opts)

[BETA] Get passenger by ID.



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

api_instance = TripletexRubyClient::TravelExpensepassengerApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Get passenger by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpensepassengerApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperPassenger**](ResponseWrapperPassenger.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperPassenger post(opts)

[BETA] Create passenger.



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

api_instance = TripletexRubyClient::TravelExpensepassengerApi.new

opts = { 
  body: TripletexRubyClient::Passenger.new # Passenger | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create passenger.
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpensepassengerApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Passenger**](Passenger.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperPassenger**](ResponseWrapperPassenger.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperPassenger put(id, opts)

[BETA] Update passenger.



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

api_instance = TripletexRubyClient::TravelExpensepassengerApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::Passenger.new # Passenger | Partial object describing what should be updated
}

begin
  #[BETA] Update passenger.
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpensepassengerApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**Passenger**](Passenger.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperPassenger**](ResponseWrapperPassenger.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponsePassenger search(opts)

[BETA] Find passengers corresponding with sent data.



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

api_instance = TripletexRubyClient::TravelExpensepassengerApi.new

opts = { 
  mileage_allowance: 'mileage_allowance_example', # String | Equals
  name: 'name_example', # String | Containing
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find passengers corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpensepassengerApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **mileage_allowance** | **String**| Equals | [optional] 
 **name** | **String**| Containing | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponsePassenger**](ListResponsePassenger.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



