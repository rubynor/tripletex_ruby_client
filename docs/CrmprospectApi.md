# TripletexRubyClient::CrmprospectApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](CrmprospectApi.md#get) | **GET** /crm/prospect/{id} | Get prospect by ID.
[**search**](CrmprospectApi.md#search) | **GET** /crm/prospect | Find prospects corresponding with sent data.


# **get**
> ResponseWrapperProspect get(id, opts)

Get prospect by ID.



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

api_instance = TripletexRubyClient::CrmprospectApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Get prospect by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling CrmprospectApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperProspect**](ResponseWrapperProspect.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **search**
> ListResponseProspect search(opts)

Find prospects corresponding with sent data.



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

api_instance = TripletexRubyClient::CrmprospectApi.new

opts = { 
  name: 'name_example', # String | Containing
  description: 'description_example', # String | Containing
  created_date_from: 'created_date_from_example', # String | From and including
  created_date_to: 'created_date_to_example', # String | To and excluding
  customer_id: 'customer_id_example', # String | Equals
  sales_employee_id: 'sales_employee_id_example', # String | Equals
  is_closed: true, # BOOLEAN | Equals
  closed_reason: 'closed_reason_example', # String | Equals
  closed_date_from: 'closed_date_from_example', # String | From and including
  closed_date_to: 'closed_date_to_example', # String | To and excluding
  competitor: 'competitor_example', # String | Containing
  prospect_type: 'prospect_type_example', # String | Equals
  project_id: 'project_id_example', # String | Equals
  project_offer_id: 'project_offer_id_example', # String | Equals
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find prospects corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling CrmprospectApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Containing | [optional] 
 **description** | **String**| Containing | [optional] 
 **created_date_from** | **String**| From and including | [optional] 
 **created_date_to** | **String**| To and excluding | [optional] 
 **customer_id** | **String**| Equals | [optional] 
 **sales_employee_id** | **String**| Equals | [optional] 
 **is_closed** | **BOOLEAN**| Equals | [optional] 
 **closed_reason** | **String**| Equals | [optional] 
 **closed_date_from** | **String**| From and including | [optional] 
 **closed_date_to** | **String**| To and excluding | [optional] 
 **competitor** | **String**| Containing | [optional] 
 **prospect_type** | **String**| Equals | [optional] 
 **project_id** | **String**| Equals | [optional] 
 **project_offer_id** | **String**| Equals | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseProspect**](ListResponseProspect.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



