# TripletexRubyClient::ProjectparticipantApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_by_ids**](ProjectparticipantApi.md#delete_by_ids) | **DELETE** /project/participant/list | [BETA] Delete project participants.
[**get**](ProjectparticipantApi.md#get) | **GET** /project/participant/{id} | [BETA] Find project participant by ID.
[**post**](ProjectparticipantApi.md#post) | **POST** /project/participant | [BETA] Add new project participant.
[**post_list**](ProjectparticipantApi.md#post_list) | **POST** /project/participant/list | [BETA] Add new project participant. Multiple project participants can be sent in the same request.
[**put**](ProjectparticipantApi.md#put) | **PUT** /project/participant/{id} | [BETA] Update project participant.


# **delete_by_ids**
> delete_by_ids(ids)

[BETA] Delete project participants.



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

api_instance = TripletexRubyClient::ProjectparticipantApi.new

ids = 'ids_example' # String | ID of the elements


begin
  #[BETA] Delete project participants.
  api_instance.delete_by_ids(ids)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjectparticipantApi->delete_by_ids: #{e}"
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
> ResponseWrapperProjectParticipant get(id, opts)

[BETA] Find project participant by ID.



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

api_instance = TripletexRubyClient::ProjectparticipantApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find project participant by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjectparticipantApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperProjectParticipant**](ResponseWrapperProjectParticipant.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperProjectParticipant post(opts)

[BETA] Add new project participant.



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

api_instance = TripletexRubyClient::ProjectparticipantApi.new

opts = { 
  body: TripletexRubyClient::ProjectParticipant.new # ProjectParticipant | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Add new project participant.
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjectparticipantApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**ProjectParticipant**](ProjectParticipant.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperProjectParticipant**](ResponseWrapperProjectParticipant.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_list**
> ListResponseProjectParticipant post_list(opts)

[BETA] Add new project participant. Multiple project participants can be sent in the same request.



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

api_instance = TripletexRubyClient::ProjectparticipantApi.new

opts = { 
  body: [TripletexRubyClient::ProjectParticipant.new] # Array<ProjectParticipant> | JSON representing a list of new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Add new project participant. Multiple project participants can be sent in the same request.
  result = api_instance.post_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjectparticipantApi->post_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;ProjectParticipant&gt;**](ProjectParticipant.md)| JSON representing a list of new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ListResponseProjectParticipant**](ListResponseProjectParticipant.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperProjectParticipant put(id, opts)

[BETA] Update project participant.



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

api_instance = TripletexRubyClient::ProjectparticipantApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::ProjectParticipant.new # ProjectParticipant | Partial object describing what should be updated
}

begin
  #[BETA] Update project participant.
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjectparticipantApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**ProjectParticipant**](ProjectParticipant.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperProjectParticipant**](ResponseWrapperProjectParticipant.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



