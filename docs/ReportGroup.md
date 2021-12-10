# TripletexRubyClient::ReportGroup

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**name** | **String** | The name to be shown for the column or row. | [optional] 
**description** | **String** | Currently not in use | [optional] 
**auto_group** | [**ReportGroupAutoGroup**](ReportGroupAutoGroup.md) | AutoGroup configuration, used to automatically generate sub-groups. | [optional] 
**expression** | **String** | Expression / formula according to Rule Engine Expression Language | [optional] 
**variable_name** | **String** | Variable name that can be used to reference this group | [optional] 
**value_format** | **String** | Format string for value (how to print number, date etc) | [optional] 
**cell_format** | **String** | Format string for cell (indentation, font size etc) | [optional] 
**hide_self** | **BOOLEAN** | Hide this group? | [optional] 
**filter** | [**ReportGroupFilter**](ReportGroupFilter.md) |  | [optional] 
**children** | [**Array&lt;ReportGroup&gt;**](ReportGroup.md) | Child groups | [optional] 
**reference** | **String** | Temporary reference id used for referring to groups before they are created | [optional] 


