# TripletexRubyClient::SalarytransactionApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete**](SalarytransactionApi.md#delete) | **DELETE** /salary/transaction/{id} | [BETA] Delete salary transaction by ID.
[**get**](SalarytransactionApi.md#get) | **GET** /salary/transaction/{id} | [BETA] Find salary transaction by ID.
[**post**](SalarytransactionApi.md#post) | **POST** /salary/transaction | [BETA] Create a new salary transaction.


# **delete**
> delete(id)

[BETA] Delete salary transaction by ID.



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

api_instance = TripletexRubyClient::SalarytransactionApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Delete salary transaction by ID.
  api_instance.delete(id)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SalarytransactionApi->delete: #{e}"
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
> ResponseWrapperSalaryTransaction get(id, opts)

[BETA] Find salary transaction by ID.



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

api_instance = TripletexRubyClient::SalarytransactionApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find salary transaction by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SalarytransactionApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperSalaryTransaction**](ResponseWrapperSalaryTransaction.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperSalaryTransaction post(opts)

[BETA] Create a new salary transaction.



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

api_instance = TripletexRubyClient::SalarytransactionApi.new

opts = { 
  body: TripletexRubyClient::SalaryTransaction.new, # SalaryTransaction | JSON representing the new object to be created. Should not have ID and version set.
  generate_tax_deduction: false # BOOLEAN | Generate tax deduction
}

begin
  #[BETA] Create a new salary transaction.
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SalarytransactionApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**SalaryTransaction**](SalaryTransaction.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 
 **generate_tax_deduction** | **BOOLEAN**| Generate tax deduction | [optional] [default to false]

### Return type

[**ResponseWrapperSalaryTransaction**](ResponseWrapperSalaryTransaction.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



