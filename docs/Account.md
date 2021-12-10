# TripletexRubyClient::Account

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**number** | **Integer** |  | 
**name** | **String** |  | 
**description** | **String** |  | [optional] 
**type** | **String** |  | [optional] 
**legal_vat_types** | [**Array&lt;VatType&gt;**](VatType.md) | List of legal vat types for this account. | [optional] 
**ledger_type** | **String** | Supported ledger types, default is GENERAL. Only available for customers with the module multiple ledgers. | [optional] 
**vat_type** | [**VatType**](VatType.md) | The default vat type for this account. | [optional] 
**vat_locked** | **BOOLEAN** | True if all entries on this account must have the vat type given by vatType. | [optional] 
**currency** | [**Currency**](Currency.md) | If given, all entries on this account must have this currency. | [optional] 
**is_closeable** | **BOOLEAN** | True if it should be possible to close entries on this account and it is possible to filter on open entries. | [optional] 
**is_applicable_for_supplier_invoice** | **BOOLEAN** | True if this account is applicable for supplier invoice registration. | [optional] 
**require_reconciliation** | **BOOLEAN** | True if this account must be reconciled before the accounting period closure. | [optional] 
**is_inactive** | **BOOLEAN** | Inactive accounts will not show up in UI lists. | [optional] 
**is_bank_account** | **BOOLEAN** |  | [optional] 
**is_invoice_account** | **BOOLEAN** |  | [optional] 
**bank_account_number** | **String** |  | [optional] 
**bank_account_country** | [**Country**](Country.md) |  | [optional] 
**bank_name** | **String** |  | [optional] 
**bank_account_iban** | **String** |  | [optional] 
**bank_account_swift** | **String** |  | [optional] 


