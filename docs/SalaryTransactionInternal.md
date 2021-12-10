# TripletexRubyClient::SalaryTransactionInternal

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
**period_as_string** | **String** |  | [optional] 
**is_historical** | **BOOLEAN** | With historical wage vouchers you can update the wage system with information dated before the opening balance. | [optional] 
**payroll_tax_calc_method** | **String** | Employee National Insurance calculation method | [optional] 
**voucher_comment** | **String** | Comment on voucher | [optional] 
**payslip_general_comment** | **String** | Comment to be shown on all payslips | [optional] 
**completed** | **BOOLEAN** |  | [optional] 
**pay_slips_available_date** | **String** | The date payslips are made available to the employee. Defaults to voucherDate. | [optional] 
**is_filtered_on_regular_salary** | **BOOLEAN** |  | [optional] 
**is_filtered_on_open_posts** | **BOOLEAN** |  | [optional] 
**is_filtered_on_travel_expenses** | **BOOLEAN** |  | [optional] 
**is_filtered_on_expenses** | **BOOLEAN** |  | [optional] 
**is_nets_module_remit** | **BOOLEAN** |  | [optional] 
**is_autopay_module_remit** | **BOOLEAN** |  | [optional] 
**has_bank_transfers** | **BOOLEAN** |  | [optional] 
**payslips** | [**Array&lt;PayslipInternal&gt;**](PayslipInternal.md) | Link to individual payslip objects. | 


