# TripletexRubyClient::TimesheettimeClockApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](TimesheettimeClockApi.md#get) | **GET** /timesheet/timeClock/{id} | Find time clock entry by ID.
[**get_present**](TimesheettimeClockApi.md#get_present) | **GET** /timesheet/timeClock/present | Find a user’s present running time clock.
[**put**](TimesheettimeClockApi.md#put) | **PUT** /timesheet/timeClock/{id} | Update time clock by ID.
[**search**](TimesheettimeClockApi.md#search) | **GET** /timesheet/timeClock | Find time clock entries corresponding with sent data.
[**start**](TimesheettimeClockApi.md#start) | **PUT** /timesheet/timeClock/:start | Start time clock.
[**stop**](TimesheettimeClockApi.md#stop) | **PUT** /timesheet/timeClock/{id}/:stop | Stop time clock.


# **get**
> ResponseWrapperTimeClock get(id, opts)

Find time clock entry by ID.



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

api_instance = TripletexRubyClient::TimesheettimeClockApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find time clock entry by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TimesheettimeClockApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperTimeClock**](ResponseWrapperTimeClock.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get_present**
> ResponseWrapperTimeClock get_present(opts)

Find a user’s present running time clock.



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

api_instance = TripletexRubyClient::TimesheettimeClockApi.new

opts = { 
  employee_id: 56, # Integer | Employee ID. Defaults to ID of token owner.
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find a user’s present running time clock.
  result = api_instance.get_present(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TimesheettimeClockApi->get_present: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **employee_id** | **Integer**| Employee ID. Defaults to ID of token owner. | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperTimeClock**](ResponseWrapperTimeClock.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **put**
> ResponseWrapperTimeClock put(id, opts)

Update time clock by ID.



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

api_instance = TripletexRubyClient::TimesheettimeClockApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::TimeClock.new # TimeClock | Partial object describing what should be updated
}

begin
  #Update time clock by ID.
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TimesheettimeClockApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**TimeClock**](TimeClock.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperTimeClock**](ResponseWrapperTimeClock.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseTimeClock search(opts)

Find time clock entries corresponding with sent data.



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

api_instance = TripletexRubyClient::TimesheettimeClockApi.new

opts = { 
  id: 'id_example', # String | List of IDs
  employee_id: 'employee_id_example', # String | List of IDs
  project_id: 'project_id_example', # String | List of IDs
  activity_id: 'activity_id_example', # String | List of IDs
  date_from: 'date_from_example', # String | From and including
  date_to: 'date_to_example', # String | To and excluding
  hour_id: 'hour_id_example', # String | List of IDs
  is_running: true, # BOOLEAN | Equals
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find time clock entries corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TimesheettimeClockApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of IDs | [optional] 
 **employee_id** | **String**| List of IDs | [optional] 
 **project_id** | **String**| List of IDs | [optional] 
 **activity_id** | **String**| List of IDs | [optional] 
 **date_from** | **String**| From and including | [optional] 
 **date_to** | **String**| To and excluding | [optional] 
 **hour_id** | **String**| List of IDs | [optional] 
 **is_running** | **BOOLEAN**| Equals | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseTimeClock**](ListResponseTimeClock.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **start**
> ResponseWrapperTimeClock start(activity_id, opts)

Start time clock.



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

api_instance = TripletexRubyClient::TimesheettimeClockApi.new

activity_id = 56 # Integer | Activity ID

opts = { 
  employee_id: 56, # Integer | Employee ID. Defaults to ID of token owner.
  project_id: 0, # Integer | Project ID
  date: 'date_example' # String | Optional. Default is today’s date
}

begin
  #Start time clock.
  result = api_instance.start(activity_id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TimesheettimeClockApi->start: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **activity_id** | **Integer**| Activity ID | 
 **employee_id** | **Integer**| Employee ID. Defaults to ID of token owner. | [optional] 
 **project_id** | **Integer**| Project ID | [optional] [default to 0]
 **date** | **String**| Optional. Default is today’s date | [optional] 

### Return type

[**ResponseWrapperTimeClock**](ResponseWrapperTimeClock.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **stop**
> stop(id, opts)

Stop time clock.



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

api_instance = TripletexRubyClient::TimesheettimeClockApi.new

id = 56 # Integer | Element ID

opts = { 
  version: 0 # Integer | Number of current version
}

begin
  #Stop time clock.
  api_instance.stop(id, opts)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TimesheettimeClockApi->stop: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **version** | **Integer**| Number of current version | [optional] [default to 0]

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



