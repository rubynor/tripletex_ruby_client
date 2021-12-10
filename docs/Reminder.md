# TripletexRubyClient::Reminder

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**reminder_date** | **String** | Creation date of the invoice reminder. | [optional] 
**charge** | **Float** | The fee part of the reminder, in the company&#39;s currency. | [optional] 
**charge_currency** | **Float** | The fee part of the reminder, in the invoice currency. | [optional] 
**total_charge** | **Float** | The total fee part of all reminders, in the company&#39;s currency. | [optional] 
**total_charge_currency** | **Float** | The total fee part of all reminders, in the invoice currency. | [optional] 
**total_amount_currency** | **Float** | The total amount to pay in reminder&#39;s currency. | [optional] 
**interests** | **Float** | The interests part of the reminder. | [optional] 
**interest_rate** | **Float** | The reminder interest rate. | [optional] 
**term_of_payment** | **String** | The reminder term of payment date. | 
**currency** | [**Currency**](Currency.md) | The reminder currency. | [optional] 
**type** | **String** |  | 
**comment** | **String** |  | [optional] 
**kid** | **String** | KID - Kundeidentifikasjonsnummer. | [optional] 
**bank_account_number** | **String** |  | [optional] 
**bank_account_iban** | **String** |  | [optional] 
**bank_account_swift** | **String** |  | [optional] 
**bank** | **String** |  | [optional] 


