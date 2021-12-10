# TripletexRubyClient::ProjectOrderLine

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**product** | [**Product**](Product.md) |  | [optional] 
**inventory** | [**Inventory**](Inventory.md) |  | [optional] 
**inventory_location** | [**InventoryLocation**](InventoryLocation.md) | Inventory location field -- beta program | [optional] 
**description** | **String** |  | [optional] 
**count** | **Float** |  | [optional] 
**unit_cost_currency** | **Float** | Unit price purchase (cost) excluding VAT in the order&#39;s currency | [optional] 
**unit_price_excluding_vat_currency** | **Float** | Unit price of purchase excluding VAT in the order&#39;s currency | [optional] 
**currency** | [**Currency**](Currency.md) | The order line&#39;s currency. Determined by the order&#39;s currency. | [optional] 
**markup** | **Float** | Markup given as a percentage (%) | [optional] 
**discount** | **Float** | Discount given as a percentage (%) | [optional] 
**vat_type** | [**VatType**](VatType.md) |  | [optional] 
**amount_excluding_vat_currency** | **Float** | Total amount on order line excluding VAT in the order&#39;s currency | [optional] 
**amount_including_vat_currency** | **Float** | Total amount on order line including VAT in the order&#39;s currency | [optional] 
**project** | [**Project**](Project.md) |  | 
**date** | **String** |  | 
**is_chargeable** | **BOOLEAN** |  | [optional] 
**is_budget** | **BOOLEAN** |  | [optional] 
**invoice** | [**Invoice**](Invoice.md) |  | [optional] 


