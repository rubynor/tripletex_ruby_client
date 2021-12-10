# TripletexRubyClient::BankReconciliation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**account** | [**Account**](Account.md) |  | 
**accounting_period** | [**AccountingPeriod**](AccountingPeriod.md) |  | 
**voucher** | [**Voucher**](Voucher.md) |  | [optional] 
**transactions** | [**Array&lt;BankTransaction&gt;**](BankTransaction.md) | Bank transactions tied to the bank reconciliation | [optional] 
**is_closed** | **BOOLEAN** |  | [optional] 
**type** | **String** | Type of Bank Reconciliation. | 
**bank_account_closing_balance_currency** | **Float** |  | [optional] 
**closed_date** | **String** |  | [optional] 
**closed_by_contact** | [**Contact**](Contact.md) |  | [optional] 
**closed_by_employee** | [**Employee**](Employee.md) |  | [optional] 
**approvable** | **BOOLEAN** |  | [optional] 


