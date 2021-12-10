# TripletexRubyClient::Employment

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**employee** | [**Employee**](Employee.md) |  | [optional] 
**employment_id** | **String** | Existing employment ID used by the current accounting system | [optional] 
**start_date** | **String** |  | 
**end_date** | **String** |  | [optional] 
**employment_end_reason** | **String** | Define the employment end reason. | [optional] 
**division** | [**Division**](Division.md) |  | [optional] 
**last_salary_change_date** | **String** |  | [optional] 
**no_employment_relationship** | **BOOLEAN** | Activate pensions and other benefits with no employment relationship. | [optional] 
**is_main_employer** | **BOOLEAN** | Determines if company is main employer for the employee. Default value is true.&lt;br /&gt;Some values will be default set if not sent upon creation of employment: &lt;br/&gt; If isMainEmployer is NOT sent and tax deduction code loennFraHovedarbeidsgiver is sent, isMainEmployer will be set to true. &lt;br /&gt; If isMainEmployer is NOT sent and tax deduction code loennFraBiarbeidsgiver is sent, isMainEmployer will be set to false. &lt;br /&gt; If true and deduction code is NOT sent, value of tax deduction code will be set to loennFraHovedarbeidsgiver. &lt;br /&gt; If false and deduction code is NOT sent, value of tax deduction code will be set to loennFraBiarbeidsgiver. &lt;br /&gt; For other types of Tax Deduction Codes, isMainEmployer does not influence anything. | [optional] 
**tax_deduction_code** | **String** | EMPTY - represents that a tax deduction code is not set on the employment. It is illegal to set the field to this value.  &lt;br /&gt; Default value of this field is loennFraHovedarbeidsgiver or loennFraBiarbeidsgiver depending on boolean isMainEmployer | [optional] 
**employment_details** | [**Array&lt;EmploymentDetails&gt;**](EmploymentDetails.md) | Employment types tied to the employment | [optional] 


