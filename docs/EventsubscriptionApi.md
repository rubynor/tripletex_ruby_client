# TripletexRubyClient::EventsubscriptionApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete**](EventsubscriptionApi.md#delete) | **DELETE** /event/subscription/{id} | [BETA] Delete the given subscription.
[**delete_by_ids**](EventsubscriptionApi.md#delete_by_ids) | **DELETE** /event/subscription/list | [BETA] Delete multiple subscriptions.
[**get**](EventsubscriptionApi.md#get) | **GET** /event/subscription/{id} | [BETA] Get subscription by ID.
[**post**](EventsubscriptionApi.md#post) | **POST** /event/subscription | [BETA] Create a new subscription for current EmployeeToken.
[**post_list**](EventsubscriptionApi.md#post_list) | **POST** /event/subscription/list | [BETA] Create multiple subscriptions for current EmployeeToken.
[**put**](EventsubscriptionApi.md#put) | **PUT** /event/subscription/{id} | [BETA] Change a current subscription, based on id.
[**put_list**](EventsubscriptionApi.md#put_list) | **PUT** /event/subscription/list | [BETA] Update multiple subscription.
[**search**](EventsubscriptionApi.md#search) | **GET** /event/subscription | [BETA] Find all ongoing subscriptions.


# **delete**
> delete(id)

[BETA] Delete the given subscription.



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

api_instance = TripletexRubyClient::EventsubscriptionApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Delete the given subscription.
  api_instance.delete(id)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EventsubscriptionApi->delete: #{e}"
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

[BETA] Delete multiple subscriptions.



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

api_instance = TripletexRubyClient::EventsubscriptionApi.new

ids = 'ids_example' # String | ID of the elements


begin
  #[BETA] Delete multiple subscriptions.
  api_instance.delete_by_ids(ids)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EventsubscriptionApi->delete_by_ids: #{e}"
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
> ResponseWrapperSubscription get(id, opts)

[BETA] Get subscription by ID.



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

api_instance = TripletexRubyClient::EventsubscriptionApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Get subscription by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EventsubscriptionApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperSubscription**](ResponseWrapperSubscription.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperSubscription post(opts)

[BETA] Create a new subscription for current EmployeeToken.



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

api_instance = TripletexRubyClient::EventsubscriptionApi.new

opts = { 
  body: TripletexRubyClient::Subscription.new # Subscription | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create a new subscription for current EmployeeToken.
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EventsubscriptionApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Subscription**](Subscription.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperSubscription**](ResponseWrapperSubscription.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_list**
> ListResponseSubscription post_list(opts)

[BETA] Create multiple subscriptions for current EmployeeToken.



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

api_instance = TripletexRubyClient::EventsubscriptionApi.new

opts = { 
  body: [TripletexRubyClient::Subscription.new] # Array<Subscription> | JSON representing a list of new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create multiple subscriptions for current EmployeeToken.
  result = api_instance.post_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EventsubscriptionApi->post_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;Subscription&gt;**](Subscription.md)| JSON representing a list of new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ListResponseSubscription**](ListResponseSubscription.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperSubscription put(id, opts)

[BETA] Change a current subscription, based on id.



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

api_instance = TripletexRubyClient::EventsubscriptionApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::Subscription.new # Subscription | Partial object describing what should be updated
}

begin
  #[BETA] Change a current subscription, based on id.
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EventsubscriptionApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**Subscription**](Subscription.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperSubscription**](ResponseWrapperSubscription.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **put_list**
> ListResponseSubscription put_list(opts)

[BETA] Update multiple subscription.



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

api_instance = TripletexRubyClient::EventsubscriptionApi.new

opts = { 
  body: [TripletexRubyClient::Subscription.new] # Array<Subscription> | JSON representing updates to object. Should have ID and version set.
}

begin
  #[BETA] Update multiple subscription.
  result = api_instance.put_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EventsubscriptionApi->put_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;Subscription&gt;**](Subscription.md)| JSON representing updates to object. Should have ID and version set. | [optional] 

### Return type

[**ListResponseSubscription**](ListResponseSubscription.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseSubscription search(opts)

[BETA] Find all ongoing subscriptions.



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

api_instance = TripletexRubyClient::EventsubscriptionApi.new

opts = { 
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find all ongoing subscriptions.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling EventsubscriptionApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseSubscription**](ListResponseSubscription.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



