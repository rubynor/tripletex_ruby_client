# TripletexRubyClient::Supplier

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**name** | **String** |  | 
**organization_number** | **String** |  | [optional] 
**supplier_number** | **Integer** |  | [optional] 
**customer_number** | **Integer** |  | [optional] 
**is_supplier** | **BOOLEAN** |  | [optional] 
**is_customer** | **BOOLEAN** | Determine if the supplier is also a customer | [optional] 
**is_inactive** | **BOOLEAN** |  | [optional] 
**email** | **String** |  | [optional] 
**bank_accounts** | **Array&lt;String&gt;** | [DEPRECATED] List of the bank account numbers for this supplier.  Norwegian bank account numbers only. | [optional] 
**invoice_email** | **String** |  | [optional] 
**overdue_notice_email** | **String** | The email address of the customer where the noticing emails are sent in case of an overdue | [optional] 
**phone_number** | **String** |  | [optional] 
**phone_number_mobile** | **String** |  | [optional] 
**description** | **String** |  | [optional] 
**is_private_individual** | **BOOLEAN** |  | [optional] 
**show_products** | **BOOLEAN** |  | [optional] 
**account_manager** | [**Employee**](Employee.md) |  | [optional] 
**postal_address** | [**Address**](Address.md) |  | [optional] 
**physical_address** | [**Address**](Address.md) |  | [optional] 
**delivery_address** | [**DeliveryAddress**](DeliveryAddress.md) |  | [optional] 
**category1** | [**CustomerCategory**](CustomerCategory.md) | Category 1 of this supplier | [optional] 
**category2** | [**CustomerCategory**](CustomerCategory.md) | Category 2 of this supplier | [optional] 
**category3** | [**CustomerCategory**](CustomerCategory.md) | Category 3 of this supplier | [optional] 
**bank_account_presentation** | [**Array&lt;CompanyBankAccountPresentation&gt;**](CompanyBankAccountPresentation.md) | List of bankAccount for this supplier | [optional] 
**currency** | [**Currency**](Currency.md) | The preferred currency for this supplier | [optional] 
**ledger_account** | [**Account**](Account.md) | Can be used to specify the ledger account of the supplier if it&#39;s different from the default 2400 account | [optional] 


