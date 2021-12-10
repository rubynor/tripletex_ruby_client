# TripletexRubyClient::ProductunitmasterApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](ProductunitmasterApi.md#get) | **GET** /product/unit/master/{id} | [BETA] Get product unit master by ID.
[**search**](ProductunitmasterApi.md#search) | **GET** /product/unit/master | [BETA] Find product units master corresponding with sent data.


# **get**
> ResponseWrapperProductUnitMaster get(id, opts)

[BETA] Get product unit master by ID.



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

api_instance = TripletexRubyClient::ProductunitmasterApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Get product unit master by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProductunitmasterApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperProductUnitMaster**](ResponseWrapperProductUnitMaster.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **search**
> ListResponseProductUnitMaster search(opts)

[BETA] Find product units master corresponding with sent data.



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

api_instance = TripletexRubyClient::ProductunitmasterApi.new

opts = { 
  id: 'id_example', # String | List of IDs
  name: 'name_example', # String | Names
  name_short: 'name_short_example', # String | Short names
  common_code: 'common_code_example', # String | Common codes
  peppol_name: 'peppol_name_example', # String | Peppol names
  peppol_symbol: 'peppol_symbol_example', # String | Peppol symbols
  is_inactive: true, # BOOLEAN | Inactive units
  count: 2100, # Integer | Number of elements to return
  from: 0, # Integer | From index
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find product units master corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProductunitmasterApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of IDs | [optional] 
 **name** | **String**| Names | [optional] 
 **name_short** | **String**| Short names | [optional] 
 **common_code** | **String**| Common codes | [optional] 
 **peppol_name** | **String**| Peppol names | [optional] 
 **peppol_symbol** | **String**| Peppol symbols | [optional] 
 **is_inactive** | **BOOLEAN**| Inactive units | [optional] 
 **count** | **Integer**| Number of elements to return | [optional] [default to 2100]
 **from** | **Integer**| From index | [optional] [default to 0]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseProductUnitMaster**](ListResponseProductUnitMaster.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



