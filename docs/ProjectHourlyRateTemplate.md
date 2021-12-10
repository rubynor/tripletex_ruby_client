# TripletexRubyClient::ProjectHourlyRateTemplate

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**start_date** | **String** |  | [optional] 
**show_in_project_order** | **BOOLEAN** | Show on contract confirmation/offers | [optional] 
**hourly_rate_model** | **String** | Defines the model used for the hourly rate. | [optional] 
**project_specific_rates** | [**Array&lt;ProjectSpecificRateTemplate&gt;**](ProjectSpecificRateTemplate.md) | Project specific rates if hourlyRateModel is TYPE_PROJECT_SPECIFIC_HOURLY_RATES.  | [optional] 
**fixed_rate** | **Float** | Fixed Hourly rates if hourlyRateModel is TYPE_FIXED_HOURLY_RATE. | [optional] 


