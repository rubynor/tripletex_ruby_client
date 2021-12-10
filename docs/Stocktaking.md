# TripletexRubyClient::Stocktaking

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**number** | **Integer** |  | [optional] 
**date** | **String** |  | 
**comment** | **String** |  | [optional] 
**type_of_stocktaking** | **String** | [Deprecated] Define the type of stoctaking.&lt;br&gt;ALL_PRODUCTS_WITH_INVENTORIES: Create a stocktaking for all products with inventories.&lt;br&gt;INCLUDE_PRODUCTS: Create a stocktaking which includes all products.&lt;br&gt;NO_PRODUCTS: Create a stocktaking without products.&lt;br&gt;If not specified, the value &#39;ALL_PRODUCTS_WITH_INVENTORIES&#39; is used. | [optional] 
**inventory** | [**Inventory**](Inventory.md) | The inventory this applies for | 
**is_completed** | **BOOLEAN** |  | [optional] 


