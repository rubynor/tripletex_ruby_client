# TripletexRubyClient::ProjectorderlineApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete**](ProjectorderlineApi.md#delete) | **DELETE** /project/orderline/{id} | Delete order line by ID.
[**get**](ProjectorderlineApi.md#get) | **GET** /project/orderline/{id} | [BETA] Get order line by ID.
[**post**](ProjectorderlineApi.md#post) | **POST** /project/orderline | [BETA] Create order line. When creating several order lines, use /list for better performance.
[**post_list**](ProjectorderlineApi.md#post_list) | **POST** /project/orderline/list | [BETA] Create multiple order lines.
[**put**](ProjectorderlineApi.md#put) | **PUT** /project/orderline/{id} | [BETA] Update project orderline.
[**search**](ProjectorderlineApi.md#search) | **GET** /project/orderline | [BETA] Find all order lines for project.


# **delete**
> delete(id)

Delete order line by ID.



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

api_instance = TripletexRubyClient::ProjectorderlineApi.new

id = 56 # Integer | Element ID


begin
  #Delete order line by ID.
  api_instance.delete(id)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjectorderlineApi->delete: #{e}"
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
> ResponseWrapperProjectOrderLine get(id, opts)

[BETA] Get order line by ID.



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

api_instance = TripletexRubyClient::ProjectorderlineApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Get order line by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjectorderlineApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperProjectOrderLine**](ResponseWrapperProjectOrderLine.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperProjectOrderLine post(opts)

[BETA] Create order line. When creating several order lines, use /list for better performance.



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

api_instance = TripletexRubyClient::ProjectorderlineApi.new

opts = { 
  body: TripletexRubyClient::ProjectOrderLine.new # ProjectOrderLine | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create order line. When creating several order lines, use /list for better performance.
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjectorderlineApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**ProjectOrderLine**](ProjectOrderLine.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperProjectOrderLine**](ResponseWrapperProjectOrderLine.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_list**
> ListResponseProjectOrderLine post_list(opts)

[BETA] Create multiple order lines.



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

api_instance = TripletexRubyClient::ProjectorderlineApi.new

opts = { 
  body: [TripletexRubyClient::ProjectOrderLine.new] # Array<ProjectOrderLine> | JSON representing a list of new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create multiple order lines.
  result = api_instance.post_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjectorderlineApi->post_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;ProjectOrderLine&gt;**](ProjectOrderLine.md)| JSON representing a list of new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ListResponseProjectOrderLine**](ListResponseProjectOrderLine.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperProjectOrderLine put(id, opts)

[BETA] Update project orderline.



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

api_instance = TripletexRubyClient::ProjectorderlineApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::ProjectOrderLine.new # ProjectOrderLine | Partial object describing what should be updated
}

begin
  #[BETA] Update project orderline.
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjectorderlineApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**ProjectOrderLine**](ProjectOrderLine.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperProjectOrderLine**](ResponseWrapperProjectOrderLine.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseProjectOrderLine search(project_id, opts)

[BETA] Find all order lines for project.



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

api_instance = TripletexRubyClient::ProjectorderlineApi.new

project_id = 56 # Integer | Equals

opts = { 
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find all order lines for project.
  result = api_instance.search(project_id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjectorderlineApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **project_id** | **Integer**| Equals | 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseProjectOrderLine**](ListResponseProjectOrderLine.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



