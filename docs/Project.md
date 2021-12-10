# TripletexRubyClient::Project

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**name** | **String** |  | 
**number** | **String** |  | [optional] 
**display_name** | **String** |  | [optional] 
**description** | **String** |  | [optional] 
**project_manager** | [**Employee**](Employee.md) |  | 
**department** | [**Department**](Department.md) |  | [optional] 
**main_project** | [**Project**](Project.md) |  | [optional] 
**start_date** | **String** |  | 
**end_date** | **String** |  | [optional] 
**customer** | [**Customer**](Customer.md) | The project&#39;s customer | [optional] 
**is_closed** | **BOOLEAN** |  | [optional] 
**is_ready_for_invoicing** | **BOOLEAN** |  | [optional] 
**is_internal** | **BOOLEAN** |  | 
**is_offer** | **BOOLEAN** |  | [optional] 
**is_fixed_price** | **BOOLEAN** | Project is fixed price if set to true, hourly rate if set to false. | [optional] 
**project_category** | [**ProjectCategory**](ProjectCategory.md) |  | [optional] 
**delivery_address** | [**DeliveryAddress**](DeliveryAddress.md) |  | [optional] 
**display_name_format** | **String** | Defines project name presentation in overviews. | [optional] 
**reference** | **String** |  | [optional] 
**external_accounts_number** | **String** |  | [optional] 
**discount_percentage** | **Float** | Project discount percentage. | [optional] 
**vat_type** | [**VatType**](VatType.md) | The default vat type for this project. | [optional] 
**fixedprice** | **Float** | Fixed price amount, in the project&#39;s currency. | [optional] 
**contribution_margin_percent** | **Float** |  | [optional] 
**number_of_sub_projects** | **Integer** |  | [optional] 
**number_of_project_participants** | **Integer** |  | [optional] 
**order_lines** | [**Array&lt;ProjectOrderLine&gt;**](ProjectOrderLine.md) | Order lines tied to the order | [optional] 
**currency** | [**Currency**](Currency.md) |  | [optional] 
**mark_up_order_lines** | **Float** | Set mark-up (%) for order lines. | [optional] 
**mark_up_fees_earned** | **Float** | Set mark-up (%) for fees earned. | [optional] 
**is_price_ceiling** | **BOOLEAN** | Set to true if an hourly rate project has a price ceiling. | [optional] 
**price_ceiling_amount** | **Float** | Price ceiling amount, in the project&#39;s currency. | [optional] 
**project_hourly_rates** | [**Array&lt;ProjectHourlyRate&gt;**](ProjectHourlyRate.md) | Project Rate Types tied to the project. | [optional] 
**for_participants_only** | **BOOLEAN** | Set to true if only project participants can register information on the project | [optional] 
**participants** | [**Array&lt;ProjectParticipant&gt;**](ProjectParticipant.md) | Link to individual project participants. | [optional] 
**contact** | [**Contact**](Contact.md) | Customer contact person. | [optional] 
**attention** | [**Contact**](Contact.md) | Customer in attention of person | [optional] 
**invoice_comment** | **String** | Comment for project invoices | [optional] 
**invoicing_plan** | [**Array&lt;Invoice&gt;**](Invoice.md) | Invoicing plans tied to the project | [optional] 
**preliminary_invoice** | [**Invoice**](Invoice.md) |  | [optional] 
**general_project_activities_per_project_only** | **BOOLEAN** | Set to true if a general project activity must be linked to project to allow time tracking. | [optional] 
**project_activities** | [**Array&lt;ProjectActivity&gt;**](ProjectActivity.md) | Project Activities | [optional] 
**hierarchy_name_and_number** | **String** |  | [optional] 
**invoice_due_date** | **Integer** | invoice due date | [optional] 
**invoice_receiver_email** | **String** | receiver email | [optional] 
**access_type** | **String** | READ/WRITE access on project | [optional] 
**use_product_net_price** | **BOOLEAN** |  | [optional] 
**ignore_company_product_discount_agreement** | **BOOLEAN** |  | [optional] 


