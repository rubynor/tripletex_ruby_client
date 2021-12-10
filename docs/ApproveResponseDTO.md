# TripletexRubyClient::ApproveResponseDTO

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**redirect_url** | **String** | The redirect URL to AutoPay 2FA after payments are sent to be approved | [optional] 
**to_be_approved** | [**Array&lt;Payment&gt;**](Payment.md) | List of payments that will be sent to AutoPay approval | [optional] 
**not_approved** | [**Array&lt;Payment&gt;**](Payment.md) | List of payments that won&#39;t be sent to AutoPay approval | [optional] 


