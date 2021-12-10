# TripletexRubyClient::SupplierInvoiceApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**add_payment**](SupplierInvoiceApi.md#add_payment) | **POST** /supplierInvoice/{invoiceId}/:addPayment | [BETA] Register payment, paymentType &#x3D;&#x3D; 0 finds the last paymentType for this vendor
[**add_recipient**](SupplierInvoiceApi.md#add_recipient) | **PUT** /supplierInvoice/{invoiceId}/:addRecipient | [BETA] Add recipient to supplier invoices.
[**add_recipient_to_many**](SupplierInvoiceApi.md#add_recipient_to_many) | **PUT** /supplierInvoice/:addRecipient | [BETA] Add recipient.
[**approve**](SupplierInvoiceApi.md#approve) | **PUT** /supplierInvoice/{invoiceId}/:approve | [BETA] Approve supplier invoice.
[**approve_many**](SupplierInvoiceApi.md#approve_many) | **PUT** /supplierInvoice/:approve | [BETA] Approve supplier invoices.
[**change_dimension_many**](SupplierInvoiceApi.md#change_dimension_many) | **PUT** /supplierInvoice/{invoiceId}/:changeDimension | Change dimension on a supplier invoice.
[**download_pdf**](SupplierInvoiceApi.md#download_pdf) | **GET** /supplierInvoice/{invoiceId}/pdf | [BETA] Get supplierInvoice document by invoice ID.
[**get**](SupplierInvoiceApi.md#get) | **GET** /supplierInvoice/{id} | [BETA] Get supplierInvoice by ID.
[**get_approval_invoices**](SupplierInvoiceApi.md#get_approval_invoices) | **GET** /supplierInvoice/forApproval | [BETA] Get supplierInvoices for approval
[**put_postings**](SupplierInvoiceApi.md#put_postings) | **PUT** /supplierInvoice/voucher/{id}/postings | [BETA] Put debit postings.
[**reject**](SupplierInvoiceApi.md#reject) | **PUT** /supplierInvoice/{invoiceId}/:reject | [BETA] reject supplier invoice.
[**reject_many**](SupplierInvoiceApi.md#reject_many) | **PUT** /supplierInvoice/:reject | [BETA] reject supplier invoices.
[**search**](SupplierInvoiceApi.md#search) | **GET** /supplierInvoice | [BETA] Find supplierInvoices corresponding with sent data.


# **add_payment**
> ResponseWrapperSupplierInvoice add_payment(invoice_id, payment_type, opts)

[BETA] Register payment, paymentType == 0 finds the last paymentType for this vendor



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

api_instance = TripletexRubyClient::SupplierInvoiceApi.new

invoice_id = 56 # Integer | Invoice ID.

payment_type = 56 # Integer | 

opts = { 
  amount: 'amount_example', # String | 
  kid_or_receiver_reference: 'kid_or_receiver_reference_example', # String | 
  bban: 'bban_example', # String | 
  payment_date: 'payment_date_example', # String | 
  use_default_payment_type: false, # BOOLEAN | Set paymentType to last type for vendor, autopay, nets or first available other type
  partial_payment: false # BOOLEAN | Set to true to allow multiple payments registered.
}

begin
  #[BETA] Register payment, paymentType == 0 finds the last paymentType for this vendor
  result = api_instance.add_payment(invoice_id, payment_type, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierInvoiceApi->add_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_id** | **Integer**| Invoice ID. | 
 **payment_type** | **Integer**|  | 
 **amount** | **String**|  | [optional] 
 **kid_or_receiver_reference** | **String**|  | [optional] 
 **bban** | **String**|  | [optional] 
 **payment_date** | **String**|  | [optional] 
 **use_default_payment_type** | **BOOLEAN**| Set paymentType to last type for vendor, autopay, nets or first available other type | [optional] [default to false]
 **partial_payment** | **BOOLEAN**| Set to true to allow multiple payments registered. | [optional] [default to false]

### Return type

[**ResponseWrapperSupplierInvoice**](ResponseWrapperSupplierInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **add_recipient**
> ResponseWrapperSupplierInvoice add_recipient(invoice_id, employee_id, opts)

[BETA] Add recipient to supplier invoices.



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

api_instance = TripletexRubyClient::SupplierInvoiceApi.new

invoice_id = 56 # Integer | Invoice ID.

employee_id = 56 # Integer | ID of the elements

opts = { 
  comment: 'comment_example' # String | comment
}

begin
  #[BETA] Add recipient to supplier invoices.
  result = api_instance.add_recipient(invoice_id, employee_id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierInvoiceApi->add_recipient: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_id** | **Integer**| Invoice ID. | 
 **employee_id** | **Integer**| ID of the elements | 
 **comment** | **String**| comment | [optional] 

### Return type

[**ResponseWrapperSupplierInvoice**](ResponseWrapperSupplierInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **add_recipient_to_many**
> ListResponseSupplierInvoice add_recipient_to_many(employee_id, opts)

[BETA] Add recipient.



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

api_instance = TripletexRubyClient::SupplierInvoiceApi.new

employee_id = 56 # Integer | Element ID

opts = { 
  invoice_ids: 'invoice_ids_example', # String | ID of the elements
  comment: 'comment_example' # String | comment
}

begin
  #[BETA] Add recipient.
  result = api_instance.add_recipient_to_many(employee_id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierInvoiceApi->add_recipient_to_many: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **employee_id** | **Integer**| Element ID | 
 **invoice_ids** | **String**| ID of the elements | [optional] 
 **comment** | **String**| comment | [optional] 

### Return type

[**ListResponseSupplierInvoice**](ListResponseSupplierInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **approve**
> ResponseWrapperSupplierInvoice approve(invoice_id, opts)

[BETA] Approve supplier invoice.



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

api_instance = TripletexRubyClient::SupplierInvoiceApi.new

invoice_id = 56 # Integer | ID of the elements

opts = { 
  comment: 'comment_example' # String | comment
}

begin
  #[BETA] Approve supplier invoice.
  result = api_instance.approve(invoice_id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierInvoiceApi->approve: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_id** | **Integer**| ID of the elements | 
 **comment** | **String**| comment | [optional] 

### Return type

[**ResponseWrapperSupplierInvoice**](ResponseWrapperSupplierInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **approve_many**
> ListResponseSupplierInvoice approve_many(opts)

[BETA] Approve supplier invoices.



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

api_instance = TripletexRubyClient::SupplierInvoiceApi.new

opts = { 
  invoice_ids: 'invoice_ids_example', # String | ID of the elements
  comment: 'comment_example' # String | comment
}

begin
  #[BETA] Approve supplier invoices.
  result = api_instance.approve_many(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierInvoiceApi->approve_many: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_ids** | **String**| ID of the elements | [optional] 
 **comment** | **String**| comment | [optional] 

### Return type

[**ListResponseSupplierInvoice**](ListResponseSupplierInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **change_dimension_many**
> ResponseWrapperSupplierInvoice change_dimension_many(invoice_id, dimension, dimension_id, opts)

Change dimension on a supplier invoice.



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

api_instance = TripletexRubyClient::SupplierInvoiceApi.new

invoice_id = 56 # Integer | Invoice ID.

dimension = 'dimension_example' # String | Dimension

dimension_id = 56 # Integer | DimensionID

opts = { 
  debit_posting_ids: 'debit_posting_ids_example' # String | ID of the elements
}

begin
  #Change dimension on a supplier invoice.
  result = api_instance.change_dimension_many(invoice_id, dimension, dimension_id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierInvoiceApi->change_dimension_many: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_id** | **Integer**| Invoice ID. | 
 **dimension** | **String**| Dimension | 
 **dimension_id** | **Integer**| DimensionID | 
 **debit_posting_ids** | **String**| ID of the elements | [optional] 

### Return type

[**ResponseWrapperSupplierInvoice**](ResponseWrapperSupplierInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **download_pdf**
> String download_pdf(invoice_id)

[BETA] Get supplierInvoice document by invoice ID.



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

api_instance = TripletexRubyClient::SupplierInvoiceApi.new

invoice_id = 56 # Integer | Invoice ID from which document is downloaded.


begin
  #[BETA] Get supplierInvoice document by invoice ID.
  result = api_instance.download_pdf(invoice_id)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierInvoiceApi->download_pdf: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_id** | **Integer**| Invoice ID from which document is downloaded. | 

### Return type

**String**

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream



# **get**
> ResponseWrapperSupplierInvoice get(id, opts)

[BETA] Get supplierInvoice by ID.



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

api_instance = TripletexRubyClient::SupplierInvoiceApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Get supplierInvoice by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierInvoiceApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperSupplierInvoice**](ResponseWrapperSupplierInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get_approval_invoices**
> ListResponseSupplierInvoice get_approval_invoices(opts)

[BETA] Get supplierInvoices for approval



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

api_instance = TripletexRubyClient::SupplierInvoiceApi.new

opts = { 
  search_text: 'search_text_example', # String | Search for department, employee, project and more
  show_all: false, # BOOLEAN | Show all or just your own
  employee_id: 56, # Integer | Default is logged in employee
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Get supplierInvoices for approval
  result = api_instance.get_approval_invoices(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierInvoiceApi->get_approval_invoices: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search_text** | **String**| Search for department, employee, project and more | [optional] 
 **show_all** | **BOOLEAN**| Show all or just your own | [optional] [default to false]
 **employee_id** | **Integer**| Default is logged in employee | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseSupplierInvoice**](ListResponseSupplierInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **put_postings**
> ResponseWrapperSupplierInvoice put_postings(id, opts)

[BETA] Put debit postings.



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

api_instance = TripletexRubyClient::SupplierInvoiceApi.new

id = 56 # Integer | Voucher id

opts = { 
  body: [TripletexRubyClient::OrderLinePostingDTO.new], # Array<OrderLinePostingDTO> | Postings
  send_to_ledger: false, # BOOLEAN | Equals
  voucher_date: 'voucher_date_example' # String | If set, the date of the voucher and the supplier invoice will be changed to this date. If empty, date will not be changed
}

begin
  #[BETA] Put debit postings.
  result = api_instance.put_postings(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierInvoiceApi->put_postings: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Voucher id | 
 **body** | [**Array&lt;OrderLinePostingDTO&gt;**](OrderLinePostingDTO.md)| Postings | [optional] 
 **send_to_ledger** | **BOOLEAN**| Equals | [optional] [default to false]
 **voucher_date** | **String**| If set, the date of the voucher and the supplier invoice will be changed to this date. If empty, date will not be changed | [optional] 

### Return type

[**ResponseWrapperSupplierInvoice**](ResponseWrapperSupplierInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **reject**
> ResponseWrapperSupplierInvoice reject(invoice_id, comment)

[BETA] reject supplier invoice.



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

api_instance = TripletexRubyClient::SupplierInvoiceApi.new

invoice_id = 56 # Integer | Invoice ID.

comment = 'comment_example' # String | 


begin
  #[BETA] reject supplier invoice.
  result = api_instance.reject(invoice_id, comment)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierInvoiceApi->reject: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_id** | **Integer**| Invoice ID. | 
 **comment** | **String**|  | 

### Return type

[**ResponseWrapperSupplierInvoice**](ResponseWrapperSupplierInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **reject_many**
> ListResponseSupplierInvoice reject_many(comment, opts)

[BETA] reject supplier invoices.



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

api_instance = TripletexRubyClient::SupplierInvoiceApi.new

comment = 'comment_example' # String | 

opts = { 
  invoice_ids: 'invoice_ids_example' # String | ID of the elements
}

begin
  #[BETA] reject supplier invoices.
  result = api_instance.reject_many(comment, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierInvoiceApi->reject_many: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **comment** | **String**|  | 
 **invoice_ids** | **String**| ID of the elements | [optional] 

### Return type

[**ListResponseSupplierInvoice**](ListResponseSupplierInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **search**
> ListResponseSupplierInvoice search(invoice_date_from, invoice_date_to, opts)

[BETA] Find supplierInvoices corresponding with sent data.



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

api_instance = TripletexRubyClient::SupplierInvoiceApi.new

invoice_date_from = 'invoice_date_from_example' # String | From and including

invoice_date_to = 'invoice_date_to_example' # String | To and excluding

opts = { 
  id: 'id_example', # String | List of IDs
  invoice_number: 'invoice_number_example', # String | Equals
  kid: 'kid_example', # String | Equals
  voucher_id: 'voucher_id_example', # String | Equals
  supplier_id: 'supplier_id_example', # String | Equals
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #[BETA] Find supplierInvoices corresponding with sent data.
  result = api_instance.search(invoice_date_from, invoice_date_to, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling SupplierInvoiceApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_date_from** | **String**| From and including | 
 **invoice_date_to** | **String**| To and excluding | 
 **id** | **String**| List of IDs | [optional] 
 **invoice_number** | **String**| Equals | [optional] 
 **kid** | **String**| Equals | [optional] 
 **voucher_id** | **String**| Equals | [optional] 
 **supplier_id** | **String**| Equals | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseSupplierInvoice**](ListResponseSupplierInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



