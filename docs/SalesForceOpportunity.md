# TripletexRubyClient::SalesForceOpportunity

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**all_prices** | **Hash&lt;String, Hash&lt;String, Float&gt;&gt;** | A nested map of all active sales modules. The key in the outer map is the sales module, whilst the inner map contains the different pricing types for the given sales module. A pricing type could be PER_USE(10). | [optional] 
**sum_startup_category1_users** | **Float** | The total startup price for users of category 1. | [optional] 
**sum_service_category1_users** | **Float** | The total price per monthly price for users of category 1. | [optional] 
**list_price_category1_user_startup** | **Float** | The startup list price per user. | [optional] 
**list_price_category1_user_service** | **Float** | The monthly list price per user. | [optional] 
**sum_startup** | **Float** | The startup price for the company. | [optional] 
**sum_service** | **Float** | The monthly price for the company. | [optional] 
**sum_additional_services** | **Float** | The total startup price for additional services. | [optional] 
**accountant_startup_provision** | **Float** | The initial provision for the accountant of the startup price (percentage) | [optional] 
**accountant_monthly_provision** | **Float** | The monthly provision for the accountant of the monthly price (percentage) | [optional] 
**no_of_users_prepaid** | **Integer** | The number of users prepaid when creating the company. | [optional] 
**no_of_users_included** | **Integer** | The number of users included for free in the purchased module. | [optional] 


