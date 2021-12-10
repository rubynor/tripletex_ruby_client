# TripletexRubyClient::InvoiceApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_credit_note**](InvoiceApi.md#create_credit_note) | **PUT** /invoice/{id}/:createCreditNote | Creates a new Invoice representing a credit memo that nullifies the given invoice. Updates this invoice and any pre-existing inverse invoice.
[**create_reminder**](InvoiceApi.md#create_reminder) | **PUT** /invoice/{id}/:createReminder | Create invoice reminder and sends it by the given dispatch type. Supports the reminder types SOFT_REMINDER, REMINDER and NOTICE_OF_DEBT_COLLECTION. DispatchType NETS_PRINT must have type NOTICE_OF_DEBT_COLLECTION. SMS and NETS_PRINT must be activated prior to usage in the API.
[**download_pdf**](InvoiceApi.md#download_pdf) | **GET** /invoice/{invoiceId}/pdf | Get invoice document by invoice ID.
[**get**](InvoiceApi.md#get) | **GET** /invoice/{id} | Get invoice by ID.
[**payment**](InvoiceApi.md#payment) | **PUT** /invoice/{id}/:payment | Update invoice. The invoice is updated with payment information. The amount is in the invoice’s currency.
[**post**](InvoiceApi.md#post) | **POST** /invoice | Create invoice. Related Order and OrderLines can be created first, or included as new objects inside the Invoice.
[**post_list**](InvoiceApi.md#post_list) | **POST** /invoice/list | [BETA] Create multiple invoices. Max 100 at a time.
[**search**](InvoiceApi.md#search) | **GET** /invoice | Find invoices corresponding with sent data. Includes charged outgoing invoices only.
[**send**](InvoiceApi.md#send) | **PUT** /invoice/{id}/:send | Send invoice by ID and sendType. Optionally override email recipient.


# **create_credit_note**
> ResponseWrapperInvoice create_credit_note(id, date, opts)

Creates a new Invoice representing a credit memo that nullifies the given invoice. Updates this invoice and any pre-existing inverse invoice.



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

api_instance = TripletexRubyClient::InvoiceApi.new

id = 56 # Integer | Invoice id

date = 'date_example' # String | Credit note date

opts = { 
  comment: 'comment_example', # String | Comment
  credit_note_email: 'credit_note_email_example' # String | The credit note will be sent electronically if this field is filled out
}

begin
  #Creates a new Invoice representing a credit memo that nullifies the given invoice. Updates this invoice and any pre-existing inverse invoice.
  result = api_instance.create_credit_note(id, date, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling InvoiceApi->create_credit_note: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Invoice id | 
 **date** | **String**| Credit note date | 
 **comment** | **String**| Comment | [optional] 
 **credit_note_email** | **String**| The credit note will be sent electronically if this field is filled out | [optional] 

### Return type

[**ResponseWrapperInvoice**](ResponseWrapperInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **create_reminder**
> create_reminder(id, type, date, dispatch_type, opts)

Create invoice reminder and sends it by the given dispatch type. Supports the reminder types SOFT_REMINDER, REMINDER and NOTICE_OF_DEBT_COLLECTION. DispatchType NETS_PRINT must have type NOTICE_OF_DEBT_COLLECTION. SMS and NETS_PRINT must be activated prior to usage in the API.



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

api_instance = TripletexRubyClient::InvoiceApi.new

id = 56 # Integer | Element ID

type = 'type_example' # String | type

date = 'date_example' # String | yyyy-MM-dd. Defaults to today.

dispatch_type = 'dispatch_type_example' # String | dispatchType

opts = { 
  include_charge: false, # BOOLEAN | Equals
  include_interest: false, # BOOLEAN | Equals
  sms_number: 'sms_number_example' # String | SMS number (must be a valid Norwegian telephone number)
}

begin
  #Create invoice reminder and sends it by the given dispatch type. Supports the reminder types SOFT_REMINDER, REMINDER and NOTICE_OF_DEBT_COLLECTION. DispatchType NETS_PRINT must have type NOTICE_OF_DEBT_COLLECTION. SMS and NETS_PRINT must be activated prior to usage in the API.
  api_instance.create_reminder(id, type, date, dispatch_type, opts)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling InvoiceApi->create_reminder: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **type** | **String**| type | 
 **date** | **String**| yyyy-MM-dd. Defaults to today. | 
 **dispatch_type** | **String**| dispatchType | 
 **include_charge** | **BOOLEAN**| Equals | [optional] [default to false]
 **include_interest** | **BOOLEAN**| Equals | [optional] [default to false]
 **sms_number** | **String**| SMS number (must be a valid Norwegian telephone number) | [optional] 

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **download_pdf**
> String download_pdf(invoice_id)

Get invoice document by invoice ID.



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

api_instance = TripletexRubyClient::InvoiceApi.new

invoice_id = 56 # Integer | Invoice ID from which PDF is downloaded.


begin
  #Get invoice document by invoice ID.
  result = api_instance.download_pdf(invoice_id)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling InvoiceApi->download_pdf: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_id** | **Integer**| Invoice ID from which PDF is downloaded. | 

### Return type

**String**

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream



# **get**
> ResponseWrapperInvoice get(id, opts)

Get invoice by ID.



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

api_instance = TripletexRubyClient::InvoiceApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Get invoice by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling InvoiceApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperInvoice**](ResponseWrapperInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **payment**
> ResponseWrapperInvoice payment(id, payment_date, payment_type_id, paid_amount, opts)

Update invoice. The invoice is updated with payment information. The amount is in the invoice’s currency.



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

api_instance = TripletexRubyClient::InvoiceApi.new

id = 56 # Integer | Invoice id

payment_date = 'payment_date_example' # String | Payment date

payment_type_id = 56 # Integer | PaymentType id

paid_amount = 8.14 # Float | Amount paid by customer in the company currency, typically NOK.

opts = { 
  paid_amount_currency: 8.14 # Float | Amount paid by customer in the invoice currency. Optional, but required for invoices in alternate currencies.
}

begin
  #Update invoice. The invoice is updated with payment information. The amount is in the invoice’s currency.
  result = api_instance.payment(id, payment_date, payment_type_id, paid_amount, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling InvoiceApi->payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Invoice id | 
 **payment_date** | **String**| Payment date | 
 **payment_type_id** | **Integer**| PaymentType id | 
 **paid_amount** | **Float**| Amount paid by customer in the company currency, typically NOK. | 
 **paid_amount_currency** | **Float**| Amount paid by customer in the invoice currency. Optional, but required for invoices in alternate currencies. | [optional] 

### Return type

[**ResponseWrapperInvoice**](ResponseWrapperInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperInvoice post(opts)

Create invoice. Related Order and OrderLines can be created first, or included as new objects inside the Invoice.



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

api_instance = TripletexRubyClient::InvoiceApi.new

opts = { 
  body: TripletexRubyClient::Invoice.new, # Invoice | JSON representing the new object to be created. Should not have ID and version set.
  send_to_customer: true, # BOOLEAN | Equals
  payment_type_id: 56, # Integer | Payment type to register prepayment of the invoice. paymentTypeId and paidAmount are optional, but both must be provided if the invoice has already been paid.
  paid_amount: 8.14 # Float | Paid amount to register prepayment of the invoice, in invoice currency. paymentTypeId and paidAmount are optional, but both must be provided if the invoice has already been paid.
}

begin
  #Create invoice. Related Order and OrderLines can be created first, or included as new objects inside the Invoice.
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling InvoiceApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Invoice**](Invoice.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 
 **send_to_customer** | **BOOLEAN**| Equals | [optional] [default to true]
 **payment_type_id** | **Integer**| Payment type to register prepayment of the invoice. paymentTypeId and paidAmount are optional, but both must be provided if the invoice has already been paid. | [optional] 
 **paid_amount** | **Float**| Paid amount to register prepayment of the invoice, in invoice currency. paymentTypeId and paidAmount are optional, but both must be provided if the invoice has already been paid. | [optional] 

### Return type

[**ResponseWrapperInvoice**](ResponseWrapperInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_list**
> ListResponseInvoice post_list(opts)

[BETA] Create multiple invoices. Max 100 at a time.



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

api_instance = TripletexRubyClient::InvoiceApi.new

opts = { 
  body: [TripletexRubyClient::Invoice.new], # Array<Invoice> | JSON representing a list of new object to be created. Should not have ID and version set.
  send_to_customer: true, # BOOLEAN | Equals
  fields: '*' # String | Fields filter pattern
}

begin
  #[BETA] Create multiple invoices. Max 100 at a time.
  result = api_instance.post_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling InvoiceApi->post_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;Invoice&gt;**](Invoice.md)| JSON representing a list of new object to be created. Should not have ID and version set. | [optional] 
 **send_to_customer** | **BOOLEAN**| Equals | [optional] [default to true]
 **fields** | **String**| Fields filter pattern | [optional] [default to *]

### Return type

[**ListResponseInvoice**](ListResponseInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseInvoice search(invoice_date_from, invoice_date_to, opts)

Find invoices corresponding with sent data. Includes charged outgoing invoices only.



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

api_instance = TripletexRubyClient::InvoiceApi.new

invoice_date_from = 'invoice_date_from_example' # String | From and including

invoice_date_to = 'invoice_date_to_example' # String | To and excluding

opts = { 
  id: 'id_example', # String | List of IDs
  invoice_number: 'invoice_number_example', # String | Equals
  kid: 'kid_example', # String | Equals
  voucher_id: 'voucher_id_example', # String | List of IDs
  customer_id: 'customer_id_example', # String | Equals
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find invoices corresponding with sent data. Includes charged outgoing invoices only.
  result = api_instance.search(invoice_date_from, invoice_date_to, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling InvoiceApi->search: #{e}"
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
 **voucher_id** | **String**| List of IDs | [optional] 
 **customer_id** | **String**| Equals | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseInvoice**](ListResponseInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **send**
> send(id, send_type, opts)

Send invoice by ID and sendType. Optionally override email recipient.



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

api_instance = TripletexRubyClient::InvoiceApi.new

id = 56 # Integer | Element ID

send_type = 'send_type_example' # String | SendType

opts = { 
  override_email_address: 'override_email_address_example' # String | Will override email address if sendType = EMAIL
}

begin
  #Send invoice by ID and sendType. Optionally override email recipient.
  api_instance.send(id, send_type, opts)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling InvoiceApi->send: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **send_type** | **String**| SendType | 
 **override_email_address** | **String**| Will override email address if sendType &#x3D; EMAIL | [optional] 

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



