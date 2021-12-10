# TripletexRubyClient::BankreconciliationmatchApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete**](BankreconciliationmatchApi.md#delete) | **DELETE** /bank/reconciliation/match/{id} | [BETA] Delete a bank reconciliation match by ID.
[**get**](BankreconciliationmatchApi.md#get) | **GET** /bank/reconciliation/match/{id} | [BETA] Get bank reconciliation match by ID.
[**post**](BankreconciliationmatchApi.md#post) | **POST** /bank/reconciliation/match | [BETA] Create a bank reconciliation match.
[**put**](BankreconciliationmatchApi.md#put) | **PUT** /bank/reconciliation/match/{id} | [BETA] Update a bank reconciliation match by ID.
[**search**](BankreconciliationmatchApi.md#search) | **GET** /bank/reconciliation/match | [BETA] Find bank reconciliation match corresponding with sent data.
[**suggest**](BankreconciliationmatchApi.md#suggest) | **PUT** /bank/reconciliation/match/:suggest | [BETA] Suggest matches for a bank reconciliation by ID.


# **delete**
> delete(id)

[BETA] Delete a bank reconciliation match by ID.



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

api_instance = TripletexRubyClient::BankreconciliationmatchApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Delete a bank reconciliation match by ID.
  api_instance.delete(id)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling BankreconciliationmatchApi->delete: #{e}"
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
> ResponseWrapperBankReconciliationMatch get(id, opts)

[BETA] Get bank reconciliation match by ID.



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

api_instance = TripletexRubyClient::BankreconciliationmatchApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Get bank reconciliation match by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling BankreconciliationmatchApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperBankReconciliationMatch**](ResponseWrapperBankReconciliationMatch.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperBankReconciliationMatch post(opts)

[BETA] Create a bank reconciliation match.



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

api_instance = TripletexRubyClient::BankreconciliationmatchApi.new

opts = { 
  body: TripletexRubyClient::BankReconciliationMatch.new # BankReconciliationMatch | Partial object describing what should be updated
}

begin
  #[BETA] Create a bank reconciliation match.
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling BankreconciliationmatchApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**BankReconciliationMatch**](BankReconciliationMatch.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperBankReconciliationMatch**](ResponseWrapperBankReconciliationMatch.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperBankReconciliationMatch put(id, opts)

[BETA] Update a bank reconciliation match by ID.



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

api_instance = TripletexRubyClient::BankreconciliationmatchApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::BankReconciliationMatch.new # BankReconciliationMatch | Partial object describing what should be updated
}

begin
  #[BETA] Update a bank reconciliation match by ID.
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling BankreconciliationmatchApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**BankReconciliationMatch**](BankReconciliationMatch.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperBankReconciliationMatch**](ResponseWrapperBankReconciliationMatch.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseBankReconciliationMatch search(opts)

[BETA] Find bank reconciliation match corresponding with sent data.



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

api_instance = TripletexRubyClient::BankreconciliationmatchApi.new

opts = { 
  id: 'id_example', # String | List of IDs
  bank_reconciliation_id: 'bank_reconciliation_id_example', # String | List of bank reconciliation IDs
  count: 5000, # Integer | Number of elements to return
  from: 0, # Integer | From index
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find bank reconciliation match corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling BankreconciliationmatchApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of IDs | [optional] 
 **bank_reconciliation_id** | **String**| List of bank reconciliation IDs | [optional] 
 **count** | **Integer**| Number of elements to return | [optional] [default to 5000]
 **from** | **Integer**| From index | [optional] [default to 0]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseBankReconciliationMatch**](ListResponseBankReconciliationMatch.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **suggest**
> ListResponseBankReconciliationMatch suggest(bank_reconciliation_id)

[BETA] Suggest matches for a bank reconciliation by ID.



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

api_instance = TripletexRubyClient::BankreconciliationmatchApi.new

bank_reconciliation_id = 56 # Integer | Element ID


begin
  #[BETA] Suggest matches for a bank reconciliation by ID.
  result = api_instance.suggest(bank_reconciliation_id)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling BankreconciliationmatchApi->suggest: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bank_reconciliation_id** | **Integer**| Element ID | 

### Return type

[**ListResponseBankReconciliationMatch**](ListResponseBankReconciliationMatch.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



