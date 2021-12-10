# TripletexRubyClient::SalarySpecificationInternal

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**specification_type** | **String** | Type of specification; only TYPE_MANUAL are user create- and editable | [optional] 
**rate** | **Float** |  | [optional] 
**count** | **Float** |  | [optional] 
**project** | [**Project**](Project.md) |  | [optional] 
**department** | [**Department**](Department.md) |  | [optional] 
**salary_type** | [**SalaryTypeInternal**](SalaryTypeInternal.md) |  | [optional] 
**payslip** | [**PayslipInternal**](PayslipInternal.md) |  | [optional] 
**employee** | [**Employee**](Employee.md) |  | [optional] 
**description** | **String** |  | [optional] 
**year** | **Integer** |  | [optional] 
**month** | **Integer** |  | [optional] 
**amount** | **Float** |  | [optional] 
**supplement** | [**SalarySpecSupplementInternal**](SalarySpecSupplementInternal.md) | Salary specification supplement. Required if the salaryType requires supplementary information. | [optional] 
**external_changes_since_last_time** | **BOOLEAN** |  | [optional] 


