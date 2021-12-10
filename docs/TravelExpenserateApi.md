# TripletexRubyClient::TravelExpenserateApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](TravelExpenserateApi.md#get) | **GET** /travelExpense/rate/{id} | [BETA] Get travel expense rate by ID.
[**search**](TravelExpenserateApi.md#search) | **GET** /travelExpense/rate | [BETA] Find rates corresponding with sent data.


# **get**
> ResponseWrapperTravelExpenseRate get(id, opts)

[BETA] Get travel expense rate by ID.



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

api_instance = TripletexRubyClient::TravelExpenserateApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Get travel expense rate by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenserateApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperTravelExpenseRate**](ResponseWrapperTravelExpenseRate.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **search**
> ListResponseTravelExpenseRate search(opts)

[BETA] Find rates corresponding with sent data.



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

api_instance = TripletexRubyClient::TravelExpenserateApi.new

opts = { 
  rate_category_id: 'rate_category_id_example', # String | Equals
  type: 'type_example', # String | Equals
  is_valid_day_trip: true, # BOOLEAN | Equals
  is_valid_accommodation: true, # BOOLEAN | Equals
  is_valid_domestic: true, # BOOLEAN | Equals
  is_valid_foreign_travel: true, # BOOLEAN | Equals
  requires_zone: true, # BOOLEAN | Equals
  requires_overnight_accommodation: true, # BOOLEAN | Equals
  date_from: 'date_from_example', # String | From and including
  date_to: 'date_to_example', # String | To and excluding
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find rates corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenserateApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **rate_category_id** | **String**| Equals | [optional] 
 **type** | **String**| Equals | [optional] 
 **is_valid_day_trip** | **BOOLEAN**| Equals | [optional] 
 **is_valid_accommodation** | **BOOLEAN**| Equals | [optional] 
 **is_valid_domestic** | **BOOLEAN**| Equals | [optional] 
 **is_valid_foreign_travel** | **BOOLEAN**| Equals | [optional] 
 **requires_zone** | **BOOLEAN**| Equals | [optional] 
 **requires_overnight_accommodation** | **BOOLEAN**| Equals | [optional] 
 **date_from** | **String**| From and including | [optional] 
 **date_to** | **String**| To and excluding | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseTravelExpenseRate**](ListResponseTravelExpenseRate.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



