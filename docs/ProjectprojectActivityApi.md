# TripletexRubyClient::ProjectprojectActivityApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete**](ProjectprojectActivityApi.md#delete) | **DELETE** /project/projectActivity/{id} | Delete project activity
[**delete_by_ids**](ProjectprojectActivityApi.md#delete_by_ids) | **DELETE** /project/projectActivity/list | Delete project activities
[**get**](ProjectprojectActivityApi.md#get) | **GET** /project/projectActivity/{id} | Find project activity by id
[**post**](ProjectprojectActivityApi.md#post) | **POST** /project/projectActivity | Add project activity.


# **delete**
> delete(id)

Delete project activity



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

api_instance = TripletexRubyClient::ProjectprojectActivityApi.new

id = 56 # Integer | Element ID


begin
  #Delete project activity
  api_instance.delete(id)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjectprojectActivityApi->delete: #{e}"
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

Delete project activities



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

api_instance = TripletexRubyClient::ProjectprojectActivityApi.new

ids = 'ids_example' # String | ID of the elements


begin
  #Delete project activities
  api_instance.delete_by_ids(ids)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjectprojectActivityApi->delete_by_ids: #{e}"
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
> ResponseWrapperProjectActivity get(id, opts)

Find project activity by id



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

api_instance = TripletexRubyClient::ProjectprojectActivityApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find project activity by id
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjectprojectActivityApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperProjectActivity**](ResponseWrapperProjectActivity.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperProjectActivity post(opts)

Add project activity.



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

api_instance = TripletexRubyClient::ProjectprojectActivityApi.new

opts = { 
  body: TripletexRubyClient::ProjectActivity.new # ProjectActivity | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #Add project activity.
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjectprojectActivityApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**ProjectActivity**](ProjectActivity.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperProjectActivity**](ResponseWrapperProjectActivity.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



