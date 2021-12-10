# TripletexRubyClient::PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete**](PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.md#delete) | **DELETE** /purchaseOrder/purchaseOrderIncomingInvoiceRelation/{id} | [BETA] Delete purchase order voucher relation. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**delete_by_ids**](PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.md#delete_by_ids) | **DELETE** /purchaseOrder/purchaseOrderIncomingInvoiceRelation/list | [BETA] Delete multiple purchase order voucher relations. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**get**](PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.md#get) | **GET** /purchaseOrder/purchaseOrderIncomingInvoiceRelation/{id} | [BETA] Find purchase order relation to voucher by ID. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**post**](PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.md#post) | **POST** /purchaseOrder/purchaseOrderIncomingInvoiceRelation | [BETA] Create new relation between purchase order and a voucher. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**post_list**](PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.md#post_list) | **POST** /purchaseOrder/purchaseOrderIncomingInvoiceRelation/list | [BETA] Create a new list of relations between purchase order and voucher. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
[**search**](PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.md#search) | **GET** /purchaseOrder/purchaseOrderIncomingInvoiceRelation | [BETA] Find purchase order relation to voucher with sent data. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;


# **delete**
> delete(id)

[BETA] Delete purchase order voucher relation. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Delete purchase order voucher relation. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  api_instance.delete(id)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi->delete: #{e}"
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



# **delete_by_ids**
> delete_by_ids(ids)

[BETA] Delete multiple purchase order voucher relations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.new

ids = 'ids_example' # String | ID of the elements


begin
  #[BETA] Delete multiple purchase order voucher relations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  api_instance.delete_by_ids(ids)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi->delete_by_ids: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ids** | **String**| ID of the elements | 

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get**
> ResponseWrapperPurchaseOrderIncomingInvoiceRelation get(id, opts)

[BETA] Find purchase order relation to voucher by ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find purchase order relation to voucher by ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperPurchaseOrderIncomingInvoiceRelation**](ResponseWrapperPurchaseOrderIncomingInvoiceRelation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperPurchaseOrderIncomingInvoiceRelation post(opts)

[BETA] Create new relation between purchase order and a voucher. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.new

opts = { 
  body: TripletexRubyClient::PurchaseOrderIncomingInvoiceRelation.new # PurchaseOrderIncomingInvoiceRelation | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create new relation between purchase order and a voucher. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**PurchaseOrderIncomingInvoiceRelation**](PurchaseOrderIncomingInvoiceRelation.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperPurchaseOrderIncomingInvoiceRelation**](ResponseWrapperPurchaseOrderIncomingInvoiceRelation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_list**
> ListResponsePurchaseOrderIncomingInvoiceRelation post_list(opts)

[BETA] Create a new list of relations between purchase order and voucher. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.new

opts = { 
  body: [TripletexRubyClient::PurchaseOrderIncomingInvoiceRelation.new] # Array<PurchaseOrderIncomingInvoiceRelation> | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create a new list of relations between purchase order and voucher. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  result = api_instance.post_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi->post_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;PurchaseOrderIncomingInvoiceRelation&gt;**](PurchaseOrderIncomingInvoiceRelation.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ListResponsePurchaseOrderIncomingInvoiceRelation**](ListResponsePurchaseOrderIncomingInvoiceRelation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponsePurchaseOrderIncomingInvoiceRelation search(opts)

[BETA] Find purchase order relation to voucher with sent data. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'



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

api_instance = TripletexRubyClient::PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.new

opts = { 
  id: 'id_example', # String | List of IDs
  order_out_id: 'order_out_id_example', # String | List of IDs
  voucher_id: 'voucher_id_example', # String | List of IDs
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find purchase order relation to voucher with sent data. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of IDs | [optional] 
 **order_out_id** | **String**| List of IDs | [optional] 
 **voucher_id** | **String**| List of IDs | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponsePurchaseOrderIncomingInvoiceRelation**](ListResponsePurchaseOrderIncomingInvoiceRelation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



