# TripletexRubyClient::Payment

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**payment_date** | **String** |  | [optional] 
**booking_date** | **String** |  | [optional] 
**value_date** | **String** |  | [optional] 
**amount_currency** | **Float** | In the specified currency. | [optional] 
**currency** | [**Currency**](Currency.md) |  | [optional] 
**creditor_bank_name** | **String** |  | [optional] 
**creditor_bank_address** | **String** |  | [optional] 
**creditor_bank_postal_code** | **String** |  | [optional] 
**creditor_bank_postal_city** | **String** |  | [optional] 
**status** | **String** | The payment status.NOT_APPROVED: Payment not approved yet.&lt;br&gt;APPROVED: Payment approved, but not yet sent to bank.&lt;br&gt;SENT_TO_AUTOPAY: Payment sent to bank.&lt;br&gt;RECEIVED_BY_BANK: Payment received by the bank.&lt;br&gt;ACCEPTED_BY_BANK: Payment that was accepted by the bank.&lt;br&gt;FAILED: Payment that failed.&lt;br&gt;CANCELLED: Cancelled payment.&lt;br&gt;SUCCESS: Payment that ended successfully.&lt;br&gt; | [optional] 
**status_id** | **String** | The payment status Id. Usually all the payments in one batch have the same status ID, at least to the point of being received by bank.NEW: Payment is new.&lt;br&gt;PENDING_SIGNING: Payment is sent to AutoPay but not signed yet, requires re-approving.&lt;br&gt;CANCELLED: Payment was cancelled by ERP.&lt;br&gt;ERROR: Payment that failed.&lt;br&gt;RECEIVED_BY_BANK: Payment was received by the bank.&lt;br&gt;ACCEPTED_BY_BANK: Payment was accepted by bank.&lt;br&gt;CANCELLED_IN_BANK: Payment was cancelled in bank.&lt;br&gt;REJECTED_BY_BANK: Payment was rejected by bank.&lt;br&gt;PAID: Payment is paid.&lt;br&gt;OTHER: In case status in unknown. Will never be a final status.&lt;br&gt; | [optional] 
**is_final_status** | **BOOLEAN** |  | [optional] 
**is_foreign_payment** | **BOOLEAN** |  | [optional] 
**is_salary** | **BOOLEAN** |  | [optional] 
**description** | **String** |  | [optional] 
**kid** | **String** | KID - Kundeidentifikasjonsnummer. | [optional] 
**receiver_reference** | **String** |  | [optional] 
**source_voucher** | [**Voucher**](Voucher.md) | Vouchere that was paid. | [optional] 
**postings** | [**Posting**](Posting.md) | The payment posting. | [optional] 
**account** | [**Account**](Account.md) | The payment account. | [optional] 
**amount_in_account_currency** | **Float** | Amount specified in the currency of the bank agreements account. | [optional] 


