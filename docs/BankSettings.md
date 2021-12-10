# TripletexRubyClient::BankSettings

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**tax_bank_agreement** | [**BankAgreement**](BankAgreement.md) |  | [optional] 
**remit_number_of_acceptors** | **Integer** | The remit number of acceptors. | [optional] 
**show_advice_currency_mismatch** | **BOOLEAN** | The showAdviceCurrencyMismatch property. | [optional] 
**payment_with_unknown_kid_parse_option** | **String** | Setting for whether incoming AutoPay payments without KID should be automatically posted, sent to voucher reception or ignored. | [optional] 
**sign_auto_pay_with_bank_id** | **BOOLEAN** | Setting for whether the user should have the option to sign payments and agreements with Bank ID in addition to 2FA. | [optional] 
**batch_booking_of_payments** | **BOOLEAN** | Setting for the user to use or not the batch booking for payments. | [optional] 
**employees_with_direct_remit_access** | [**Array&lt;Employee&gt;**](Employee.md) | Employees with payment access | [optional] 


