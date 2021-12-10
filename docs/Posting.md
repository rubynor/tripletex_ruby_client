# TripletexRubyClient::Posting

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**voucher** | [**Voucher**](Voucher.md) |  | [optional] 
**date** | **String** |  | [optional] 
**description** | **String** |  | [optional] 
**account** | [**Account**](Account.md) |  | [optional] 
**amortization_account** | [**Account**](Account.md) | The Amortization account. AmortizationAccountId, amortizationStartDate and amortizationEndDate should be provided. If amortizationStartDate and amortizationEndDate are provided, while amortizationAccountId is NULL, then the default amortization account will be used. | [optional] 
**amortization_start_date** | **String** | Amortization start date. AmortizationAccountId, amortizationStartDate and amortizationEndDate should be provided. | [optional] 
**amortization_end_date** | **String** |  | [optional] 
**customer** | [**Customer**](Customer.md) |  | [optional] 
**supplier** | [**Supplier**](Supplier.md) |  | [optional] 
**employee** | [**Employee**](Employee.md) |  | [optional] 
**project** | [**Project**](Project.md) |  | [optional] 
**product** | [**Product**](Product.md) |  | [optional] 
**department** | [**Department**](Department.md) |  | [optional] 
**vat_type** | [**VatType**](VatType.md) |  | [optional] 
**amount** | **Float** |  | [optional] 
**amount_currency** | **Float** |  | [optional] 
**amount_gross** | **Float** |  | [optional] 
**amount_gross_currency** | **Float** |  | [optional] 
**currency** | [**Currency**](Currency.md) |  | [optional] 
**close_group** | [**CloseGroup**](CloseGroup.md) |  | [optional] 
**invoice_number** | **String** |  | [optional] 
**term_of_payment** | **String** |  | [optional] 
**row** | **Integer** |  | [optional] 
**type** | **String** |  | [optional] 
**external_ref** | **String** | External reference for identifying payment basis of the posting, e.g., KID, customer identification or credit note number. | [optional] 
**system_generated** | **BOOLEAN** |  | [optional] 


