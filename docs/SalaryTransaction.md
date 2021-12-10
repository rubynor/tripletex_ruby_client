# TripletexRubyClient::SalaryTransaction

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**date** | **String** | Voucher date. | [optional] 
**year** | **Integer** |  | 
**month** | **Integer** |  | 
**is_historical** | **BOOLEAN** | With historical wage vouchers you can update the wage system with information dated before the opening balance. | [optional] 
**pay_slips_available_date** | **String** | The date payslips are made available to the employee. Defaults to voucherDate. | [optional] 
**payslips** | [**Array&lt;Payslip&gt;**](Payslip.md) | Link to individual payslip objects. | 


