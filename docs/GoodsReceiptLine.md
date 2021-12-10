# TripletexRubyClient::GoodsReceiptLine

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**purchase_order** | [**PurchaseOrder**](PurchaseOrder.md) |  | [optional] 
**product** | [**Product**](Product.md) |  | 
**inventory** | [**Inventory**](Inventory.md) | If not entered, the default warehouse will be used | [optional] 
**inventory_location** | [**InventoryLocation**](InventoryLocation.md) | Inventory location field -- pilot program | [optional] 
**quantity_ordered** | **Float** |  | [optional] 
**quantity_received** | **Float** |  | 
**quantity_rest** | **Float** |  | [optional] 
**deviation** | **Float** |  | [optional] 


