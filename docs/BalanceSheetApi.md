# TripletexRubyClient::BalanceSheetApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**search**](BalanceSheetApi.md#search) | **GET** /balanceSheet | [BETA] Get balance sheet (saldobalanse).


# **search**
> ListResponseBalanceSheetAccount search(date_from, date_to, opts)

[BETA] Get balance sheet (saldobalanse).



### Example
```ruby
# load the gem
require 'tripletex_ruby_client'
# setup authorization
TripletexRubyClient.configure do |config|
  # Configure HTTP basic authorization: tokenAuthScheme
  config.consumer_token = ENV["TT_CONSUMER_TOKEN"]
  config.employee_token = ENV["TT_EMPLOYEE_TOKEN"]
  config.host = Rails.env.production? ? 'https://tripletex.no' : 'https://api.tripletex.io'
  config.token_expiration_time = Rails.env.production? ? 1.month : 1.day
end

api_instance = TripletexRubyClient::BalanceSheetApi.new

date_from = 'date_from_example' # String | Format is yyyy-MM-dd (from and incl.).

date_to = 'date_to_example' # String | Format is yyyy-MM-dd (to and excl.).

opts = { 
  account_number_from: 56, # Integer | From and including
  account_number_to: 56, # Integer | To and excluding
  customer_id: 56, # Integer | Element ID
  employee_id: 56, # Integer | Element ID
  department_id: 56, # Integer | Element ID
  project_id: 56, # Integer | Element ID
  include_sub_projects: false, # BOOLEAN | Should sub projects of the given project be included
  include_active_accounts_without_movements: false, # BOOLEAN | Should active accounts with no movements be included
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Get balance sheet (saldobalanse).
  result = api_instance.search(date_from, date_to, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling BalanceSheetApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **date_from** | **String**| Format is yyyy-MM-dd (from and incl.). | 
 **date_to** | **String**| Format is yyyy-MM-dd (to and excl.). | 
 **account_number_from** | **Integer**| From and including | [optional] 
 **account_number_to** | **Integer**| To and excluding | [optional] 
 **customer_id** | **Integer**| Element ID | [optional] 
 **employee_id** | **Integer**| Element ID | [optional] 
 **department_id** | **Integer**| Element ID | [optional] 
 **project_id** | **Integer**| Element ID | [optional] 
 **include_sub_projects** | **BOOLEAN**| Should sub projects of the given project be included | [optional] [default to false]
 **include_active_accounts_without_movements** | **BOOLEAN**| Should active accounts with no movements be included | [optional] [default to false]
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseBalanceSheetAccount**](ListResponseBalanceSheetAccount.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



