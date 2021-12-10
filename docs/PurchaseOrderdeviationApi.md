# TripletexRubyClient::PurchaseOrderdeviationApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**approve**](PurchaseOrderdeviationApi.md#approve) | **PUT** /purchaseOrder/deviation/{id}/:approve | [BETA] Approve deviations. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**delete**](PurchaseOrderdeviationApi.md#delete) | **DELETE** /purchaseOrder/deviation/{id} | [BETA] Delete goods receipt by purchase order ID. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**deliver**](PurchaseOrderdeviationApi.md#deliver) | **PUT** /purchaseOrder/deviation/{id}/:deliver | [BETA] Send deviations to approval. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**get**](PurchaseOrderdeviationApi.md#get) | **GET** /purchaseOrder/deviation/{id} |  [BETA] Get deviation by order line ID. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**post**](PurchaseOrderdeviationApi.md#post) | **POST** /purchaseOrder/deviation | [BETA] Register deviation on goods receipt. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**post_list**](PurchaseOrderdeviationApi.md#post_list) | **POST** /purchaseOrder/deviation/list | [BETA] Register multiple deviations. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**put**](PurchaseOrderdeviationApi.md#put) | **PUT** /purchaseOrder/deviation/{id} | Update deviation. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**put_list**](PurchaseOrderdeviationApi.md#put_list) | **PUT** /purchaseOrder/deviation/list | [BETA] Update multiple deviations. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**search**](PurchaseOrderdeviationApi.md#search) | **GET** /purchaseOrder/deviation | [BETA] Find handled deviations for purchase order. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**undeliver**](PurchaseOrderdeviationApi.md#undeliver) | **PUT** /purchaseOrder/deviation/{id}/:undeliver | [BETA] Undeliver the deviations. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;


# **approve**
> ResponseWrapperPurchaseOrder approve(id)

[BETA] Approve deviations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::PurchaseOrderdeviationApi.new

id = 56 # Integer | Purchase Order ID.


begin
  #[BETA] Approve deviations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  result = api_instance.approve(id)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling PurchaseOrderdeviationApi->approve: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Purchase Order ID. | 

### Return type

[**ResponseWrapperPurchaseOrder**](ResponseWrapperPurchaseOrder.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **delete**
> delete(id)

[BETA] Delete goods receipt by purchase order ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::PurchaseOrderdeviationApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Delete goods receipt by purchase order ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  api_instance.delete(id)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling PurchaseOrderdeviationApi->delete: #{e}"
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



# **deliver**
> ResponseWrapperPurchaseOrder deliver(id)

[BETA] Send deviations to approval. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::PurchaseOrderdeviationApi.new

id = 56 # Integer | Purchase Order ID.


begin
  #[BETA] Send deviations to approval. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  result = api_instance.deliver(id)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling PurchaseOrderdeviationApi->deliver: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Purchase Order ID. | 

### Return type

[**ResponseWrapperPurchaseOrder**](ResponseWrapperPurchaseOrder.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **get**
> ResponseWrapperDeviation get(id, opts)

 [BETA] Get deviation by order line ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::PurchaseOrderdeviationApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  # [BETA] Get deviation by order line ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling PurchaseOrderdeviationApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperDeviation**](ResponseWrapperDeviation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperDeviation post(opts)

[BETA] Register deviation on goods receipt. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::PurchaseOrderdeviationApi.new

opts = { 
  body: TripletexRubyClient::Deviation.new # Deviation | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Register deviation on goods receipt. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling PurchaseOrderdeviationApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Deviation**](Deviation.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperDeviation**](ResponseWrapperDeviation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_list**
> ListResponseDeviation post_list(opts)

[BETA] Register multiple deviations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::PurchaseOrderdeviationApi.new

opts = { 
  body: [TripletexRubyClient::Deviation.new] # Array<Deviation> | JSON representing a list of new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Register multiple deviations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  result = api_instance.post_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling PurchaseOrderdeviationApi->post_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;Deviation&gt;**](Deviation.md)| JSON representing a list of new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ListResponseDeviation**](ListResponseDeviation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperDeviation put(id, opts)

Update deviation. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::PurchaseOrderdeviationApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::Deviation.new # Deviation | Partial object describing what should be updated
}

begin
  #Update deviation. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling PurchaseOrderdeviationApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**Deviation**](Deviation.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperDeviation**](ResponseWrapperDeviation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put_list**
> ListResponseDeviation put_list(opts)

[BETA] Update multiple deviations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::PurchaseOrderdeviationApi.new

opts = { 
  body: [TripletexRubyClient::Deviation.new] # Array<Deviation> | JSON representing updates to object. Should have ID and version set.
}

begin
  #[BETA] Update multiple deviations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  result = api_instance.put_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling PurchaseOrderdeviationApi->put_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;Deviation&gt;**](Deviation.md)| JSON representing updates to object. Should have ID and version set. | [optional] 

### Return type

[**ListResponseDeviation**](ListResponseDeviation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseDeviation search(purchase_order_id, opts)

[BETA] Find handled deviations for purchase order. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::PurchaseOrderdeviationApi.new

purchase_order_id = 56 # Integer | Equals

opts = { 
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find handled deviations for purchase order. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  result = api_instance.search(purchase_order_id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling PurchaseOrderdeviationApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **purchase_order_id** | **Integer**| Equals | 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseDeviation**](ListResponseDeviation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **undeliver**
> ResponseWrapperPurchaseOrder undeliver(id)

[BETA] Undeliver the deviations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::PurchaseOrderdeviationApi.new

id = 56 # Integer | Purchase Order ID.


begin
  #[BETA] Undeliver the deviations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  result = api_instance.undeliver(id)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling PurchaseOrderdeviationApi->undeliver: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Purchase Order ID. | 

### Return type

[**ResponseWrapperPurchaseOrder**](ResponseWrapperPurchaseOrder.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



