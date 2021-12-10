# TripletexRubyClient::LedgerpaymentTypeOutApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete**](LedgerpaymentTypeOutApi.md#delete) | **DELETE** /ledger/paymentTypeOut/{id} | [BETA] Delete payment type for outgoing payments by ID.
[**get**](LedgerpaymentTypeOutApi.md#get) | **GET** /ledger/paymentTypeOut/{id} | [BETA] Get payment type for outgoing payments by ID.
[**post**](LedgerpaymentTypeOutApi.md#post) | **POST** /ledger/paymentTypeOut | [BETA] Create new payment type for outgoing payments
[**post_list**](LedgerpaymentTypeOutApi.md#post_list) | **POST** /ledger/paymentTypeOut/list | [BETA] Create multiple payment types for outgoing payments at once
[**put**](LedgerpaymentTypeOutApi.md#put) | **PUT** /ledger/paymentTypeOut/{id} | [BETA] Update existing payment type for outgoing payments
[**put_list**](LedgerpaymentTypeOutApi.md#put_list) | **PUT** /ledger/paymentTypeOut/list | [BETA] Update multiple payment types for outgoing payments at once
[**search**](LedgerpaymentTypeOutApi.md#search) | **GET** /ledger/paymentTypeOut | [BETA] Gets payment types for outgoing payments


# **delete**
> delete(id)

[BETA] Delete payment type for outgoing payments by ID.



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

api_instance = TripletexRubyClient::LedgerpaymentTypeOutApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Delete payment type for outgoing payments by ID.
  api_instance.delete(id)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling LedgerpaymentTypeOutApi->delete: #{e}"
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
> ResponseWrapperPaymentTypeOut get(id, opts)

[BETA] Get payment type for outgoing payments by ID.



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

api_instance = TripletexRubyClient::LedgerpaymentTypeOutApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Get payment type for outgoing payments by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling LedgerpaymentTypeOutApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperPaymentTypeOut**](ResponseWrapperPaymentTypeOut.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperPaymentTypeOut post(opts)

[BETA] Create new payment type for outgoing payments



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

api_instance = TripletexRubyClient::LedgerpaymentTypeOutApi.new

opts = { 
  body: TripletexRubyClient::PaymentTypeOut.new # PaymentTypeOut | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create new payment type for outgoing payments
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling LedgerpaymentTypeOutApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**PaymentTypeOut**](PaymentTypeOut.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperPaymentTypeOut**](ResponseWrapperPaymentTypeOut.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_list**
> ListResponsePaymentTypeOut post_list(opts)

[BETA] Create multiple payment types for outgoing payments at once



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

api_instance = TripletexRubyClient::LedgerpaymentTypeOutApi.new

opts = { 
  body: [TripletexRubyClient::PaymentTypeOut.new] # Array<PaymentTypeOut> | JSON representing a list of new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create multiple payment types for outgoing payments at once
  result = api_instance.post_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling LedgerpaymentTypeOutApi->post_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;PaymentTypeOut&gt;**](PaymentTypeOut.md)| JSON representing a list of new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ListResponsePaymentTypeOut**](ListResponsePaymentTypeOut.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperPaymentTypeOut put(id, opts)

[BETA] Update existing payment type for outgoing payments



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

api_instance = TripletexRubyClient::LedgerpaymentTypeOutApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::PaymentTypeOut.new # PaymentTypeOut | Partial object describing what should be updated
}

begin
  #[BETA] Update existing payment type for outgoing payments
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling LedgerpaymentTypeOutApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**PaymentTypeOut**](PaymentTypeOut.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperPaymentTypeOut**](ResponseWrapperPaymentTypeOut.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put_list**
> ListResponsePaymentTypeOut put_list(opts)

[BETA] Update multiple payment types for outgoing payments at once



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

api_instance = TripletexRubyClient::LedgerpaymentTypeOutApi.new

opts = { 
  body: [TripletexRubyClient::PaymentTypeOut.new] # Array<PaymentTypeOut> | JSON representing updates to object. Should have ID and version set.
}

begin
  #[BETA] Update multiple payment types for outgoing payments at once
  result = api_instance.put_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling LedgerpaymentTypeOutApi->put_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;PaymentTypeOut&gt;**](PaymentTypeOut.md)| JSON representing updates to object. Should have ID and version set. | [optional] 

### Return type

[**ListResponsePaymentTypeOut**](ListResponsePaymentTypeOut.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponsePaymentTypeOut search(opts)

[BETA] Gets payment types for outgoing payments

This is an API endpoint for getting payment types for outgoing payments. This is equivalent to the section 'Outgoing Payments' under Accounts Settings in Tripletex. These are the payment types listed in supplier invoices, vat returns, salary payments and Tax/ENI

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

api_instance = TripletexRubyClient::LedgerpaymentTypeOutApi.new

opts = { 
  id: 'id_example', # String | List of IDs
  description: 'description_example', # String | Containing
  is_inactive: true, # BOOLEAN | Equals
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Gets payment types for outgoing payments
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling LedgerpaymentTypeOutApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of IDs | [optional] 
 **description** | **String**| Containing | [optional] 
 **is_inactive** | **BOOLEAN**| Equals | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponsePaymentTypeOut**](ListResponsePaymentTypeOut.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



