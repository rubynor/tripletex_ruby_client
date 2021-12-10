# TripletexRubyClient::OrderApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**approve_subscription_invoice**](OrderApi.md#approve_subscription_invoice) | **PUT** /order/{id}/:approveSubscriptionInvoice | To create a subscription invoice, first create a order with the subscription enabled, then approve it with this method. This approves the order for subscription invoicing.
[**attach**](OrderApi.md#attach) | **PUT** /order/{id}/:attach | Attach document to specified order ID.
[**get**](OrderApi.md#get) | **GET** /order/{id} | Get order by ID.
[**invoice**](OrderApi.md#invoice) | **PUT** /order/{id}/:invoice | Create new invoice from order.
[**invoice_multiple_orders**](OrderApi.md#invoice_multiple_orders) | **PUT** /order/:invoiceMultipleOrders | [BETA] Charges a single customer invoice from multiple orders. The orders must be to the same customer, currency, due date, receiver email and attn.
[**post**](OrderApi.md#post) | **POST** /order | Create order.
[**post_list**](OrderApi.md#post_list) | **POST** /order/list | [BETA] Create multiple Orders with OrderLines. Max 100 at a time.
[**put**](OrderApi.md#put) | **PUT** /order/{id} | Update order.
[**search**](OrderApi.md#search) | **GET** /order | Find orders corresponding with sent data.
[**un_approve_subscription_invoice**](OrderApi.md#un_approve_subscription_invoice) | **PUT** /order/{id}/:unApproveSubscriptionInvoice | Unapproves the order for subscription invoicing.


# **approve_subscription_invoice**
> ResponseWrapperInvoice approve_subscription_invoice(id, invoice_date)

To create a subscription invoice, first create a order with the subscription enabled, then approve it with this method. This approves the order for subscription invoicing.



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

api_instance = TripletexRubyClient::OrderApi.new

id = 56 # Integer | ID of order to approve for subscription invoicing.

invoice_date = 'invoice_date_example' # String | The approval date for the subscription.


begin
  #To create a subscription invoice, first create a order with the subscription enabled, then approve it with this method. This approves the order for subscription invoicing.
  result = api_instance.approve_subscription_invoice(id, invoice_date)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling OrderApi->approve_subscription_invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| ID of order to approve for subscription invoicing. | 
 **invoice_date** | **String**| The approval date for the subscription. | 

### Return type

[**ResponseWrapperInvoice**](ResponseWrapperInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **attach**
> ResponseWrapperDocumentArchive attach(file, id)

Attach document to specified order ID.



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

api_instance = TripletexRubyClient::OrderApi.new

file = File.new('/path/to/file.txt') # File | The file

id = 56 # Integer | Element ID


begin
  #Attach document to specified order ID.
  result = api_instance.attach(file, id)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling OrderApi->attach: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **File**| The file | 
 **id** | **Integer**| Element ID | 

### Return type

[**ResponseWrapperDocumentArchive**](ResponseWrapperDocumentArchive.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined



# **get**
> ResponseWrapperOrder get(id, opts)

Get order by ID.



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

api_instance = TripletexRubyClient::OrderApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Get order by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling OrderApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperOrder**](ResponseWrapperOrder.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **invoice**
> ResponseWrapperInvoice invoice(id, invoice_date, opts)

Create new invoice from order.



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

api_instance = TripletexRubyClient::OrderApi.new

id = 56 # Integer | ID of order to invoice.

invoice_date = 'invoice_date_example' # String | The invoice date

opts = { 
  send_to_customer: true, # BOOLEAN | Send invoice to customer
  payment_type_id: 56, # Integer | Payment type to register prepayment of the invoice. paymentTypeId and paidAmount are optional, but both must be provided if the invoice has already been paid. The payment type must be related to an account with the same currency as the invoice.
  paid_amount: 8.14, # Float | Paid amount to register prepayment of the invoice, in invoice currency. paymentTypeId and paidAmount are optional, but both must be provided if the invoice has already been paid. This amount is in the invoice currency.
  paid_amount_account_currency: 8.14, # Float | Amount paid in payment type currency
  payment_type_id_rest_amount: 56, # Integer | Payment type of rest amount. It is possible to have two prepaid payments when invoicing. If paymentTypeIdRestAmount > 0, this second payment will be calculated as invoice amount - paidAmount
  paid_amount_account_currency_rest: 8.14, # Float | Amount rest in payment type currency
  create_on_account: 'create_on_account_example', # String | Create on account(a konto)
  amount_on_account: 0.0, # Float | Amount on account
  on_account_comment: 'on_account_comment_example', # String | On account comment
  create_backorder: false # BOOLEAN | Create a backorder for this order, available only for pilot users
}

begin
  #Create new invoice from order.
  result = api_instance.invoice(id, invoice_date, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling OrderApi->invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| ID of order to invoice. | 
 **invoice_date** | **String**| The invoice date | 
 **send_to_customer** | **BOOLEAN**| Send invoice to customer | [optional] [default to true]
 **payment_type_id** | **Integer**| Payment type to register prepayment of the invoice. paymentTypeId and paidAmount are optional, but both must be provided if the invoice has already been paid. The payment type must be related to an account with the same currency as the invoice. | [optional] 
 **paid_amount** | **Float**| Paid amount to register prepayment of the invoice, in invoice currency. paymentTypeId and paidAmount are optional, but both must be provided if the invoice has already been paid. This amount is in the invoice currency. | [optional] 
 **paid_amount_account_currency** | **Float**| Amount paid in payment type currency | [optional] 
 **payment_type_id_rest_amount** | **Integer**| Payment type of rest amount. It is possible to have two prepaid payments when invoicing. If paymentTypeIdRestAmount &gt; 0, this second payment will be calculated as invoice amount - paidAmount | [optional] 
 **paid_amount_account_currency_rest** | **Float**| Amount rest in payment type currency | [optional] 
 **create_on_account** | **String**| Create on account(a konto) | [optional] 
 **amount_on_account** | **Float**| Amount on account | [optional] [default to 0.0]
 **on_account_comment** | **String**| On account comment | [optional] 
 **create_backorder** | **BOOLEAN**| Create a backorder for this order, available only for pilot users | [optional] [default to false]

### Return type

[**ResponseWrapperInvoice**](ResponseWrapperInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **invoice_multiple_orders**
> ResponseWrapperInvoice invoice_multiple_orders(id, invoice_date)

[BETA] Charges a single customer invoice from multiple orders. The orders must be to the same customer, currency, due date, receiver email and attn.



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

api_instance = TripletexRubyClient::OrderApi.new

id = 'id_example' # String | List of Order IDs - to the same customer, separated by comma.

invoice_date = 'invoice_date_example' # String | The invoice date


begin
  #[BETA] Charges a single customer invoice from multiple orders. The orders must be to the same customer, currency, due date, receiver email and attn.
  result = api_instance.invoice_multiple_orders(id, invoice_date)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling OrderApi->invoice_multiple_orders: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of Order IDs - to the same customer, separated by comma. | 
 **invoice_date** | **String**| The invoice date | 

### Return type

[**ResponseWrapperInvoice**](ResponseWrapperInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperOrder post(opts)

Create order.



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

api_instance = TripletexRubyClient::OrderApi.new

opts = { 
  body: TripletexRubyClient::Order.new # Order | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #Create order.
  result = api_instance.post(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling OrderApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Order**](Order.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperOrder**](ResponseWrapperOrder.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_list**
> ListResponseOrder post_list(opts)

[BETA] Create multiple Orders with OrderLines. Max 100 at a time.



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

api_instance = TripletexRubyClient::OrderApi.new

opts = { 
  body: [TripletexRubyClient::Order.new] # Array<Order> | JSON representing a list of new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create multiple Orders with OrderLines. Max 100 at a time.
  result = api_instance.post_list(opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling OrderApi->post_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;Order&gt;**](Order.md)| JSON representing a list of new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ListResponseOrder**](ListResponseOrder.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperOrder put(id, opts)

Update order.



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

api_instance = TripletexRubyClient::OrderApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexRubyClient::Order.new # Order | Partial object describing what should be updated
}

begin
  #Update order.
  result = api_instance.put(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling OrderApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**Order**](Order.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperOrder**](ResponseWrapperOrder.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseOrder search(order_date_from, order_date_to, opts)

Find orders corresponding with sent data.



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

api_instance = TripletexRubyClient::OrderApi.new

order_date_from = 'order_date_from_example' # String | From and including

order_date_to = 'order_date_to_example' # String | To and excluding

opts = { 
  id: 'id_example', # String | List of IDs
  number: 'number_example', # String | Equals
  customer_id: 'customer_id_example', # String | List of IDs
  is_closed: true, # BOOLEAN | Equals
  is_subscription: true, # BOOLEAN | Equals
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: 'sorting_example', # String | Sorting pattern
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find orders corresponding with sent data.
  result = api_instance.search(order_date_from, order_date_to, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling OrderApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **order_date_from** | **String**| From and including | 
 **order_date_to** | **String**| To and excluding | 
 **id** | **String**| List of IDs | [optional] 
 **number** | **String**| Equals | [optional] 
 **customer_id** | **String**| List of IDs | [optional] 
 **is_closed** | **BOOLEAN**| Equals | [optional] 
 **is_subscription** | **BOOLEAN**| Equals | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseOrder**](ListResponseOrder.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **un_approve_subscription_invoice**
> un_approve_subscription_invoice(id)

Unapproves the order for subscription invoicing.



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

api_instance = TripletexRubyClient::OrderApi.new

id = 56 # Integer | ID of order to unapprove for subscription invoicing.


begin
  #Unapproves the order for subscription invoicing.
  api_instance.un_approve_subscription_invoice(id)
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling OrderApi->un_approve_subscription_invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| ID of order to unapprove for subscription invoicing. | 

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



