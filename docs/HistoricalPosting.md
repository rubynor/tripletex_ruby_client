# TripletexRubyClient::HistoricalPosting

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**voucher** | [**Voucher**](Voucher.md) |  | [optional] 
**date** | **String** | The posting date. | 
**description** | **String** | The description of the posting. | [optional] 
**account** | [**Account**](Account.md) | The ledger account of the posting. | 
**customer** | [**Customer**](Customer.md) |  | [optional] 
**supplier** | [**Supplier**](Supplier.md) |  | [optional] 
**employee** | [**Employee**](Employee.md) |  | [optional] 
**project** | [**Project**](Project.md) |  | [optional] 
**product** | [**Product**](Product.md) |  | [optional] 
**department** | [**Department**](Department.md) |  | [optional] 
**vat_type** | [**VatType**](VatType.md) |  | [optional] 
**amount** | **Float** | The posting amount in company currency. Important: The amounts in this amount field must have sum &#x3D; 0 on all the dates. If multiple postings with different dates, then the sum must be 0 on each of the dates. | 
**amount_currency** | **Float** | The posting amount in posting currency. | 
**amount_gross** | **Float** | The posting gross amount in company currency. | 
**amount_gross_currency** | **Float** | The posting gross amount in posting currency. | 
**amount_vat** | **Float** | The amount of vat on this posting in company currency (NOK). | 
**currency** | [**Currency**](Currency.md) | Posting currency. | 
**invoice_number** | **String** | Invoice number. | [optional] 
**term_of_payment** | **String** | Due date. | [optional] 
**close_group** | **String** | Optional. Used to create a close group for postings. | [optional] 


