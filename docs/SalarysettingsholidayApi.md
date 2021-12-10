# TripletexRubyClient::SalarysettingsholidayApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_by_ids**](SalarysettingsholidayApi.md#delete_by_ids) | **DELETE** /salary/settings/holiday/list | [BETA] delete multiple holiday settings of current logged in company.
[**post**](SalarysettingsholidayApi.md#post) | **POST** /salary/settings/holiday | [BETA] Create a holiday setting of current logged in company.
[**post_list**](SalarysettingsholidayApi.md#post_list) | **POST** /salary/settings/holiday/list | [BETA] Create multiple holiday settings of current logged in company.
[**put**](SalarysettingsholidayApi.md#put) | **PUT** /salary/settings/holiday/{id} | [BETA] update a holiday setting of current logged in company.
[**put_list**](SalarysettingsholidayApi.md#put_list) | **PUT** /salary/settings/holiday/list | [BETA] update multiple holiday settings of current logged in company.
[**search**](SalarysettingsholidayApi.md#search) | **GET** /salary/settings/holiday | [BETA] Find holiday settings of current logged in company.


# **delete_by_ids**
> delete_by_ids(ids)

[BETA] delete multiple holiday settings of current logged in company.



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

api_instance = TripletexRubyClient::SalarysettingsholidayApi.new

ids = 'ids_example' # String | ID of the elements


begin
  #[BETA] delete multiple holiday settings of current logged in company.
  api_instance.delete_by_ids(ids)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SalarysettingsholidayApi->delete_by_ids: #{e}"
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



# **post**
> ResponseWrapperCompanyHoliday post(opts)

[BETA] Create a holiday setting of current logged in company.



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

api_instance = TripletexRubyClient::SalarysettingsholidayApi.new

opts = { 
  body: TripletexRubyClient::CompanyHoliday.new # CompanyHoliday | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create a holiday setting of current logged in company.
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SalarysettingsholidayApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CompanyHoliday**](CompanyHoliday.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperCompanyHoliday**](ResponseWrapperCompanyHoliday.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_list**
> ListResponseCompanyHoliday post_list(opts)

[BETA] Create multiple holiday settings of current logged in company.



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

api_instance = TripletexRubyClient::SalarysettingsholidayApi.new

opts = { 
  body: [TripletexRubyClient::CompanyHoliday.new] # Array<CompanyHoliday> | JSON representing a list of new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create multiple holiday settings of current logged in company.
  result = api_instance.post_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SalarysettingsholidayApi->post_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;CompanyHoliday&gt;**](CompanyHoliday.md)| JSON representing a list of new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ListResponseCompanyHoliday**](ListResponseCompanyHoliday.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperCompanyHoliday put(id, opts)

[BETA] update a holiday setting of current logged in company.



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

api_instance = TripletexRubyClient::SalarysettingsholidayApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::CompanyHoliday.new # CompanyHoliday | Partial object describing what should be updated
}

begin
  #[BETA] update a holiday setting of current logged in company.
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SalarysettingsholidayApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**CompanyHoliday**](CompanyHoliday.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperCompanyHoliday**](ResponseWrapperCompanyHoliday.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put_list**
> ListResponseCompanyHoliday put_list(opts)

[BETA] update multiple holiday settings of current logged in company.



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

api_instance = TripletexRubyClient::SalarysettingsholidayApi.new

opts = { 
  body: [TripletexRubyClient::CompanyHoliday.new] # Array<CompanyHoliday> | JSON representing updates to object. Should have ID and version set.
}

begin
  #[BETA] update multiple holiday settings of current logged in company.
  result = api_instance.put_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SalarysettingsholidayApi->put_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;CompanyHoliday&gt;**](CompanyHoliday.md)| JSON representing updates to object. Should have ID and version set. | [optional] 

### Return type

[**ListResponseCompanyHoliday**](ListResponseCompanyHoliday.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseCompanyHoliday search(opts)

[BETA] Find holiday settings of current logged in company.



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

api_instance = TripletexRubyClient::SalarysettingsholidayApi.new

opts = { 
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find holiday settings of current logged in company.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SalarysettingsholidayApi->search: #{e}"
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

[**ListResponseCompanyHoliday**](ListResponseCompanyHoliday.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



