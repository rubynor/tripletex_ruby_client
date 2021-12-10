# TripletexRubyClient::ProjectTemplate

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** |  | [optional] 
**start_date** | **String** |  | [optional] 
**end_date** | **String** |  | [optional] 
**is_internal** | **BOOLEAN** |  | [optional] 
**number** | **String** |  | [optional] 
**display_name_format** | **String** |  | [optional] 
**project_manager** | [**Employee**](Employee.md) |  | [optional] 
**department** | [**Department**](Department.md) |  | [optional] 
**main_project** | [**Project**](Project.md) |  | [optional] 
**project_category** | [**ProjectCategory**](ProjectCategory.md) |  | [optional] 
**reference** | **String** |  | [optional] 
**external_accounts_number** | **String** |  | [optional] 
**description** | **String** |  | [optional] 
**invoice_comment** | **String** | Comment for project invoices | [optional] 
**attention** | [**Contact**](Contact.md) | Customer in attention of person | [optional] 
**contact** | [**Contact**](Contact.md) | Customer contact person. | [optional] 
**customer** | [**Customer**](Customer.md) | The project&#39;s customer | [optional] 
**delivery_address** | [**DeliveryAddress**](DeliveryAddress.md) |  | [optional] 
**vat_type** | [**VatType**](VatType.md) | The default vat type for this project. | [optional] 
**currency** | [**Currency**](Currency.md) |  | [optional] 
**mark_up_order_lines** | **Float** | Set mark-up (%) for order lines. | [optional] 
**mark_up_fees_earned** | **Float** | Set mark-up (%) for fees earned. | [optional] 
**is_fixed_price** | **BOOLEAN** | Project is fixed price if set to true, hourly rate if set to false. | [optional] 
**fixedprice** | **Float** | Fixed price amount, in the project&#39;s currency. | [optional] 
**is_price_ceiling** | **BOOLEAN** | Set to true if an hourly rate project has a price ceiling. | [optional] 
**price_ceiling_amount** | **Float** | Price ceiling amount, in the project&#39;s currency. | [optional] 
**general_project_activities_per_project_only** | **BOOLEAN** | Set to true if a general project activity must be linked to project to allow time tracking. | [optional] 
**for_participants_only** | **BOOLEAN** | Set to true if only project participants can register information on the project | [optional] 
**project_hourly_rates** | [**Array&lt;ProjectHourlyRateTemplate&gt;**](ProjectHourlyRateTemplate.md) | Project Rate Types tied to the project. | [optional] 


