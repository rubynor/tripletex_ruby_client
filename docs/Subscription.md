# TripletexRubyClient::Subscription

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**event** | **String** | Event name (from /v2/event) you wish to subscribe to. Form should be: *subject.verb*. | 
**target_url** | **String** | The callback URL used for subscriptions (including authentication tokens). Must be absolute and use HTTPS. Basic authentication is supported. | 
**fields** | **String** | The fields in the object delivered with the notification callback, nested as in other API calls. | [optional] 
**status** | **String** | The status of the subscription. | [optional] 
**auth_header_name** | **String** | Custom authentication header name | [optional] 
**auth_header_value** | **String** | Custom authentication header value (write only) | [optional] 


