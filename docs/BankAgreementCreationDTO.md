# TripletexRubyClient::BankAgreementCreationDTO

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**bank_id** | **Integer** | Bank ID | 
**account_in_bank_id** | **String** | Customer number in bank | [optional] 
**ccm_agreement_id** | **String** | Customer Id from Bank | [optional] 
**division** | **String** | Division (DNB only) | [optional] 
**organization_number** | **String** | Organization number | [optional] 
**electronic_creation** | **BOOLEAN** | Electronic agreement creation initiated. | [optional] 
**approve_in_online_banking** | **BOOLEAN** | Accounting approve payments | [optional] 
**bank_accounts** | [**Array&lt;Account&gt;**](Account.md) | JSON representing a list of new object to be created. Should not have ID and version set. | 


