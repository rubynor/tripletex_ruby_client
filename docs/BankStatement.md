# TripletexRubyClient::BankStatement

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**opening_balance_currency** | **Float** | Opening balance on the account. | [optional] 
**closing_balance_currency** | **Float** | Closing balance on the account. | [optional] 
**file_name** | **String** | Bank statement file name. | [optional] 
**bank** | [**Bank**](Bank.md) | Bank | [optional] 
**from_date** | **String** |  | [optional] 
**to_date** | **String** |  | [optional] 
**transactions** | [**Array&lt;BankTransaction&gt;**](BankTransaction.md) | Bank transactions tied to the bank statement | [optional] 


