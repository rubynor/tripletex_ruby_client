# TripletexRubyClient::PurchaseOrderline

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**purchase_order** | [**PurchaseOrder**](PurchaseOrder.md) | The purchase order to attach the orderline. | 
**product** | [**Product**](Product.md) |  | [optional] 
**description** | **String** |  | [optional] 
**count** | **Float** |  | [optional] 
**unit_cost_currency** | **Float** | Unit price purchase (cost) excluding VAT in the order&#39;s currency | [optional] 
**unit_price_excluding_vat_currency** | **Float** | Unit price of purchase excluding VAT in the order&#39;s currency.If it&#39;s not specified,it takes the value from purchase price in productDTO | [optional] 
**currency** | [**Currency**](Currency.md) | The order line&#39;s currency. Determined by the order&#39;s currency. | [optional] 
**discount** | **Float** | Discount given as a percentage (%) | [optional] 
**amount_excluding_vat_currency** | **Float** | Total amount on order line excluding VAT in the order&#39;s currency | [optional] 
**amount_including_vat_currency** | **Float** | Total amount on order line including VAT in the order&#39;s currency | [optional] 


