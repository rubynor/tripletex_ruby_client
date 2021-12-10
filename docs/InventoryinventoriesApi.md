# TripletexRubyClient::InventoryinventoriesApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**search**](InventoryinventoriesApi.md#search) | **GET** /inventory/inventories | [BETA] Find inventories corresponding with sent data.


# **search**
> ListResponseInventories search(date_from, date_to, opts)

[BETA] Find inventories corresponding with sent data.



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

api_instance = TripletexRubyClient::InventoryinventoriesApi.new

date_from = 'date_from_example' # String | Format is yyyy-MM-dd (from and incl.).

date_to = 'date_to_example' # String | Format is yyyy-MM-dd (to and incl.).

opts = { 
  product_id: 56, # Integer | Element ID
  inventory_id: 56, # Integer | Element ID
  only_product_with_changed_status: false, # BOOLEAN | 
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find inventories corresponding with sent data.
  result = api_instance.search(date_from, date_to, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling InventoryinventoriesApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **date_from** | **String**| Format is yyyy-MM-dd (from and incl.). | 
 **date_to** | **String**| Format is yyyy-MM-dd (to and incl.). | 
 **product_id** | **Integer**| Element ID | [optional] 
 **inventory_id** | **Integer**| Element ID | [optional] 
 **only_product_with_changed_status** | **BOOLEAN**|  | [optional] [default to false]
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseInventories**](ListResponseInventories.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



