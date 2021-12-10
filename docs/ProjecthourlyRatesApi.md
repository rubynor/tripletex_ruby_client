# TripletexRubyClient::ProjecthourlyRatesApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete**](ProjecthourlyRatesApi.md#delete) | **DELETE** /project/hourlyRates/{id} | Delete Project Hourly Rate 
[**delete_by_ids**](ProjecthourlyRatesApi.md#delete_by_ids) | **DELETE** /project/hourlyRates/list | Delete project hourly rates.
[**delete_by_project_ids**](ProjecthourlyRatesApi.md#delete_by_project_ids) | **DELETE** /project/hourlyRates/deleteByProjectIds | Delete project hourly rates by project id.
[**get**](ProjecthourlyRatesApi.md#get) | **GET** /project/hourlyRates/{id} | Find project hourly rate by ID.
[**post**](ProjecthourlyRatesApi.md#post) | **POST** /project/hourlyRates | Create a project hourly rate. 
[**post_list**](ProjecthourlyRatesApi.md#post_list) | **POST** /project/hourlyRates/list | Create multiple project hourly rates.
[**put**](ProjecthourlyRatesApi.md#put) | **PUT** /project/hourlyRates/{id} | Update a project hourly rate.
[**put_list**](ProjecthourlyRatesApi.md#put_list) | **PUT** /project/hourlyRates/list | Update multiple project hourly rates.
[**search**](ProjecthourlyRatesApi.md#search) | **GET** /project/hourlyRates | Find project hourly rates corresponding with sent data.
[**update_or_add_hour_rates**](ProjecthourlyRatesApi.md#update_or_add_hour_rates) | **PUT** /project/hourlyRates/updateOrAddHourRates | Update or add the same project hourly rate from project overview.


# **delete**
> delete(id)

Delete Project Hourly Rate 



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

api_instance = TripletexRubyClient::ProjecthourlyRatesApi.new

id = 56 # Integer | Element ID


begin
  #Delete Project Hourly Rate 
  api_instance.delete(id)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjecthourlyRatesApi->delete: #{e}"
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

Delete project hourly rates.



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

api_instance = TripletexRubyClient::ProjecthourlyRatesApi.new

ids = 'ids_example' # String | ID of the elements


begin
  #Delete project hourly rates.
  api_instance.delete_by_ids(ids)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjecthourlyRatesApi->delete_by_ids: #{e}"
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



# **delete_by_project_ids**
> ListResponseProject delete_by_project_ids(ids, date)

Delete project hourly rates by project id.



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

api_instance = TripletexRubyClient::ProjecthourlyRatesApi.new

ids = 'ids_example' # String | ID of the elements

date = 'date_example' # String | yyyy-MM-dd. Defaults to today.


begin
  #Delete project hourly rates by project id.
  result = api_instance.delete_by_project_ids(ids, date)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjecthourlyRatesApi->delete_by_project_ids: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ids** | **String**| ID of the elements | 
 **date** | **String**| yyyy-MM-dd. Defaults to today. | 

### Return type

[**ListResponseProject**](ListResponseProject.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get**
> ResponseWrapperProjectHourlyRate get(id, opts)

Find project hourly rate by ID.



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

api_instance = TripletexRubyClient::ProjecthourlyRatesApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find project hourly rate by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjecthourlyRatesApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperProjectHourlyRate**](ResponseWrapperProjectHourlyRate.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperProjectHourlyRate post(opts)

Create a project hourly rate. 



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

api_instance = TripletexRubyClient::ProjecthourlyRatesApi.new

opts = { 
  body: TripletexRubyClient::ProjectHourlyRate.new # ProjectHourlyRate | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #Create a project hourly rate. 
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjecthourlyRatesApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**ProjectHourlyRate**](ProjectHourlyRate.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperProjectHourlyRate**](ResponseWrapperProjectHourlyRate.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_list**
> ListResponseProjectHourlyRate post_list(opts)

Create multiple project hourly rates.



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

api_instance = TripletexRubyClient::ProjecthourlyRatesApi.new

opts = { 
  body: [TripletexRubyClient::ProjectHourlyRate.new] # Array<ProjectHourlyRate> | JSON representing a list of new object to be created. Should not have ID and version set.
}

begin
  #Create multiple project hourly rates.
  result = api_instance.post_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjecthourlyRatesApi->post_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;ProjectHourlyRate&gt;**](ProjectHourlyRate.md)| JSON representing a list of new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ListResponseProjectHourlyRate**](ListResponseProjectHourlyRate.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperProjectHourlyRate put(id, opts)

Update a project hourly rate.



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

api_instance = TripletexRubyClient::ProjecthourlyRatesApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::ProjectHourlyRate.new # ProjectHourlyRate | Partial object describing what should be updated
}

begin
  #Update a project hourly rate.
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjecthourlyRatesApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**ProjectHourlyRate**](ProjectHourlyRate.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperProjectHourlyRate**](ResponseWrapperProjectHourlyRate.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put_list**
> ListResponseProjectHourlyRate put_list(opts)

Update multiple project hourly rates.



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

api_instance = TripletexRubyClient::ProjecthourlyRatesApi.new

opts = { 
  body: [TripletexRubyClient::ProjectHourlyRate.new] # Array<ProjectHourlyRate> | JSON representing updates to object. Should have ID and version set.
}

begin
  #Update multiple project hourly rates.
  result = api_instance.put_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjecthourlyRatesApi->put_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;ProjectHourlyRate&gt;**](ProjectHourlyRate.md)| JSON representing updates to object. Should have ID and version set. | [optional] 

### Return type

[**ListResponseProjectHourlyRate**](ListResponseProjectHourlyRate.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseProjectHourlyRate search(opts)

Find project hourly rates corresponding with sent data.



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

api_instance = TripletexRubyClient::ProjecthourlyRatesApi.new

opts = { 
  id: 'id_example', # String | List of IDs
  project_id: 'project_id_example', # String | List of IDs
  type: 'type_example', # String | Equals
  start_date_from: 'start_date_from_example', # String | From and including
  start_date_to: 'start_date_to_example', # String | To and excluding
  show_in_project_order: true, # BOOLEAN | Equals
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find project hourly rates corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjecthourlyRatesApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of IDs | [optional] 
 **project_id** | **String**| List of IDs | [optional] 
 **type** | **String**| Equals | [optional] 
 **start_date_from** | **String**| From and including | [optional] 
 **start_date_to** | **String**| To and excluding | [optional] 
 **show_in_project_order** | **BOOLEAN**| Equals | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseProjectHourlyRate**](ListResponseProjectHourlyRate.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **update_or_add_hour_rates**
> ListResponseProjectHourlyRate update_or_add_hour_rates(ids, opts)

Update or add the same project hourly rate from project overview.



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

api_instance = TripletexRubyClient::ProjecthourlyRatesApi.new

ids = 'ids_example' # String | ID of the elements

opts = { 
  body: TripletexRubyClient::HourlyRate.new # HourlyRate | JSON representing updates to object. Should have ID and version set.
}

begin
  #Update or add the same project hourly rate from project overview.
  result = api_instance.update_or_add_hour_rates(ids, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjecthourlyRatesApi->update_or_add_hour_rates: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ids** | **String**| ID of the elements | 
 **body** | [**HourlyRate**](HourlyRate.md)| JSON representing updates to object. Should have ID and version set. | [optional] 

### Return type

[**ListResponseProjectHourlyRate**](ListResponseProjectHourlyRate.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



