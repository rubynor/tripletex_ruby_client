# TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete**](ProjecthourlyRatesprojectSpecificRatesApi.md#delete) | **DELETE** /project/hourlyRates/projectSpecificRates/{id} | Delete project specific rate 
[**delete_by_ids**](ProjecthourlyRatesprojectSpecificRatesApi.md#delete_by_ids) | **DELETE** /project/hourlyRates/projectSpecificRates/list | Delete project specific rates.
[**get**](ProjecthourlyRatesprojectSpecificRatesApi.md#get) | **GET** /project/hourlyRates/projectSpecificRates/{id} | Find project specific rate by ID.
[**post**](ProjecthourlyRatesprojectSpecificRatesApi.md#post) | **POST** /project/hourlyRates/projectSpecificRates | Create new project specific rate. 
[**post_list**](ProjecthourlyRatesprojectSpecificRatesApi.md#post_list) | **POST** /project/hourlyRates/projectSpecificRates/list | Create multiple new project specific rates.
[**put**](ProjecthourlyRatesprojectSpecificRatesApi.md#put) | **PUT** /project/hourlyRates/projectSpecificRates/{id} | Update a project specific rate.
[**put_list**](ProjecthourlyRatesprojectSpecificRatesApi.md#put_list) | **PUT** /project/hourlyRates/projectSpecificRates/list | Update multiple project specific rates.
[**search**](ProjecthourlyRatesprojectSpecificRatesApi.md#search) | **GET** /project/hourlyRates/projectSpecificRates | Find project specific rates corresponding with sent data.


# **delete**
> delete(id)

Delete project specific rate 



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

api_instance = TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi.new

id = 56 # Integer | Element ID


begin
  #Delete project specific rate 
  api_instance.delete(id)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjecthourlyRatesprojectSpecificRatesApi->delete: #{e}"
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

Delete project specific rates.



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

api_instance = TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi.new

ids = 'ids_example' # String | ID of the elements


begin
  #Delete project specific rates.
  api_instance.delete_by_ids(ids)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjecthourlyRatesprojectSpecificRatesApi->delete_by_ids: #{e}"
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
> ResponseWrapperProjectSpecificRate get(id, opts)

Find project specific rate by ID.



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

api_instance = TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find project specific rate by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjecthourlyRatesprojectSpecificRatesApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperProjectSpecificRate**](ResponseWrapperProjectSpecificRate.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperProjectSpecificRate post(opts)

Create new project specific rate. 



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

api_instance = TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi.new

opts = { 
  body: TripletexRubyClient::ProjectSpecificRate.new # ProjectSpecificRate | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #Create new project specific rate. 
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjecthourlyRatesprojectSpecificRatesApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**ProjectSpecificRate**](ProjectSpecificRate.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperProjectSpecificRate**](ResponseWrapperProjectSpecificRate.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_list**
> ListResponseProjectSpecificRate post_list(opts)

Create multiple new project specific rates.



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

api_instance = TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi.new

opts = { 
  body: [TripletexRubyClient::ProjectSpecificRate.new] # Array<ProjectSpecificRate> | JSON representing a list of new object to be created. Should not have ID and version set.
}

begin
  #Create multiple new project specific rates.
  result = api_instance.post_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjecthourlyRatesprojectSpecificRatesApi->post_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;ProjectSpecificRate&gt;**](ProjectSpecificRate.md)| JSON representing a list of new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ListResponseProjectSpecificRate**](ListResponseProjectSpecificRate.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperProjectSpecificRate put(id, opts)

Update a project specific rate.



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

api_instance = TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::ProjectSpecificRate.new # ProjectSpecificRate | Partial object describing what should be updated
}

begin
  #Update a project specific rate.
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjecthourlyRatesprojectSpecificRatesApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**ProjectSpecificRate**](ProjectSpecificRate.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperProjectSpecificRate**](ResponseWrapperProjectSpecificRate.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put_list**
> ListResponseProjectSpecificRate put_list(opts)

Update multiple project specific rates.



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

api_instance = TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi.new

opts = { 
  body: [TripletexRubyClient::ProjectSpecificRate.new] # Array<ProjectSpecificRate> | JSON representing updates to object. Should have ID and version set.
}

begin
  #Update multiple project specific rates.
  result = api_instance.put_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjecthourlyRatesprojectSpecificRatesApi->put_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;ProjectSpecificRate&gt;**](ProjectSpecificRate.md)| JSON representing updates to object. Should have ID and version set. | [optional] 

### Return type

[**ListResponseProjectSpecificRate**](ListResponseProjectSpecificRate.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseProjectSpecificRate search(opts)

Find project specific rates corresponding with sent data.



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

api_instance = TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi.new

opts = { 
  id: 'id_example', # String | List of IDs
  project_hourly_rate_id: 'project_hourly_rate_id_example', # String | List of IDs
  employee_id: 'employee_id_example', # String | List of IDs
  activity_id: 'activity_id_example', # String | List of IDs
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find project specific rates corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjecthourlyRatesprojectSpecificRatesApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of IDs | [optional] 
 **project_hourly_rate_id** | **String**| List of IDs | [optional] 
 **employee_id** | **String**| List of IDs | [optional] 
 **activity_id** | **String**| List of IDs | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseProjectSpecificRate**](ListResponseProjectSpecificRate.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



