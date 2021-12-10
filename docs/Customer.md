# TripletexRubyClient::Customer

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**name** | **String** |  | 
**organization_number** | **String** |  | [optional] 
**supplier_number** | **Integer** |  | [optional] 
**customer_number** | **Integer** |  | [optional] 
**is_supplier** | **BOOLEAN** | Defines if the customer is also a supplier. | [optional] 
**is_customer** | **BOOLEAN** |  | [optional] 
**is_inactive** | **BOOLEAN** |  | [optional] 
**account_manager** | [**Employee**](Employee.md) |  | [optional] 
**email** | **String** |  | [optional] 
**invoice_email** | **String** |  | [optional] 
**overdue_notice_email** | **String** | The email address of the customer where the noticing emails are sent in case of an overdue | [optional] 
**bank_accounts** | **Array&lt;String&gt;** | [DEPRECATED] List of the bank account numbers for this customer. Norwegian bank account numbers only. | [optional] 
**phone_number** | **String** |  | [optional] 
**phone_number_mobile** | **String** |  | [optional] 
**description** | **String** |  | [optional] 
**language** | **String** |  | [optional] 
**display_name** | **String** |  | [optional] 
**is_private_individual** | **BOOLEAN** |  | [optional] 
**single_customer_invoice** | **BOOLEAN** | Enables various orders on one customer invoice. | [optional] 
**invoice_send_method** | **String** | Define the invoicing method for the customer.&lt;br&gt;EMAIL: Send invoices as email.&lt;br&gt;EHF: Send invoices as EHF.&lt;br&gt;EFAKTURA: Send invoices as EFAKTURA.&lt;br&gt;AVTALEGIRO: Send invoices as AVTALEGIRO.&lt;br&gt;VIPPS: Send invoices through VIPPS.&lt;br&gt;PAPER: Send invoices as paper invoice.&lt;br&gt;MANUAL: User will have to send invocie manually.&lt;br&gt; | [optional] 
**email_attachment_type** | **String** | Define the invoice attachment type for emailing to the customer.&lt;br&gt;LINK: Send invoice as link in email.&lt;br&gt;ATTACHMENT: Send invoice as attachment in email.&lt;br&gt; | [optional] 
**postal_address** | [**Address**](Address.md) |  | [optional] 
**physical_address** | [**Address**](Address.md) |  | [optional] 
**delivery_address** | [**DeliveryAddress**](DeliveryAddress.md) |  | [optional] 
**category1** | [**CustomerCategory**](CustomerCategory.md) | Category 1 of this customer | [optional] 
**category2** | [**CustomerCategory**](CustomerCategory.md) | Category 2 of this customer | [optional] 
**category3** | [**CustomerCategory**](CustomerCategory.md) | Category 3 of this customer | [optional] 
**invoices_due_in** | **Integer** | Number of days/months in which invoices created from this customer is due | [optional] 
**invoices_due_in_type** | **String** | Set the time unit of invoicesDueIn. The special case RECURRING_DAY_OF_MONTH enables the due date to be fixed to a specific day of the month, in this case the fixed due date will automatically be set as standard on all invoices created from this customer. Note that when RECURRING_DAY_OF_MONTH is set, the due date will be set to the last day of month if \&quot;31\&quot; is set in invoicesDueIn. | [optional] 
**currency** | [**Currency**](Currency.md) | The preferred currency for this customer | [optional] 
**bank_account_presentation** | [**Array&lt;CompanyBankAccountPresentation&gt;**](CompanyBankAccountPresentation.md) | List of bankAccount for this customer | [optional] 
**ledger_account** | [**Account**](Account.md) | Can be used to specify the ledger account of the customer if it&#39;s different from the default 1500 account. | [optional] 


