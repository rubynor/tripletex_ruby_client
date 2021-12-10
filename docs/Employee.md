# TripletexRubyClient::Employee

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**first_name** | **String** |  | 
**last_name** | **String** |  | 
**display_name** | **String** |  | [optional] 
**employee_number** | **String** |  | [optional] 
**date_of_birth** | **String** |  | [optional] 
**email** | **String** |  | [optional] 
**phone_number_mobile_country** | [**Country**](Country.md) | The country of the mobile phone number. If not set, the country is derived as best as possible from phoneNumberMobile. NB! 8 digit numbers are assumed to be Norwegian. | [optional] 
**phone_number_mobile** | **String** |  | [optional] 
**phone_number_home** | **String** |  | [optional] 
**phone_number_work** | **String** |  | [optional] 
**national_identity_number** | **String** |  | [optional] 
**dnumber** | **String** |  | [optional] 
**international_id** | [**InternationalId**](InternationalId.md) |  | [optional] 
**bank_account_number** | **String** |  | [optional] 
**iban** | **String** | IBAN field | [optional] 
**bic** | **String** | Bic (swift) field | [optional] 
**creditor_bank_country_id** | **Integer** | Country of creditor bank field | [optional] 
**uses_abroad_payment** | **BOOLEAN** | UsesAbroadPayment field. Determines if we should use domestic or abroad remittance. To be able to use abroad remittance, one has to: 1: have Autopay 2: have valid combination of the fields Iban, Bic (swift) and Country of creditor bank.  | [optional] 
**user_type** | **String** | Define the employee&#39;s user type.&lt;br&gt;STANDARD: Reduced access. Users with limited system entitlements.&lt;br&gt;EXTENDED: Users can be given all system entitlements.&lt;br&gt;NO_ACCESS: User with no log on access.&lt;br&gt;Users with access to Tripletex must confirm the email address. | [optional] 
**allow_information_registration** | **BOOLEAN** | Determines if salary information can be registered on the user including hours, travel expenses and employee expenses. The user may also be selected as a project member on projects. | [optional] 
**is_contact** | **BOOLEAN** |  | [optional] 
**comments** | **String** |  | [optional] 
**address** | [**Address**](Address.md) | Address tied to the employee | [optional] 
**department** | [**Department**](Department.md) |  | [optional] 
**employments** | [**Array&lt;Employment&gt;**](Employment.md) | Employments tied to the employee | [optional] 
**holiday_allowance_earned** | [**HolidayAllowanceEarned**](HolidayAllowanceEarned.md) |  | [optional] 
**employee_category** | [**EmployeeCategory**](EmployeeCategory.md) |  | [optional] 
**is_auth_project_overview_url** | **BOOLEAN** |  | [optional] 


