# TripletexRubyClient::VatType

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**name** | **String** |  | [optional] 
**number** | **String** |  | [optional] 
**percentage** | **Float** |  | [optional] 
**deduction_percentage** | **Float** | Percentage of the VAT amount that is deducted. Always 100% for all predefined VAT types, but can be lower for custom types for relative VAT. | [optional] 
**parent_type** | [**VatType**](VatType.md) | Only used on custom VAT types for relative VAT, gives the link to the parent VAT type. For most purposes the custom VAT type will behave like the parent VAT type, but with different deduction. | [optional] 


