# TripletexRubyClient::TimesheetEntry

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**project** | [**Project**](Project.md) |  | [optional] 
**activity** | [**Activity**](Activity.md) |  | 
**date** | **String** |  | 
**hours** | **Float** |  | 
**chargeable_hours** | **Float** |  | [optional] 
**employee** | [**Employee**](Employee.md) |  | 
**time_clocks** | [**Array&lt;TimeClock&gt;**](TimeClock.md) | Link to stop watches on this hour. | [optional] 
**comment** | **String** |  | [optional] 
**locked** | **BOOLEAN** | Indicates if the hour can be changed. | [optional] 
**chargeable** | **BOOLEAN** |  | [optional] 
**invoice** | [**Invoice**](Invoice.md) |  | [optional] 
**hourly_rate** | **Float** |  | [optional] 
**hourly_cost** | **Float** |  | [optional] 
**hourly_cost_percentage** | **Float** |  | [optional] 


