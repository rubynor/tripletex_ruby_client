# TripletexRubyClient::SupplierApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete**](SupplierApi.md#delete) | **DELETE** /supplier/{id} | [BETA] Delete supplier by ID
[**get**](SupplierApi.md#get) | **GET** /supplier/{id} | Get supplier by ID.
[**post**](SupplierApi.md#post) | **POST** /supplier | Create supplier. Related supplier addresses may also be created.
[**post_list**](SupplierApi.md#post_list) | **POST** /supplier/list | [BETA] Create multiple suppliers. Related supplier addresses may also be created.
[**put**](SupplierApi.md#put) | **PUT** /supplier/{id} | Update supplier. 
[**put_list**](SupplierApi.md#put_list) | **PUT** /supplier/list | [BETA] Update multiple suppliers. Addresses can also be updated.
[**search**](SupplierApi.md#search) | **GET** /supplier | Find suppliers corresponding with sent data.


# **delete**
> delete(id)

[BETA] Delete supplier by ID



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

api_instance = TripletexRubyClient::SupplierApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Delete supplier by ID
  api_instance.delete(id)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierApi->delete: #{e}"
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
> ResponseWrapperSupplier get(id, opts)

Get supplier by ID.



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

api_instance = TripletexRubyClient::SupplierApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Get supplier by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperSupplier**](ResponseWrapperSupplier.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperSupplier post(opts)

Create supplier. Related supplier addresses may also be created.



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

api_instance = TripletexRubyClient::SupplierApi.new

opts = { 
  body: TripletexRubyClient::Supplier.new # Supplier | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #Create supplier. Related supplier addresses may also be created.
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Supplier**](Supplier.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperSupplier**](ResponseWrapperSupplier.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_list**
> ListResponseSupplier post_list(opts)

[BETA] Create multiple suppliers. Related supplier addresses may also be created.



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

api_instance = TripletexRubyClient::SupplierApi.new

opts = { 
  body: [TripletexRubyClient::Supplier.new] # Array<Supplier> | JSON representing a list of new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create multiple suppliers. Related supplier addresses may also be created.
  result = api_instance.post_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierApi->post_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;Supplier&gt;**](Supplier.md)| JSON representing a list of new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ListResponseSupplier**](ListResponseSupplier.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperSupplier put(id, opts)

Update supplier. 



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

api_instance = TripletexRubyClient::SupplierApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::Supplier.new # Supplier | Partial object describing what should be updated
}

begin
  #Update supplier. 
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**Supplier**](Supplier.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperSupplier**](ResponseWrapperSupplier.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put_list**
> ListResponseSupplier put_list(opts)

[BETA] Update multiple suppliers. Addresses can also be updated.



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

api_instance = TripletexRubyClient::SupplierApi.new

opts = { 
  body: [TripletexRubyClient::Supplier.new] # Array<Supplier> | JSON representing updates to object. Should have ID and version set.
}

begin
  #[BETA] Update multiple suppliers. Addresses can also be updated.
  result = api_instance.put_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierApi->put_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;Supplier&gt;**](Supplier.md)| JSON representing updates to object. Should have ID and version set. | [optional] 

### Return type

[**ListResponseSupplier**](ListResponseSupplier.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseSupplier search(opts)

Find suppliers corresponding with sent data.



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

api_instance = TripletexRubyClient::SupplierApi.new

opts = { 
  id: 'id_example', # String | List of IDs
  supplier_number: 'supplier_number_example', # String | List of IDs
  organization_number: 'organization_number_example', # String | Equals
  email: 'email_example', # String | Equals
  invoice_email: 'invoice_email_example', # String | Equals
  is_inactive: false, # BOOLEAN | Equals
  account_manager_id: 'account_manager_id_example', # String | List of IDs
  changed_since: 'changed_since_example', # String | Only return elements that have changed since this date and time
  is_wholesaler: true, # BOOLEAN | Equals
  show_products: true, # BOOLEAN | Equals
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find suppliers corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of IDs | [optional] 
 **supplier_number** | **String**| List of IDs | [optional] 
 **organization_number** | **String**| Equals | [optional] 
 **email** | **String**| Equals | [optional] 
 **invoice_email** | **String**| Equals | [optional] 
 **is_inactive** | **BOOLEAN**| Equals | [optional] [default to false]
 **account_manager_id** | **String**| List of IDs | [optional] 
 **changed_since** | **String**| Only return elements that have changed since this date and time | [optional] 
 **is_wholesaler** | **BOOLEAN**| Equals | [optional] 
 **show_products** | **BOOLEAN**| Equals | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseSupplier**](ListResponseSupplier.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



