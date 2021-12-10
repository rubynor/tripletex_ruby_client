# TripletexRubyClient::Prospect

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**name** | **String** |  | [optional] 
**description** | **String** |  | [optional] 
**created_date** | **String** |  | 
**customer** | [**Customer**](Customer.md) |  | [optional] 
**sales_employee** | [**Employee**](Employee.md) |  | [optional] 
**is_closed** | **BOOLEAN** |  | [optional] 
**closed_reason** | **Integer** |  | [optional] 
**closed_date** | **String** |  | [optional] 
**competitor** | **String** |  | [optional] 
**prospect_type** | **Integer** |  | [optional] 
**project** | [**Project**](Project.md) | The project connected to this prospect. | [optional] 
**project_offer** | [**Project**](Project.md) | The project offer connected to this prospect. | [optional] 
**final_income_date** | **String** | The estimated start date for income on the prospect. | [optional] 
**final_initial_value** | **Float** | The estimated startup fee on this prospect. | [optional] 
**final_monthly_value** | **Float** | The estimated monthly fee on this prospect. | [optional] 
**final_additional_services_value** | **Float** | Tripletex specific. | [optional] 
**total_value** | **Float** | The estimated total fee on this prospect. | [optional] 


