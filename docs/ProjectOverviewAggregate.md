# TripletexRubyClient::ProjectOverviewAggregate

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**name** | **String** |  | [optional] 
**display_name** | **String** |  | [optional] 
**number** | **String** |  | [optional] 
**start_date** | **String** |  | [optional] 
**end_date** | **String** |  | [optional] 
**is_ready_for_invoicing** | **BOOLEAN** |  | [optional] 
**is_closed** | **BOOLEAN** |  | [optional] 
**is_fixed_price** | **BOOLEAN** |  | [optional] 
**is_internal** | **BOOLEAN** |  | [optional] 
**is_auth_project_overview_contract_type** | **BOOLEAN** |  | [optional] 
**project_manager** | [**Employee**](Employee.md) |  | [optional] 
**customer** | [**Company**](Company.md) |  | [optional] 
**main_project** | [**Project**](Project.md) |  | [optional] 
**department** | [**Department**](Department.md) |  | [optional] 
**project_category** | [**ProjectCategory**](ProjectCategory.md) |  | [optional] 
**planned_budget** | **Float** |  | [optional] 
**completed_budget** | **Float** |  | [optional] 
**access_type** | **String** | READ/WRITE access on project | [optional] 
**invoice_reserve_total_amount_currency** | **Float** |  | [optional] 
**invoice_akonto_reserve_amount_currency** | **Float** |  | [optional] 
**invoice_extracosts_reserve_currency** | **Float** |  | [optional] 
**invoice_fee_reserve_currency** | **Float** |  | [optional] 


