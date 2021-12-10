# TripletexRubyClient::SupplierInvoice

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**invoice_number** | **String** | Invoice number | [optional] 
**invoice_date** | **String** |  | 
**supplier** | [**Supplier**](Supplier.md) | The invoice supplier | [optional] 
**invoice_due_date** | **String** |  | 
**kid_or_receiver_reference** | **String** | KID or message | [optional] 
**voucher** | [**Voucher**](Voucher.md) | The invoice voucher. | [optional] 
**amount** | **Float** | In the company’s currency, typically NOK. Is 0 if value is missing. | [optional] 
**amount_currency** | **Float** | In the specified currency. | [optional] 
**amount_excluding_vat** | **Float** | Amount excluding VAT (NOK). Is 0 if value is missing. | [optional] 
**amount_excluding_vat_currency** | **Float** | Amount excluding VAT in the specified currency. Is 0 if value is missing. | [optional] 
**currency** | [**Currency**](Currency.md) |  | [optional] 
**is_credit_note** | **BOOLEAN** |  | [optional] 
**order_lines** | [**Array&lt;OrderLine&gt;**](OrderLine.md) |  | [optional] 
**payments** | [**Array&lt;Posting&gt;**](Posting.md) |  | [optional] 
**original_invoice_document_id** | **Integer** |  | [optional] 
**approval_list_elements** | [**Array&lt;VoucherApprovalListElement&gt;**](VoucherApprovalListElement.md) |  | [optional] 


