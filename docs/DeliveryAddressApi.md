# TripletexRubyClient::DeliveryAddressApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](DeliveryAddressApi.md#get) | **GET** /deliveryAddress/{id} | Get address by ID.
[**put**](DeliveryAddressApi.md#put) | **PUT** /deliveryAddress/{id} | Update address.
[**search**](DeliveryAddressApi.md#search) | **GET** /deliveryAddress | Find addresses corresponding with sent data.


# **get**
> ResponseWrapperDeliveryAddress get(id, opts)

Get address by ID.



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

api_instance = TripletexRubyClient::DeliveryAddressApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Get address by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling DeliveryAddressApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperDeliveryAddress**](ResponseWrapperDeliveryAddress.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **put**
> ResponseWrapperDeliveryAddress put(id, opts)

Update address.



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

api_instance = TripletexRubyClient::DeliveryAddressApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::DeliveryAddress.new # DeliveryAddress | Partial object describing what should be updated
}

begin
  #Update address.
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling DeliveryAddressApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**DeliveryAddress**](DeliveryAddress.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperDeliveryAddress**](ResponseWrapperDeliveryAddress.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseDeliveryAddress search(opts)

Find addresses corresponding with sent data.



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

api_instance = TripletexRubyClient::DeliveryAddressApi.new

opts = { 
  id: 'id_example', # String | List of IDs
  address_line1: 'address_line1_example', # String | List of IDs
  address_line2: 'address_line2_example', # String | List of IDs
  postal_code: 'postal_code_example', # String | List of IDs
  city: 'city_example', # String | List of IDs
  name: 'name_example', # String | List of IDs
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find addresses corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling DeliveryAddressApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of IDs | [optional] 
 **address_line1** | **String**| List of IDs | [optional] 
 **address_line2** | **String**| List of IDs | [optional] 
 **postal_code** | **String**| List of IDs | [optional] 
 **city** | **String**| List of IDs | [optional] 
 **name** | **String**| List of IDs | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseDeliveryAddress**](ListResponseDeliveryAddress.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



