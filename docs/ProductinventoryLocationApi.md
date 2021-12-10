# TripletexRubyClient::ProductinventoryLocationApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete**](ProductinventoryLocationApi.md#delete) | **DELETE** /product/inventoryLocation/{id} | [BETA] Delete product inventory location. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**get**](ProductinventoryLocationApi.md#get) | **GET** /product/inventoryLocation/{id} | Get inventory location by ID. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**post**](ProductinventoryLocationApi.md#post) | **POST** /product/inventoryLocation | [BETA] Create new product inventory location. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**post_list**](ProductinventoryLocationApi.md#post_list) | **POST** /product/inventoryLocation/list | [BETA] Add multiple product inventory locations. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**put**](ProductinventoryLocationApi.md#put) | **PUT** /product/inventoryLocation/{id} | [BETA] Update product inventory location. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**put_list**](ProductinventoryLocationApi.md#put_list) | **PUT** /product/inventoryLocation/list | [BETA] Update multiple product inventory locations. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**search**](ProductinventoryLocationApi.md#search) | **GET** /product/inventoryLocation | [BETA] Find inventory locations by product ID. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;


# **delete**
> delete(id)

[BETA] Delete product inventory location. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::ProductinventoryLocationApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Delete product inventory location. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  api_instance.delete(id)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProductinventoryLocationApi->delete: #{e}"
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
> ResponseWrapperProductInventoryLocation get(id, opts)

Get inventory location by ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::ProductinventoryLocationApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Get inventory location by ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProductinventoryLocationApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperProductInventoryLocation**](ResponseWrapperProductInventoryLocation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperProductInventoryLocation post(opts)

[BETA] Create new product inventory location. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::ProductinventoryLocationApi.new

opts = { 
  body: TripletexRubyClient::ProductInventoryLocation.new # ProductInventoryLocation | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create new product inventory location. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProductinventoryLocationApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**ProductInventoryLocation**](ProductInventoryLocation.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperProductInventoryLocation**](ResponseWrapperProductInventoryLocation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_list**
> ListResponseProductInventoryLocation post_list(opts)

[BETA] Add multiple product inventory locations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::ProductinventoryLocationApi.new

opts = { 
  body: [TripletexRubyClient::ProductInventoryLocation.new] # Array<ProductInventoryLocation> | JSON representing a list of new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Add multiple product inventory locations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  result = api_instance.post_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProductinventoryLocationApi->post_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;ProductInventoryLocation&gt;**](ProductInventoryLocation.md)| JSON representing a list of new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ListResponseProductInventoryLocation**](ListResponseProductInventoryLocation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperProductInventoryLocation put(id, opts)

[BETA] Update product inventory location. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::ProductinventoryLocationApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::ProductInventoryLocation.new # ProductInventoryLocation | Partial object describing what should be updated
}

begin
  #[BETA] Update product inventory location. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProductinventoryLocationApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**ProductInventoryLocation**](ProductInventoryLocation.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperProductInventoryLocation**](ResponseWrapperProductInventoryLocation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put_list**
> ListResponseProductInventoryLocation put_list(opts)

[BETA] Update multiple product inventory locations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::ProductinventoryLocationApi.new

opts = { 
  body: [TripletexRubyClient::ProductInventoryLocation.new] # Array<ProductInventoryLocation> | JSON representing updates to object. Should have ID and version set.
}

begin
  #[BETA] Update multiple product inventory locations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  result = api_instance.put_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProductinventoryLocationApi->put_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;ProductInventoryLocation&gt;**](ProductInventoryLocation.md)| JSON representing updates to object. Should have ID and version set. | [optional] 

### Return type

[**ListResponseProductInventoryLocation**](ListResponseProductInventoryLocation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseProductInventoryLocation search(opts)

[BETA] Find inventory locations by product ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::ProductinventoryLocationApi.new

opts = { 
  product_id: 'product_id_example', # String | List of IDs
  inventory_id: 'inventory_id_example', # String | List of IDs
  is_main_location: true, # BOOLEAN | Equals
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find inventory locations by product ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProductinventoryLocationApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **product_id** | **String**| List of IDs | [optional] 
 **inventory_id** | **String**| List of IDs | [optional] 
 **is_main_location** | **BOOLEAN**| Equals | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseProductInventoryLocation**](ListResponseProductInventoryLocation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



