# TripletexRubyClient::BankReconciliationMatch

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**bank_reconciliation** | [**BankReconciliation**](BankReconciliation.md) |  | 
**type** | **String** | Type of match, MANUAL and APPROVED_SUGGESTION are considered part of reconciliation. | [optional] 
**transactions** | [**Array&lt;BankTransaction&gt;**](BankTransaction.md) | Match transactions | [optional] 
**postings** | [**Array&lt;Posting&gt;**](Posting.md) | Match postings | [optional] 


