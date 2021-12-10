# TripletexRubyClient::PaymentTypeOut

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**description** | **String** |  | 
**is_brutto_wage_deduction** | **BOOLEAN** | true if it should be a deduction from the wage. The module PROVISIONSALARY is required to both view and change this setting | [optional] 
**credit_account** | [**Account**](Account.md) |  | 
**show_incoming_invoice** | **BOOLEAN** | true if the payment type should be available in supplier invoices | [optional] 
**show_wage_payment** | **BOOLEAN** | true if the payment type should be available in wage payments. The wage module is required to both view and change this setting | [optional] 
**show_vat_returns** | **BOOLEAN** | true if the payment type should be available in vat returns | [optional] 
**show_wage_period_transaction** | **BOOLEAN** | true if the payment type should be available in period transactionsThe wage module is required to both view and change this setting | [optional] 
**requires_separate_voucher** | **BOOLEAN** | true if a separate voucher is required | [optional] 
**sequence** | **Integer** | determines in which order the types should be listed. No 1 is listed first | [optional] 
**is_inactive** | **BOOLEAN** | true if the payment type should be hidden from available payment types | [optional] 


