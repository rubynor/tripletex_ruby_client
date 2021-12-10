# TripletexRubyClient::ProjectHourlyRate

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**project** | [**Project**](Project.md) |  | [optional] 
**start_date** | **String** |  | 
**show_in_project_order** | **BOOLEAN** | Show on contract confirmation/offers | [optional] 
**hourly_rate_model** | **String** | Defines the model used for the hourly rate. | 
**project_specific_rates** | [**Array&lt;ProjectSpecificRate&gt;**](ProjectSpecificRate.md) | Project specific rates if hourlyRateModel is TYPE_PROJECT_SPECIFIC_HOURLY_RATES.  | [optional] 
**fixed_rate** | **Float** | Fixed Hourly rates if hourlyRateModel is TYPE_FIXED_HOURLY_RATE. | [optional] 


