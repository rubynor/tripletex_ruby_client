# TripletexRubyClient::Report

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**name** | **String** | The name of the report | [optional] 
**description** | **String** | Description | [optional] 
**help_component** | **Integer** | helpComponent | [optional] 
**groups** | [**Array&lt;ReportGroup&gt;**](ReportGroup.md) | The report must have exactly two groups. The first specifies the columns, the second specifies the rows. | [optional] 
**owner** | [**Employee**](Employee.md) | owner | [optional] 
**cells** | [**Array&lt;ReportCell&gt;**](ReportCell.md) | The custom cells | [optional] 


