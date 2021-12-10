# TripletexRubyClient::CustomercategoryApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](CustomercategoryApi.md#get) | **GET** /customer/category/{id} | Find customer/supplier category by ID.
[**post**](CustomercategoryApi.md#post) | **POST** /customer/category | Add new customer/supplier category.
[**put**](CustomercategoryApi.md#put) | **PUT** /customer/category/{id} | Update customer/supplier category.
[**search**](CustomercategoryApi.md#search) | **GET** /customer/category | Find customer/supplier categories corresponding with sent data.


# **get**
> ResponseWrapperCustomerCategory get(id, opts)

Find customer/supplier category by ID.



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

api_instance = TripletexRubyClient::CustomercategoryApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find customer/supplier category by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling CustomercategoryApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperCustomerCategory**](ResponseWrapperCustomerCategory.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperCustomerCategory post(opts)

Add new customer/supplier category.



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

api_instance = TripletexRubyClient::CustomercategoryApi.new

opts = { 
  body: TripletexRubyClient::CustomerCategory.new # CustomerCategory | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #Add new customer/supplier category.
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling CustomercategoryApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CustomerCategory**](CustomerCategory.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperCustomerCategory**](ResponseWrapperCustomerCategory.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperCustomerCategory put(id, opts)

Update customer/supplier category.



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

api_instance = TripletexRubyClient::CustomercategoryApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::CustomerCategory.new # CustomerCategory | Partial object describing what should be updated
}

begin
  #Update customer/supplier category.
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling CustomercategoryApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**CustomerCategory**](CustomerCategory.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperCustomerCategory**](ResponseWrapperCustomerCategory.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseCustomerCategory search(opts)

Find customer/supplier categories corresponding with sent data.



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

api_instance = TripletexRubyClient::CustomercategoryApi.new

opts = { 
  id: 'id_example', # String | List of IDs
  name: 'name_example', # String | Containing
  number: 'number_example', # String | Equals
  description: 'description_example', # String | Containing
  type: 'type_example', # String | List of IDs
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find customer/supplier categories corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling CustomercategoryApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of IDs | [optional] 
 **name** | **String**| Containing | [optional] 
 **number** | **String**| Equals | [optional] 
 **description** | **String**| Containing | [optional] 
 **type** | **String**| List of IDs | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseCustomerCategory**](ListResponseCustomerCategory.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



