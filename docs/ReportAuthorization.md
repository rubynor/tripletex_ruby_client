# TripletexRubyClient::ReportAuthorization

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**granter** | [**Employee**](Employee.md) | The one granting permission | 
**subject** | [**Employee**](Employee.md) | The one receiving permission | 
**report** | [**Report**](Report.md) | The target resource to be granted permissions for | 
**status** | **String** | The status of this grant of authorization | 
**permission** | **String** | The specific permission this grant of authorization is for | 


