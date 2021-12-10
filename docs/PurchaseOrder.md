# TripletexRubyClient::PurchaseOrder

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**number** | **String** | Purchase order number | [optional] 
**receiver_email** | **String** | Email when purchase order is send by email. | [optional] 
**discount** | **Float** | Discount Percentage | [optional] 
**packing_note_message** | **String** | Message on packing note.Wholesaler specific. | [optional] 
**transporter_message** | **String** | Message to transporter.Wholesaler specific. | [optional] 
**comments** | **String** | Delivery information and invoice comments | [optional] 
**supplier** | [**Supplier**](Supplier.md) |  | 
**delivery_date** | **String** |  | 
**order_lines** | [**Array&lt;PurchaseOrderline&gt;**](PurchaseOrderline.md) | Order lines tied to the purchase order | [optional] 
**project** | [**Project**](Project.md) | Project/order | [optional] 
**department** | [**Department**](Department.md) | Department/order | [optional] 
**delivery_address** | [**Address**](Address.md) | Delivery address | [optional] 
**creation_date** | **String** |  | [optional] 
**is_closed** | **BOOLEAN** |  | [optional] 
**our_contact** | [**Employee**](Employee.md) |  | 
**supplier_contact** | [**Employee**](Employee.md) | Recipient when purchase order is send by email. | [optional] 
**attention** | [**Employee**](Employee.md) | Attention | [optional] 
**status** | **String** |  | [optional] 
**currency** | [**Currency**](Currency.md) | Company currency | [optional] 
**restorder** | [**PurchaseOrder**](PurchaseOrder.md) |  | [optional] 
**transport_type** | [**TransportType**](TransportType.md) | Transport type | [optional] 
**pickup_point** | [**PickupPoint**](PickupPoint.md) | Pickup point, wholesaler specific | [optional] 
**document** | [**Document**](Document.md) | The PDF representing this PurchaseOrder | [optional] 
**attachment** | [**Document**](Document.md) | The attachments on this PurchaseOrder (if any) | [optional] 
**edi_document** | [**Document**](Document.md) | The machine readable document (such as EHF or EFO/NELFO) this PurchaseOrder is based on (if any) | [optional] 


