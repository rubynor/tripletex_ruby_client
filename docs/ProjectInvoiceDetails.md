# TripletexRubyClient::ProjectInvoiceDetails

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**project** | [**Project**](Project.md) | The Project related to the Invoice and ProjectInvoiceAdditionalInfo. | [optional] 
**fee_amount** | **Float** | Fee amount of the project. For example: 100 NOK. | [optional] 
**fee_amount_currency** | **Float** | Fee amount of the project in the invoice currency. | [optional] 
**markup_percent** | **Float** | The percentage value of mark-up of amountFee. For example: 10%. | [optional] 
**markup_amount** | **Float** | The amount value of mark-up of amountFee on the project invoice. For example: 10 NOK. | [optional] 
**markup_amount_currency** | **Float** | The amount value of mark-up of amountFee on the project invoice, in the invoice currency. | [optional] 
**amount_order_lines_and_reinvoicing** | **Float** | The amount of chargeable manual order lines and vendor invoices on the project invoice. | [optional] 
**amount_order_lines_and_reinvoicing_currency** | **Float** | The amount of chargeable manual order lines and vendor invoices on the project invoice, in the invoice currency. | [optional] 
**amount_travel_reports_and_expenses** | **Float** | The amount of travel costs and expenses on the project invoice. | [optional] 
**amount_travel_reports_and_expenses_currency** | **Float** | The amount of travel costs and expenses on the project invoice, in the invoice currency. | [optional] 
**fee_invoice_text** | **String** | The fee comment on the project invoice. | [optional] 
**invoice_text** | **String** | The comment on the project invoice. | [optional] 
**include_order_lines_and_reinvoicing** | **BOOLEAN** | Determines if extra costs should be included on the project invoice. | [optional] 
**include_hours** | **BOOLEAN** | Determines if hours should be included on the project invoice. | [optional] 
**include_on_account_balance** | **BOOLEAN** | Determines if akonto should be included on the project invoice. | [optional] 
**on_account_balance_amount** | **Float** | The akonto amount on the project invoice. | [optional] 
**on_account_balance_amount_currency** | **Float** | The akonto amount on the project invoice in the invoice currency. | [optional] 
**vat_type** | [**VatType**](VatType.md) | The VAT type of the project invoice. | [optional] 
**invoice** | [**Invoice**](Invoice.md) |  | [optional] 


