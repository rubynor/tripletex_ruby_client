# TripletexRubyClient::TravelExpenseApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**approve**](TravelExpenseApi.md#approve) | **PUT** /travelExpense/:approve | [BETA] Approve travel expenses.
[**copy**](TravelExpenseApi.md#copy) | **PUT** /travelExpense/:copy | [BETA] Copy travel expense.
[**create_vouchers**](TravelExpenseApi.md#create_vouchers) | **PUT** /travelExpense/:createVouchers | [BETA] Create vouchers
[**delete**](TravelExpenseApi.md#delete) | **DELETE** /travelExpense/{id} | [BETA] Delete travel expense.
[**delete_attachment**](TravelExpenseApi.md#delete_attachment) | **DELETE** /travelExpense/{travelExpenseId}/attachment | [BETA] Delete attachment.
[**deliver**](TravelExpenseApi.md#deliver) | **PUT** /travelExpense/:deliver | [BETA] Deliver travel expenses.
[**download_attachment**](TravelExpenseApi.md#download_attachment) | **GET** /travelExpense/{travelExpenseId}/attachment | Get attachment by travel expense ID.
[**get**](TravelExpenseApi.md#get) | **GET** /travelExpense/{id} | [BETA] Get travel expense by ID.
[**post**](TravelExpenseApi.md#post) | **POST** /travelExpense | [BETA] Create travel expense.
[**put**](TravelExpenseApi.md#put) | **PUT** /travelExpense/{id} | [BETA] Update travel expense.
[**search**](TravelExpenseApi.md#search) | **GET** /travelExpense | [BETA] Find travel expenses corresponding with sent data.
[**unapprove**](TravelExpenseApi.md#unapprove) | **PUT** /travelExpense/:unapprove | [BETA] Unapprove travel expenses.
[**undeliver**](TravelExpenseApi.md#undeliver) | **PUT** /travelExpense/:undeliver | [BETA] Undeliver travel expenses.
[**upload_attachment**](TravelExpenseApi.md#upload_attachment) | **POST** /travelExpense/{travelExpenseId}/attachment | Upload attachment to travel expense.
[**upload_attachments**](TravelExpenseApi.md#upload_attachments) | **POST** /travelExpense/{travelExpenseId}/attachment/list | Upload multiple attachments to travel expense.


# **approve**
> ListResponseTravelExpense approve(opts)

[BETA] Approve travel expenses.



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

api_instance = TripletexRubyClient::TravelExpenseApi.new

opts = { 
  id: 'id_example' # String | ID of the elements
}

begin
  #[BETA] Approve travel expenses.
  result = api_instance.approve(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseApi->approve: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the elements | [optional] 

### Return type

[**ListResponseTravelExpense**](ListResponseTravelExpense.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **copy**
> ResponseWrapperTravelExpense copy(id)

[BETA] Copy travel expense.



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

api_instance = TripletexRubyClient::TravelExpenseApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Copy travel expense.
  result = api_instance.copy(id)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseApi->copy: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 

### Return type

[**ResponseWrapperTravelExpense**](ResponseWrapperTravelExpense.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **create_vouchers**
> ListResponseTravelExpense create_vouchers(date, opts)

[BETA] Create vouchers



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

api_instance = TripletexRubyClient::TravelExpenseApi.new

date = 'date_example' # String | yyyy-MM-dd. Defaults to today.

opts = { 
  id: 'id_example' # String | ID of the elements
}

begin
  #[BETA] Create vouchers
  result = api_instance.create_vouchers(date, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseApi->create_vouchers: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **date** | **String**| yyyy-MM-dd. Defaults to today. | 
 **id** | **String**| ID of the elements | [optional] 

### Return type

[**ListResponseTravelExpense**](ListResponseTravelExpense.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **delete**
> delete(id)

[BETA] Delete travel expense.



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

api_instance = TripletexRubyClient::TravelExpenseApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Delete travel expense.
  api_instance.delete(id)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseApi->delete: #{e}"
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



# **delete_attachment**
> delete_attachment(travel_expense_id, opts)

[BETA] Delete attachment.



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

api_instance = TripletexRubyClient::TravelExpenseApi.new

travel_expense_id = 56 # Integer | ID of attachment containing the attachment to delete.

opts = { 
  version: 56, # Integer | Version of voucher containing the attachment to delete.
  send_to_inbox: false, # BOOLEAN | Should the attachment be sent to inbox rather than deleted?
  split: false # BOOLEAN | If sendToInbox is true, should the attachment be split into one voucher per page?
}

begin
  #[BETA] Delete attachment.
  api_instance.delete_attachment(travel_expense_id, opts)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseApi->delete_attachment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **travel_expense_id** | **Integer**| ID of attachment containing the attachment to delete. | 
 **version** | **Integer**| Version of voucher containing the attachment to delete. | [optional] 
 **send_to_inbox** | **BOOLEAN**| Should the attachment be sent to inbox rather than deleted? | [optional] [default to false]
 **split** | **BOOLEAN**| If sendToInbox is true, should the attachment be split into one voucher per page? | [optional] [default to false]

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **deliver**
> ListResponseTravelExpense deliver(opts)

[BETA] Deliver travel expenses.



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

api_instance = TripletexRubyClient::TravelExpenseApi.new

opts = { 
  id: 'id_example' # String | ID of the elements
}

begin
  #[BETA] Deliver travel expenses.
  result = api_instance.deliver(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseApi->deliver: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the elements | [optional] 

### Return type

[**ListResponseTravelExpense**](ListResponseTravelExpense.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **download_attachment**
> String download_attachment(travel_expense_id)

Get attachment by travel expense ID.



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

api_instance = TripletexRubyClient::TravelExpenseApi.new

travel_expense_id = 56 # Integer | Travel Expense ID from which PDF is downloaded.


begin
  #Get attachment by travel expense ID.
  result = api_instance.download_attachment(travel_expense_id)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseApi->download_attachment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **travel_expense_id** | **Integer**| Travel Expense ID from which PDF is downloaded. | 

### Return type

**String**

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream



# **get**
> ResponseWrapperTravelExpense get(id, opts)

[BETA] Get travel expense by ID.



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

api_instance = TripletexRubyClient::TravelExpenseApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Get travel expense by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperTravelExpense**](ResponseWrapperTravelExpense.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperTravelExpense post(opts)

[BETA] Create travel expense.



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

api_instance = TripletexRubyClient::TravelExpenseApi.new

opts = { 
  body: TripletexRubyClient::TravelExpense.new # TravelExpense | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create travel expense.
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**TravelExpense**](TravelExpense.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperTravelExpense**](ResponseWrapperTravelExpense.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperTravelExpense put(id, opts)

[BETA] Update travel expense.



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

api_instance = TripletexRubyClient::TravelExpenseApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::TravelExpense.new # TravelExpense | Partial object describing what should be updated
}

begin
  #[BETA] Update travel expense.
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**TravelExpense**](TravelExpense.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperTravelExpense**](ResponseWrapperTravelExpense.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseTravelExpense search(opts)

[BETA] Find travel expenses corresponding with sent data.



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

api_instance = TripletexRubyClient::TravelExpenseApi.new

opts = { 
  employee_id: 'employee_id_example', # String | Equals
  department_id: 'department_id_example', # String | Equals
  project_id: 'project_id_example', # String | Equals
  project_manager_id: 'project_manager_id_example', # String | Equals
  departure_date_from: 'departure_date_from_example', # String | From and including
  return_date_to: 'return_date_to_example', # String | To and excluding
  state: 'ALL', # String | category
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find travel expenses corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **employee_id** | **String**| Equals | [optional] 
 **department_id** | **String**| Equals | [optional] 
 **project_id** | **String**| Equals | [optional] 
 **project_manager_id** | **String**| Equals | [optional] 
 **departure_date_from** | **String**| From and including | [optional] 
 **return_date_to** | **String**| To and excluding | [optional] 
 **state** | **String**| category | [optional] [default to ALL]
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseTravelExpense**](ListResponseTravelExpense.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **unapprove**
> ListResponseTravelExpense unapprove(opts)

[BETA] Unapprove travel expenses.



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

api_instance = TripletexRubyClient::TravelExpenseApi.new

opts = { 
  id: 'id_example' # String | ID of the elements
}

begin
  #[BETA] Unapprove travel expenses.
  result = api_instance.unapprove(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseApi->unapprove: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the elements | [optional] 

### Return type

[**ListResponseTravelExpense**](ListResponseTravelExpense.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **undeliver**
> ListResponseTravelExpense undeliver(opts)

[BETA] Undeliver travel expenses.



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

api_instance = TripletexRubyClient::TravelExpenseApi.new

opts = { 
  id: 'id_example' # String | ID of the elements
}

begin
  #[BETA] Undeliver travel expenses.
  result = api_instance.undeliver(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseApi->undeliver: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the elements | [optional] 

### Return type

[**ListResponseTravelExpense**](ListResponseTravelExpense.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **upload_attachment**
> upload_attachment(travel_expense_id, file, opts)

Upload attachment to travel expense.



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

api_instance = TripletexRubyClient::TravelExpenseApi.new

travel_expense_id = 56 # Integer | Travel Expense ID to upload attachment to.

file = File.new('/path/to/file.txt') # File | The file

opts = { 
  create_new_cost: false # BOOLEAN | Create new cost row when you add the attachment
}

begin
  #Upload attachment to travel expense.
  api_instance.upload_attachment(travel_expense_id, file, opts)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseApi->upload_attachment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **travel_expense_id** | **Integer**| Travel Expense ID to upload attachment to. | 
 **file** | **File**| The file | 
 **create_new_cost** | **BOOLEAN**| Create new cost row when you add the attachment | [optional] [default to false]

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined



# **upload_attachments**
> upload_attachments(travel_expense_id, body, opts)

Upload multiple attachments to travel expense.



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

api_instance = TripletexRubyClient::TravelExpenseApi.new

travel_expense_id = 56 # Integer | Travel Expense ID to upload attachment to.

body = TripletexRubyClient::FormDataMultiPart.new # FormDataMultiPart | Multipart files

opts = { 
  create_new_cost: false # BOOLEAN | Create new cost row when you add the attachment
}

begin
  #Upload multiple attachments to travel expense.
  api_instance.upload_attachments(travel_expense_id, body, opts)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling TravelExpenseApi->upload_attachments: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **travel_expense_id** | **Integer**| Travel Expense ID to upload attachment to. | 
 **body** | [**FormDataMultiPart**](FormDataMultiPart.md)| Multipart files | 
 **create_new_cost** | **BOOLEAN**| Create new cost row when you add the attachment | [optional] [default to false]

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined



