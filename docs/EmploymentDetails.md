# TripletexRubyClient::EmploymentDetails

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**employment** | [**Employment**](Employment.md) |  | [optional] 
**date** | **String** |  | [optional] 
**employment_type** | **String** | Define the employment type. | [optional] 
**employment_form** | **String** | Define the employment form. | [optional] 
**maritime_employment** | [**MaritimeEmployment**](MaritimeEmployment.md) |  | [optional] 
**remuneration_type** | **String** | Define the remuneration type. | [optional] 
**working_hours_scheme** | **String** | Define the working hours scheme type. If you enter a value for SHIFT WORK, you must also enter value for shiftDurationHours | [optional] 
**shift_duration_hours** | **Float** |  | [optional] 
**occupation_code** | [**OccupationCode**](OccupationCode.md) | To find the right value to enter in this field, you could go to GET /employee/employment/occupationCode to get a list of valid ID&#39;s. | [optional] 
**percentage_of_full_time_equivalent** | **Float** |  | 
**annual_salary** | **Float** |  | [optional] 
**hourly_wage** | **Float** |  | [optional] 
**payroll_tax_municipality_id** | [**Municipality**](Municipality.md) |  | [optional] 


