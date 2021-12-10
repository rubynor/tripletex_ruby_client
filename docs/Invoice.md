# TripletexRubyClient::Invoice

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**invoice_number** | **Integer** | If value is set to 0, the invoice number will be generated. | [optional] 
**invoice_date** | **String** |  | 
**customer** | [**Customer**](Customer.md) | The invoice customer | [optional] 
**credited_invoice** | **Integer** | The id of the original invoice if this is a credit note. | [optional] 
**is_credited** | **BOOLEAN** |  | [optional] 
**invoice_due_date** | **String** |  | 
**kid** | **String** | KID - Kundeidentifikasjonsnummer. | [optional] 
**invoice_comment** | **String** | Comment text for the invoice. This was specified on the order as invoiceComment. | [optional] 
**comment** | **String** | Comment text for the specific invoice. | [optional] 
**orders** | [**Array&lt;Order&gt;**](Order.md) | Related orders. Only one order per invoice is supported at the moment. | 
**order_lines** | [**Array&lt;OrderLine&gt;**](OrderLine.md) | Orderlines connected to the invoice. | [optional] 
**travel_reports** | [**Array&lt;TravelExpense&gt;**](TravelExpense.md) | Travel reports connected to the invoice. | [optional] 
**project_invoice_details** | [**Array&lt;ProjectInvoiceDetails&gt;**](ProjectInvoiceDetails.md) | ProjectInvoiceDetails contains additional information about the invoice, in particular invoices for projects. It contains information about the charged project, the fee amount, extra percent and amount, extra costs, travel expenses, invoice and project comments, akonto amount and values determining if extra costs, akonto and hours should be included. ProjectInvoiceDetails is an object which represents the relation between an invoice and a Project, Orderline and OrderOut object. | [optional] 
**voucher** | [**Voucher**](Voucher.md) | The invoice voucher. | [optional] 
**delivery_date** | **String** | The delivery date. | [optional] 
**amount** | **Float** | In the company’s currency, typically NOK. | [optional] 
**amount_currency** | **Float** | In the specified currency. | [optional] 
**amount_excluding_vat** | **Float** | Amount excluding VAT (NOK). | [optional] 
**amount_excluding_vat_currency** | **Float** | Amount excluding VAT in the specified currency. | [optional] 
**amount_roundoff** | **Float** | Amount of round off to nearest integer. | [optional] 
**amount_roundoff_currency** | **Float** | Amount of round off to nearest integer in the specified currency. | [optional] 
**amount_outstanding** | **Float** | The amount outstanding based on the history collection, excluding reminders and any existing remits, in the invoice currency. | [optional] 
**amount_currency_outstanding** | **Float** | The amountCurrency outstanding based on the history collection, excluding reminders and any existing remits, in the invoice currency. | [optional] 
**amount_outstanding_total** | **Float** | The amount outstanding based on the history collection and including the last reminder and any existing remits. This is the total invoice balance including reminders and remittances, in the invoice currency. | [optional] 
**amount_currency_outstanding_total** | **Float** | The amountCurrency outstanding based on the history collection and including the last reminder and any existing remits. This is the total invoice balance including reminders and remittances, in the invoice currency. | [optional] 
**sum_remits** | **Float** | The sum of all open remittances of the invoice. Remittances are reimbursement payments back to the customer and are therefore relevant to the bookkeeping of the invoice in the accounts. | [optional] 
**currency** | [**Currency**](Currency.md) |  | [optional] 
**is_credit_note** | **BOOLEAN** |  | [optional] 
**is_charged** | **BOOLEAN** |  | [optional] 
**is_approved** | **BOOLEAN** |  | [optional] 
**postings** | [**Array&lt;Posting&gt;**](Posting.md) | The invoice postings, which includes a posting for the invoice with a positive amount, and one or more posting for the payments with negative amounts. | [optional] 
**reminders** | [**Array&lt;Reminder&gt;**](Reminder.md) | Invoice debt collection and reminders. | [optional] 
**invoice_remarks** | **String** | Invoice remarks - automatically stops reminder/notice of debt collection if specified. | [optional] 
**payment_type_id** | **Integer** | [BETA] Optional. Used to specify payment type for prepaid invoices. Payment type can be specified here, or as a parameter to the /invoice API endpoint. | [optional] 
**paid_amount** | **Float** | [BETA] Optional. Used to specify the prepaid amount of the invoice. The paid amount can be specified here, or as a parameter to the /invoice API endpoint. | [optional] 
**ehf_send_status** | **String** | [Deprecated] EHF (Peppol) send status. This only shows status for historic EHFs. | [optional] 


