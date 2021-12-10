# TripletexRubyClient::SaftApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**export_saft**](SaftApi.md#export_saft) | **GET** /saft/exportSAFT | [BETA] Create SAF-T export for the Tripletex account.
[**import_saft**](SaftApi.md#import_saft) | **POST** /saft/importSAFT | [BETA] Import SAF-T. Send XML file as multipart form.


# **export_saft**
> String export_saft(year)

[BETA] Create SAF-T export for the Tripletex account.



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

api_instance = TripletexRubyClient::SaftApi.new

year = 56 # Integer | Year to export


begin
  #[BETA] Create SAF-T export for the Tripletex account.
  result = api_instance.export_saft(year)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SaftApi->export_saft: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **year** | **Integer**| Year to export | 

### Return type

**String**

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream



# **import_saft**
> import_saft(saft_file, mapping_file, import_customer_vendors, create_missing_accounts, import_start_balance_from_opening, import_start_balance_from_closing, import_vouchers, import_departments, import_projects, tripletex_generates_customer_numbers, create_customer_ib, update_account_names, create_vendor_ib, override_voucher_date_on_discrepancy, overwrite_customers_contacts, only_active_customers, only_active_accounts, update_start_balance)

[BETA] Import SAF-T. Send XML file as multipart form.



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

api_instance = TripletexRubyClient::SaftApi.new

saft_file = File.new('/path/to/file.txt') # File | The SAF-T file (XML)

mapping_file = File.new('/path/to/file.txt') # File | Mapping of chart of accounts (Excel). See https://tripletex.no/resources/examples/saft_account_mapping.xls

import_customer_vendors = true # BOOLEAN | Create customers and suppliers

create_missing_accounts = true # BOOLEAN | Create new accounts

import_start_balance_from_opening = true # BOOLEAN | Create an opening balance from the import file's starting balance.

import_start_balance_from_closing = true # BOOLEAN | Create an opening balance from the import file's outgoing balance.

import_vouchers = true # BOOLEAN | Create vouchers

import_departments = true # BOOLEAN | Create departments

import_projects = true # BOOLEAN | Create projects

tripletex_generates_customer_numbers = true # BOOLEAN | Let Tripletex create customer and supplier numbers and ignore the numbers in the import file.

create_customer_ib = true # BOOLEAN | Create an opening balance on accounts receivable from customers

update_account_names = true # BOOLEAN | Overwrite existing names on accounts

create_vendor_ib = true # BOOLEAN | Create an opening balance on accounts payable

override_voucher_date_on_discrepancy = true # BOOLEAN | Overwrite transaction date on period discrepancies.

overwrite_customers_contacts = true # BOOLEAN | Overwrite existing customers/contacts

only_active_customers = true # BOOLEAN | Only active customers

only_active_accounts = true # BOOLEAN | Only active accounts

update_start_balance = true # BOOLEAN | Update the opening balance of main ledger accounts from the import file by import before the opening balance.


begin
  #[BETA] Import SAF-T. Send XML file as multipart form.
  api_instance.import_saft(saft_file, mapping_file, import_customer_vendors, create_missing_accounts, import_start_balance_from_opening, import_start_balance_from_closing, import_vouchers, import_departments, import_projects, tripletex_generates_customer_numbers, create_customer_ib, update_account_names, create_vendor_ib, override_voucher_date_on_discrepancy, overwrite_customers_contacts, only_active_customers, only_active_accounts, update_start_balance)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SaftApi->import_saft: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **saft_file** | **File**| The SAF-T file (XML) | 
 **mapping_file** | **File**| Mapping of chart of accounts (Excel). See https://tripletex.no/resources/examples/saft_account_mapping.xls | 
 **import_customer_vendors** | **BOOLEAN**| Create customers and suppliers | 
 **create_missing_accounts** | **BOOLEAN**| Create new accounts | 
 **import_start_balance_from_opening** | **BOOLEAN**| Create an opening balance from the import file&#39;s starting balance. | 
 **import_start_balance_from_closing** | **BOOLEAN**| Create an opening balance from the import file&#39;s outgoing balance. | 
 **import_vouchers** | **BOOLEAN**| Create vouchers | 
 **import_departments** | **BOOLEAN**| Create departments | 
 **import_projects** | **BOOLEAN**| Create projects | 
 **tripletex_generates_customer_numbers** | **BOOLEAN**| Let Tripletex create customer and supplier numbers and ignore the numbers in the import file. | 
 **create_customer_ib** | **BOOLEAN**| Create an opening balance on accounts receivable from customers | 
 **update_account_names** | **BOOLEAN**| Overwrite existing names on accounts | 
 **create_vendor_ib** | **BOOLEAN**| Create an opening balance on accounts payable | 
 **override_voucher_date_on_discrepancy** | **BOOLEAN**| Overwrite transaction date on period discrepancies. | 
 **overwrite_customers_contacts** | **BOOLEAN**| Overwrite existing customers/contacts | 
 **only_active_customers** | **BOOLEAN**| Only active customers | 
 **only_active_accounts** | **BOOLEAN**| Only active accounts | 
 **update_start_balance** | **BOOLEAN**| Update the opening balance of main ledger accounts from the import file by import before the opening balance. | 

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined



