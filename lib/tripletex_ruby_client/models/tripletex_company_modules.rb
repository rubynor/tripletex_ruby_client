=begin
#Tripletex API

### Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'date'

module TripletexRubyClient
  class TripletexCompanyModules
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    attr_accessor :company_id

    attr_accessor :modulehourlist

    attr_accessor :module_travel_expense

    attr_accessor :module_invoice

    attr_accessor :moduleaccountinginternal

    attr_accessor :module_accounting_external

    attr_accessor :moduleproject

    attr_accessor :moduleproduct

    attr_accessor :modulecustomer

    attr_accessor :moduleemployee

    attr_accessor :moduledepartment

    attr_accessor :approveinvoices

    attr_accessor :approvehourlists

    attr_accessor :approvetravelreports

    attr_accessor :modulebudget

    attr_accessor :modulenote

    attr_accessor :moduletask

    attr_accessor :moduleresourceallocation

    attr_accessor :moduleprojecteconomy

    attr_accessor :modulereferencefee

    attr_accessor :modulehistorical

    attr_accessor :moduleprojectcategory

    attr_accessor :moduleprojectlocation

    attr_accessor :module_project_budget

    attr_accessor :modulesubscription

    attr_accessor :completeweeklyhourlists

    attr_accessor :completemonthlyhourlists

    attr_accessor :approvemonthlyhourlists

    attr_accessor :moduleprojectprognosis

    attr_accessor :modulebunches

    attr_accessor :module_vacation_balance

    attr_accessor :module_accounting_reports

    attr_accessor :module_customer_categories

    attr_accessor :module_customer_category1

    attr_accessor :module_customer_category2

    attr_accessor :module_customer_category3

    attr_accessor :moduleprojectsubcontract

    attr_accessor :module_payroll_accounting

    attr_accessor :module_time_balance

    attr_accessor :module_working_hours

    attr_accessor :module_currency

    attr_accessor :module_wage_export

    attr_accessor :module_auto_customer_number

    attr_accessor :module_auto_vendor_number

    attr_accessor :module_provision_salary

    attr_accessor :module_order_number

    attr_accessor :module_order_discount

    attr_accessor :module_order_markup

    attr_accessor :module_order_line_cost

    attr_accessor :module_stop_watch

    attr_accessor :module_contact

    attr_accessor :module_auto_project_number

    attr_accessor :module_swedish

    attr_accessor :module_resource_groups

    attr_accessor :module_ocr

    attr_accessor :module_travel_expense_rates

    attr_accessor :monthly_hourlist_minus_time_warning

    attr_accessor :module_voucher_scanning

    attr_accessor :module_invoice_scanning

    attr_accessor :module_project_participants

    attr_accessor :module_holyday_plan

    attr_accessor :module_employee_category

    attr_accessor :module_product_invoice

    attr_accessor :auto_invoicing

    attr_accessor :module_invoice_fee_comment

    attr_accessor :module_employee_accounting

    attr_accessor :module_department_accounting

    attr_accessor :module_project_accounting

    attr_accessor :module_product_accounting

    attr_accessor :module_subscription_address_list

    attr_accessor :module_electro

    attr_accessor :module_nrf

    attr_accessor :module_gtin

    attr_accessor :module_elproffen

    attr_accessor :module_rorkjop

    attr_accessor :module_order_ext

    attr_accessor :module_result_budget

    attr_accessor :module_amortization

    attr_accessor :module_change_debt_collector

    attr_accessor :module_voucher_types

    attr_accessor :module_onninen123

    attr_accessor :module_elektro_union

    attr_accessor :module_ahlsell_partner

    attr_accessor :module_archive

    attr_accessor :module_warehouse

    attr_accessor :module_project_budget_reference_fee

    attr_accessor :module_nets_eboks

    attr_accessor :module_nets_print_salary

    attr_accessor :module_nets_print_invoice

    attr_accessor :module_invoice_import

    attr_accessor :module_email

    attr_accessor :module_ocr_auto_pay

    attr_accessor :module_ehf

    attr_accessor :module_approve_voucher

    attr_accessor :module_approve_department_voucher

    attr_accessor :module_approve_project_voucher

    attr_accessor :module_order_out

    attr_accessor :module_mesan

    attr_accessor :module_divisions

    attr_accessor :module_boligmappa

    attr_accessor :module_addition_project_markup

    attr_accessor :module_wage_project_accounting

    attr_accessor :module_accountant_connect_client

    attr_accessor :module_wage_amortization

    attr_accessor :module_subscriptions_periodisation

    attr_accessor :module_activity_hourly_wage_wage_code

    attr_accessor :module_crm

    attr_accessor :module_api20

    attr_accessor :module_control_schema_required_invoicing

    attr_accessor :module_control_schema_required_hour_tracking

    attr_accessor :module_finance_tax

    attr_accessor :module_pensionreport

    attr_accessor :module_agro

    attr_accessor :module_mamut

    attr_accessor :module_invoice_option_paper

    attr_accessor :module_smart_scan

    attr_accessor :module_offer

    attr_accessor :module_auto_bank_reconciliation

    attr_accessor :module_voucher_automation

    attr_accessor :module_encrypted_pay_slip

    attr_accessor :module_invoice_option_vipps

    attr_accessor :module_invoice_option_efaktura

    attr_accessor :module_invoice_option_avtale_giro

    attr_accessor :module_factoring_aprila

    attr_accessor :module_cash_credit_aprila

    attr_accessor :module_invoice_option_autoinvoice_ehf

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'version' => :'version',
        :'changes' => :'changes',
        :'url' => :'url',
        :'company_id' => :'companyId',
        :'modulehourlist' => :'modulehourlist',
        :'module_travel_expense' => :'moduleTravelExpense',
        :'module_invoice' => :'moduleInvoice',
        :'moduleaccountinginternal' => :'moduleaccountinginternal',
        :'module_accounting_external' => :'moduleAccountingExternal',
        :'moduleproject' => :'moduleproject',
        :'moduleproduct' => :'moduleproduct',
        :'modulecustomer' => :'modulecustomer',
        :'moduleemployee' => :'moduleemployee',
        :'moduledepartment' => :'moduledepartment',
        :'approveinvoices' => :'approveinvoices',
        :'approvehourlists' => :'approvehourlists',
        :'approvetravelreports' => :'approvetravelreports',
        :'modulebudget' => :'modulebudget',
        :'modulenote' => :'modulenote',
        :'moduletask' => :'moduletask',
        :'moduleresourceallocation' => :'moduleresourceallocation',
        :'moduleprojecteconomy' => :'moduleprojecteconomy',
        :'modulereferencefee' => :'modulereferencefee',
        :'modulehistorical' => :'modulehistorical',
        :'moduleprojectcategory' => :'moduleprojectcategory',
        :'moduleprojectlocation' => :'moduleprojectlocation',
        :'module_project_budget' => :'moduleProjectBudget',
        :'modulesubscription' => :'modulesubscription',
        :'completeweeklyhourlists' => :'completeweeklyhourlists',
        :'completemonthlyhourlists' => :'completemonthlyhourlists',
        :'approvemonthlyhourlists' => :'approvemonthlyhourlists',
        :'moduleprojectprognosis' => :'moduleprojectprognosis',
        :'modulebunches' => :'modulebunches',
        :'module_vacation_balance' => :'moduleVacationBalance',
        :'module_accounting_reports' => :'moduleAccountingReports',
        :'module_customer_categories' => :'moduleCustomerCategories',
        :'module_customer_category1' => :'moduleCustomerCategory1',
        :'module_customer_category2' => :'moduleCustomerCategory2',
        :'module_customer_category3' => :'moduleCustomerCategory3',
        :'moduleprojectsubcontract' => :'moduleprojectsubcontract',
        :'module_payroll_accounting' => :'modulePayrollAccounting',
        :'module_time_balance' => :'moduleTimeBalance',
        :'module_working_hours' => :'moduleWorkingHours',
        :'module_currency' => :'moduleCurrency',
        :'module_wage_export' => :'moduleWageExport',
        :'module_auto_customer_number' => :'moduleAutoCustomerNumber',
        :'module_auto_vendor_number' => :'moduleAutoVendorNumber',
        :'module_provision_salary' => :'moduleProvisionSalary',
        :'module_order_number' => :'moduleOrderNumber',
        :'module_order_discount' => :'moduleOrderDiscount',
        :'module_order_markup' => :'moduleOrderMarkup',
        :'module_order_line_cost' => :'moduleOrderLineCost',
        :'module_stop_watch' => :'moduleStopWatch',
        :'module_contact' => :'moduleContact',
        :'module_auto_project_number' => :'moduleAutoProjectNumber',
        :'module_swedish' => :'moduleSwedish',
        :'module_resource_groups' => :'moduleResourceGroups',
        :'module_ocr' => :'moduleOcr',
        :'module_travel_expense_rates' => :'moduleTravelExpenseRates',
        :'monthly_hourlist_minus_time_warning' => :'monthlyHourlistMinusTimeWarning',
        :'module_voucher_scanning' => :'moduleVoucherScanning',
        :'module_invoice_scanning' => :'moduleInvoiceScanning',
        :'module_project_participants' => :'moduleProjectParticipants',
        :'module_holyday_plan' => :'moduleHolydayPlan',
        :'module_employee_category' => :'moduleEmployeeCategory',
        :'module_product_invoice' => :'moduleProductInvoice',
        :'auto_invoicing' => :'autoInvoicing',
        :'module_invoice_fee_comment' => :'moduleInvoiceFeeComment',
        :'module_employee_accounting' => :'moduleEmployeeAccounting',
        :'module_department_accounting' => :'moduleDepartmentAccounting',
        :'module_project_accounting' => :'moduleProjectAccounting',
        :'module_product_accounting' => :'moduleProductAccounting',
        :'module_subscription_address_list' => :'moduleSubscriptionAddressList',
        :'module_electro' => :'moduleElectro',
        :'module_nrf' => :'moduleNrf',
        :'module_gtin' => :'moduleGtin',
        :'module_elproffen' => :'moduleElproffen',
        :'module_rorkjop' => :'moduleRorkjop',
        :'module_order_ext' => :'moduleOrderExt',
        :'module_result_budget' => :'moduleResultBudget',
        :'module_amortization' => :'moduleAmortization',
        :'module_change_debt_collector' => :'moduleChangeDebtCollector',
        :'module_voucher_types' => :'moduleVoucherTypes',
        :'module_onninen123' => :'moduleOnninen123',
        :'module_elektro_union' => :'moduleElektroUnion',
        :'module_ahlsell_partner' => :'moduleAhlsellPartner',
        :'module_archive' => :'moduleArchive',
        :'module_warehouse' => :'moduleWarehouse',
        :'module_project_budget_reference_fee' => :'moduleProjectBudgetReferenceFee',
        :'module_nets_eboks' => :'moduleNetsEboks',
        :'module_nets_print_salary' => :'moduleNetsPrintSalary',
        :'module_nets_print_invoice' => :'moduleNetsPrintInvoice',
        :'module_invoice_import' => :'moduleInvoiceImport',
        :'module_email' => :'moduleEmail',
        :'module_ocr_auto_pay' => :'moduleOcrAutoPay',
        :'module_ehf' => :'moduleEhf',
        :'module_approve_voucher' => :'moduleApproveVoucher',
        :'module_approve_department_voucher' => :'moduleApproveDepartmentVoucher',
        :'module_approve_project_voucher' => :'moduleApproveProjectVoucher',
        :'module_order_out' => :'moduleOrderOut',
        :'module_mesan' => :'moduleMesan',
        :'module_divisions' => :'moduleDivisions',
        :'module_boligmappa' => :'moduleBoligmappa',
        :'module_addition_project_markup' => :'moduleAdditionProjectMarkup',
        :'module_wage_project_accounting' => :'moduleWageProjectAccounting',
        :'module_accountant_connect_client' => :'moduleAccountantConnectClient',
        :'module_wage_amortization' => :'moduleWageAmortization',
        :'module_subscriptions_periodisation' => :'moduleSubscriptionsPeriodisation',
        :'module_activity_hourly_wage_wage_code' => :'moduleActivityHourlyWageWageCode',
        :'module_crm' => :'moduleCRM',
        :'module_api20' => :'moduleApi20',
        :'module_control_schema_required_invoicing' => :'moduleControlSchemaRequiredInvoicing',
        :'module_control_schema_required_hour_tracking' => :'moduleControlSchemaRequiredHourTracking',
        :'module_finance_tax' => :'moduleFinanceTax',
        :'module_pensionreport' => :'modulePensionreport',
        :'module_agro' => :'moduleAgro',
        :'module_mamut' => :'moduleMamut',
        :'module_invoice_option_paper' => :'moduleInvoiceOptionPaper',
        :'module_smart_scan' => :'moduleSmartScan',
        :'module_offer' => :'moduleOffer',
        :'module_auto_bank_reconciliation' => :'moduleAutoBankReconciliation',
        :'module_voucher_automation' => :'moduleVoucherAutomation',
        :'module_encrypted_pay_slip' => :'moduleEncryptedPaySlip',
        :'module_invoice_option_vipps' => :'moduleInvoiceOptionVipps',
        :'module_invoice_option_efaktura' => :'moduleInvoiceOptionEfaktura',
        :'module_invoice_option_avtale_giro' => :'moduleInvoiceOptionAvtaleGiro',
        :'module_factoring_aprila' => :'moduleFactoringAprila',
        :'module_cash_credit_aprila' => :'moduleCashCreditAprila',
        :'module_invoice_option_autoinvoice_ehf' => :'moduleInvoiceOptionAutoinvoiceEhf'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'company_id' => :'Integer',
        :'modulehourlist' => :'BOOLEAN',
        :'module_travel_expense' => :'BOOLEAN',
        :'module_invoice' => :'BOOLEAN',
        :'moduleaccountinginternal' => :'BOOLEAN',
        :'module_accounting_external' => :'BOOLEAN',
        :'moduleproject' => :'BOOLEAN',
        :'moduleproduct' => :'BOOLEAN',
        :'modulecustomer' => :'BOOLEAN',
        :'moduleemployee' => :'BOOLEAN',
        :'moduledepartment' => :'BOOLEAN',
        :'approveinvoices' => :'BOOLEAN',
        :'approvehourlists' => :'BOOLEAN',
        :'approvetravelreports' => :'BOOLEAN',
        :'modulebudget' => :'BOOLEAN',
        :'modulenote' => :'BOOLEAN',
        :'moduletask' => :'BOOLEAN',
        :'moduleresourceallocation' => :'BOOLEAN',
        :'moduleprojecteconomy' => :'BOOLEAN',
        :'modulereferencefee' => :'BOOLEAN',
        :'modulehistorical' => :'BOOLEAN',
        :'moduleprojectcategory' => :'BOOLEAN',
        :'moduleprojectlocation' => :'BOOLEAN',
        :'module_project_budget' => :'BOOLEAN',
        :'modulesubscription' => :'BOOLEAN',
        :'completeweeklyhourlists' => :'BOOLEAN',
        :'completemonthlyhourlists' => :'BOOLEAN',
        :'approvemonthlyhourlists' => :'BOOLEAN',
        :'moduleprojectprognosis' => :'BOOLEAN',
        :'modulebunches' => :'BOOLEAN',
        :'module_vacation_balance' => :'BOOLEAN',
        :'module_accounting_reports' => :'BOOLEAN',
        :'module_customer_categories' => :'BOOLEAN',
        :'module_customer_category1' => :'BOOLEAN',
        :'module_customer_category2' => :'BOOLEAN',
        :'module_customer_category3' => :'BOOLEAN',
        :'moduleprojectsubcontract' => :'BOOLEAN',
        :'module_payroll_accounting' => :'BOOLEAN',
        :'module_time_balance' => :'BOOLEAN',
        :'module_working_hours' => :'BOOLEAN',
        :'module_currency' => :'BOOLEAN',
        :'module_wage_export' => :'BOOLEAN',
        :'module_auto_customer_number' => :'BOOLEAN',
        :'module_auto_vendor_number' => :'BOOLEAN',
        :'module_provision_salary' => :'BOOLEAN',
        :'module_order_number' => :'BOOLEAN',
        :'module_order_discount' => :'BOOLEAN',
        :'module_order_markup' => :'BOOLEAN',
        :'module_order_line_cost' => :'BOOLEAN',
        :'module_stop_watch' => :'BOOLEAN',
        :'module_contact' => :'BOOLEAN',
        :'module_auto_project_number' => :'BOOLEAN',
        :'module_swedish' => :'BOOLEAN',
        :'module_resource_groups' => :'BOOLEAN',
        :'module_ocr' => :'BOOLEAN',
        :'module_travel_expense_rates' => :'BOOLEAN',
        :'monthly_hourlist_minus_time_warning' => :'BOOLEAN',
        :'module_voucher_scanning' => :'BOOLEAN',
        :'module_invoice_scanning' => :'BOOLEAN',
        :'module_project_participants' => :'BOOLEAN',
        :'module_holyday_plan' => :'BOOLEAN',
        :'module_employee_category' => :'BOOLEAN',
        :'module_product_invoice' => :'BOOLEAN',
        :'auto_invoicing' => :'BOOLEAN',
        :'module_invoice_fee_comment' => :'BOOLEAN',
        :'module_employee_accounting' => :'BOOLEAN',
        :'module_department_accounting' => :'BOOLEAN',
        :'module_project_accounting' => :'BOOLEAN',
        :'module_product_accounting' => :'BOOLEAN',
        :'module_subscription_address_list' => :'BOOLEAN',
        :'module_electro' => :'BOOLEAN',
        :'module_nrf' => :'BOOLEAN',
        :'module_gtin' => :'BOOLEAN',
        :'module_elproffen' => :'BOOLEAN',
        :'module_rorkjop' => :'BOOLEAN',
        :'module_order_ext' => :'BOOLEAN',
        :'module_result_budget' => :'BOOLEAN',
        :'module_amortization' => :'BOOLEAN',
        :'module_change_debt_collector' => :'BOOLEAN',
        :'module_voucher_types' => :'BOOLEAN',
        :'module_onninen123' => :'BOOLEAN',
        :'module_elektro_union' => :'BOOLEAN',
        :'module_ahlsell_partner' => :'BOOLEAN',
        :'module_archive' => :'BOOLEAN',
        :'module_warehouse' => :'BOOLEAN',
        :'module_project_budget_reference_fee' => :'BOOLEAN',
        :'module_nets_eboks' => :'BOOLEAN',
        :'module_nets_print_salary' => :'BOOLEAN',
        :'module_nets_print_invoice' => :'BOOLEAN',
        :'module_invoice_import' => :'BOOLEAN',
        :'module_email' => :'BOOLEAN',
        :'module_ocr_auto_pay' => :'BOOLEAN',
        :'module_ehf' => :'BOOLEAN',
        :'module_approve_voucher' => :'BOOLEAN',
        :'module_approve_department_voucher' => :'BOOLEAN',
        :'module_approve_project_voucher' => :'BOOLEAN',
        :'module_order_out' => :'BOOLEAN',
        :'module_mesan' => :'BOOLEAN',
        :'module_divisions' => :'BOOLEAN',
        :'module_boligmappa' => :'BOOLEAN',
        :'module_addition_project_markup' => :'BOOLEAN',
        :'module_wage_project_accounting' => :'BOOLEAN',
        :'module_accountant_connect_client' => :'BOOLEAN',
        :'module_wage_amortization' => :'BOOLEAN',
        :'module_subscriptions_periodisation' => :'BOOLEAN',
        :'module_activity_hourly_wage_wage_code' => :'BOOLEAN',
        :'module_crm' => :'BOOLEAN',
        :'module_api20' => :'BOOLEAN',
        :'module_control_schema_required_invoicing' => :'BOOLEAN',
        :'module_control_schema_required_hour_tracking' => :'BOOLEAN',
        :'module_finance_tax' => :'BOOLEAN',
        :'module_pensionreport' => :'BOOLEAN',
        :'module_agro' => :'BOOLEAN',
        :'module_mamut' => :'BOOLEAN',
        :'module_invoice_option_paper' => :'BOOLEAN',
        :'module_smart_scan' => :'BOOLEAN',
        :'module_offer' => :'BOOLEAN',
        :'module_auto_bank_reconciliation' => :'BOOLEAN',
        :'module_voucher_automation' => :'BOOLEAN',
        :'module_encrypted_pay_slip' => :'BOOLEAN',
        :'module_invoice_option_vipps' => :'BOOLEAN',
        :'module_invoice_option_efaktura' => :'BOOLEAN',
        :'module_invoice_option_avtale_giro' => :'BOOLEAN',
        :'module_factoring_aprila' => :'BOOLEAN',
        :'module_cash_credit_aprila' => :'BOOLEAN',
        :'module_invoice_option_autoinvoice_ehf' => :'BOOLEAN'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'version')
        self.version = attributes[:'version']
      end

      if attributes.has_key?(:'changes')
        if (value = attributes[:'changes']).is_a?(Array)
          self.changes = value
        end
      end

      if attributes.has_key?(:'url')
        self.url = attributes[:'url']
      end

      if attributes.has_key?(:'companyId')
        self.company_id = attributes[:'companyId']
      end

      if attributes.has_key?(:'modulehourlist')
        self.modulehourlist = attributes[:'modulehourlist']
      end

      if attributes.has_key?(:'moduleTravelExpense')
        self.module_travel_expense = attributes[:'moduleTravelExpense']
      end

      if attributes.has_key?(:'moduleInvoice')
        self.module_invoice = attributes[:'moduleInvoice']
      end

      if attributes.has_key?(:'moduleaccountinginternal')
        self.moduleaccountinginternal = attributes[:'moduleaccountinginternal']
      end

      if attributes.has_key?(:'moduleAccountingExternal')
        self.module_accounting_external = attributes[:'moduleAccountingExternal']
      end

      if attributes.has_key?(:'moduleproject')
        self.moduleproject = attributes[:'moduleproject']
      end

      if attributes.has_key?(:'moduleproduct')
        self.moduleproduct = attributes[:'moduleproduct']
      end

      if attributes.has_key?(:'modulecustomer')
        self.modulecustomer = attributes[:'modulecustomer']
      end

      if attributes.has_key?(:'moduleemployee')
        self.moduleemployee = attributes[:'moduleemployee']
      end

      if attributes.has_key?(:'moduledepartment')
        self.moduledepartment = attributes[:'moduledepartment']
      end

      if attributes.has_key?(:'approveinvoices')
        self.approveinvoices = attributes[:'approveinvoices']
      end

      if attributes.has_key?(:'approvehourlists')
        self.approvehourlists = attributes[:'approvehourlists']
      end

      if attributes.has_key?(:'approvetravelreports')
        self.approvetravelreports = attributes[:'approvetravelreports']
      end

      if attributes.has_key?(:'modulebudget')
        self.modulebudget = attributes[:'modulebudget']
      end

      if attributes.has_key?(:'modulenote')
        self.modulenote = attributes[:'modulenote']
      end

      if attributes.has_key?(:'moduletask')
        self.moduletask = attributes[:'moduletask']
      end

      if attributes.has_key?(:'moduleresourceallocation')
        self.moduleresourceallocation = attributes[:'moduleresourceallocation']
      end

      if attributes.has_key?(:'moduleprojecteconomy')
        self.moduleprojecteconomy = attributes[:'moduleprojecteconomy']
      end

      if attributes.has_key?(:'modulereferencefee')
        self.modulereferencefee = attributes[:'modulereferencefee']
      end

      if attributes.has_key?(:'modulehistorical')
        self.modulehistorical = attributes[:'modulehistorical']
      end

      if attributes.has_key?(:'moduleprojectcategory')
        self.moduleprojectcategory = attributes[:'moduleprojectcategory']
      end

      if attributes.has_key?(:'moduleprojectlocation')
        self.moduleprojectlocation = attributes[:'moduleprojectlocation']
      end

      if attributes.has_key?(:'moduleProjectBudget')
        self.module_project_budget = attributes[:'moduleProjectBudget']
      end

      if attributes.has_key?(:'modulesubscription')
        self.modulesubscription = attributes[:'modulesubscription']
      end

      if attributes.has_key?(:'completeweeklyhourlists')
        self.completeweeklyhourlists = attributes[:'completeweeklyhourlists']
      end

      if attributes.has_key?(:'completemonthlyhourlists')
        self.completemonthlyhourlists = attributes[:'completemonthlyhourlists']
      end

      if attributes.has_key?(:'approvemonthlyhourlists')
        self.approvemonthlyhourlists = attributes[:'approvemonthlyhourlists']
      end

      if attributes.has_key?(:'moduleprojectprognosis')
        self.moduleprojectprognosis = attributes[:'moduleprojectprognosis']
      end

      if attributes.has_key?(:'modulebunches')
        self.modulebunches = attributes[:'modulebunches']
      end

      if attributes.has_key?(:'moduleVacationBalance')
        self.module_vacation_balance = attributes[:'moduleVacationBalance']
      end

      if attributes.has_key?(:'moduleAccountingReports')
        self.module_accounting_reports = attributes[:'moduleAccountingReports']
      end

      if attributes.has_key?(:'moduleCustomerCategories')
        self.module_customer_categories = attributes[:'moduleCustomerCategories']
      end

      if attributes.has_key?(:'moduleCustomerCategory1')
        self.module_customer_category1 = attributes[:'moduleCustomerCategory1']
      end

      if attributes.has_key?(:'moduleCustomerCategory2')
        self.module_customer_category2 = attributes[:'moduleCustomerCategory2']
      end

      if attributes.has_key?(:'moduleCustomerCategory3')
        self.module_customer_category3 = attributes[:'moduleCustomerCategory3']
      end

      if attributes.has_key?(:'moduleprojectsubcontract')
        self.moduleprojectsubcontract = attributes[:'moduleprojectsubcontract']
      end

      if attributes.has_key?(:'modulePayrollAccounting')
        self.module_payroll_accounting = attributes[:'modulePayrollAccounting']
      end

      if attributes.has_key?(:'moduleTimeBalance')
        self.module_time_balance = attributes[:'moduleTimeBalance']
      end

      if attributes.has_key?(:'moduleWorkingHours')
        self.module_working_hours = attributes[:'moduleWorkingHours']
      end

      if attributes.has_key?(:'moduleCurrency')
        self.module_currency = attributes[:'moduleCurrency']
      end

      if attributes.has_key?(:'moduleWageExport')
        self.module_wage_export = attributes[:'moduleWageExport']
      end

      if attributes.has_key?(:'moduleAutoCustomerNumber')
        self.module_auto_customer_number = attributes[:'moduleAutoCustomerNumber']
      end

      if attributes.has_key?(:'moduleAutoVendorNumber')
        self.module_auto_vendor_number = attributes[:'moduleAutoVendorNumber']
      end

      if attributes.has_key?(:'moduleProvisionSalary')
        self.module_provision_salary = attributes[:'moduleProvisionSalary']
      end

      if attributes.has_key?(:'moduleOrderNumber')
        self.module_order_number = attributes[:'moduleOrderNumber']
      end

      if attributes.has_key?(:'moduleOrderDiscount')
        self.module_order_discount = attributes[:'moduleOrderDiscount']
      end

      if attributes.has_key?(:'moduleOrderMarkup')
        self.module_order_markup = attributes[:'moduleOrderMarkup']
      end

      if attributes.has_key?(:'moduleOrderLineCost')
        self.module_order_line_cost = attributes[:'moduleOrderLineCost']
      end

      if attributes.has_key?(:'moduleStopWatch')
        self.module_stop_watch = attributes[:'moduleStopWatch']
      end

      if attributes.has_key?(:'moduleContact')
        self.module_contact = attributes[:'moduleContact']
      end

      if attributes.has_key?(:'moduleAutoProjectNumber')
        self.module_auto_project_number = attributes[:'moduleAutoProjectNumber']
      end

      if attributes.has_key?(:'moduleSwedish')
        self.module_swedish = attributes[:'moduleSwedish']
      end

      if attributes.has_key?(:'moduleResourceGroups')
        self.module_resource_groups = attributes[:'moduleResourceGroups']
      end

      if attributes.has_key?(:'moduleOcr')
        self.module_ocr = attributes[:'moduleOcr']
      end

      if attributes.has_key?(:'moduleTravelExpenseRates')
        self.module_travel_expense_rates = attributes[:'moduleTravelExpenseRates']
      end

      if attributes.has_key?(:'monthlyHourlistMinusTimeWarning')
        self.monthly_hourlist_minus_time_warning = attributes[:'monthlyHourlistMinusTimeWarning']
      end

      if attributes.has_key?(:'moduleVoucherScanning')
        self.module_voucher_scanning = attributes[:'moduleVoucherScanning']
      end

      if attributes.has_key?(:'moduleInvoiceScanning')
        self.module_invoice_scanning = attributes[:'moduleInvoiceScanning']
      end

      if attributes.has_key?(:'moduleProjectParticipants')
        self.module_project_participants = attributes[:'moduleProjectParticipants']
      end

      if attributes.has_key?(:'moduleHolydayPlan')
        self.module_holyday_plan = attributes[:'moduleHolydayPlan']
      end

      if attributes.has_key?(:'moduleEmployeeCategory')
        self.module_employee_category = attributes[:'moduleEmployeeCategory']
      end

      if attributes.has_key?(:'moduleProductInvoice')
        self.module_product_invoice = attributes[:'moduleProductInvoice']
      end

      if attributes.has_key?(:'autoInvoicing')
        self.auto_invoicing = attributes[:'autoInvoicing']
      end

      if attributes.has_key?(:'moduleInvoiceFeeComment')
        self.module_invoice_fee_comment = attributes[:'moduleInvoiceFeeComment']
      end

      if attributes.has_key?(:'moduleEmployeeAccounting')
        self.module_employee_accounting = attributes[:'moduleEmployeeAccounting']
      end

      if attributes.has_key?(:'moduleDepartmentAccounting')
        self.module_department_accounting = attributes[:'moduleDepartmentAccounting']
      end

      if attributes.has_key?(:'moduleProjectAccounting')
        self.module_project_accounting = attributes[:'moduleProjectAccounting']
      end

      if attributes.has_key?(:'moduleProductAccounting')
        self.module_product_accounting = attributes[:'moduleProductAccounting']
      end

      if attributes.has_key?(:'moduleSubscriptionAddressList')
        self.module_subscription_address_list = attributes[:'moduleSubscriptionAddressList']
      end

      if attributes.has_key?(:'moduleElectro')
        self.module_electro = attributes[:'moduleElectro']
      end

      if attributes.has_key?(:'moduleNrf')
        self.module_nrf = attributes[:'moduleNrf']
      end

      if attributes.has_key?(:'moduleGtin')
        self.module_gtin = attributes[:'moduleGtin']
      end

      if attributes.has_key?(:'moduleElproffen')
        self.module_elproffen = attributes[:'moduleElproffen']
      end

      if attributes.has_key?(:'moduleRorkjop')
        self.module_rorkjop = attributes[:'moduleRorkjop']
      end

      if attributes.has_key?(:'moduleOrderExt')
        self.module_order_ext = attributes[:'moduleOrderExt']
      end

      if attributes.has_key?(:'moduleResultBudget')
        self.module_result_budget = attributes[:'moduleResultBudget']
      end

      if attributes.has_key?(:'moduleAmortization')
        self.module_amortization = attributes[:'moduleAmortization']
      end

      if attributes.has_key?(:'moduleChangeDebtCollector')
        self.module_change_debt_collector = attributes[:'moduleChangeDebtCollector']
      end

      if attributes.has_key?(:'moduleVoucherTypes')
        self.module_voucher_types = attributes[:'moduleVoucherTypes']
      end

      if attributes.has_key?(:'moduleOnninen123')
        self.module_onninen123 = attributes[:'moduleOnninen123']
      end

      if attributes.has_key?(:'moduleElektroUnion')
        self.module_elektro_union = attributes[:'moduleElektroUnion']
      end

      if attributes.has_key?(:'moduleAhlsellPartner')
        self.module_ahlsell_partner = attributes[:'moduleAhlsellPartner']
      end

      if attributes.has_key?(:'moduleArchive')
        self.module_archive = attributes[:'moduleArchive']
      end

      if attributes.has_key?(:'moduleWarehouse')
        self.module_warehouse = attributes[:'moduleWarehouse']
      end

      if attributes.has_key?(:'moduleProjectBudgetReferenceFee')
        self.module_project_budget_reference_fee = attributes[:'moduleProjectBudgetReferenceFee']
      end

      if attributes.has_key?(:'moduleNetsEboks')
        self.module_nets_eboks = attributes[:'moduleNetsEboks']
      end

      if attributes.has_key?(:'moduleNetsPrintSalary')
        self.module_nets_print_salary = attributes[:'moduleNetsPrintSalary']
      end

      if attributes.has_key?(:'moduleNetsPrintInvoice')
        self.module_nets_print_invoice = attributes[:'moduleNetsPrintInvoice']
      end

      if attributes.has_key?(:'moduleInvoiceImport')
        self.module_invoice_import = attributes[:'moduleInvoiceImport']
      end

      if attributes.has_key?(:'moduleEmail')
        self.module_email = attributes[:'moduleEmail']
      end

      if attributes.has_key?(:'moduleOcrAutoPay')
        self.module_ocr_auto_pay = attributes[:'moduleOcrAutoPay']
      end

      if attributes.has_key?(:'moduleEhf')
        self.module_ehf = attributes[:'moduleEhf']
      end

      if attributes.has_key?(:'moduleApproveVoucher')
        self.module_approve_voucher = attributes[:'moduleApproveVoucher']
      end

      if attributes.has_key?(:'moduleApproveDepartmentVoucher')
        self.module_approve_department_voucher = attributes[:'moduleApproveDepartmentVoucher']
      end

      if attributes.has_key?(:'moduleApproveProjectVoucher')
        self.module_approve_project_voucher = attributes[:'moduleApproveProjectVoucher']
      end

      if attributes.has_key?(:'moduleOrderOut')
        self.module_order_out = attributes[:'moduleOrderOut']
      end

      if attributes.has_key?(:'moduleMesan')
        self.module_mesan = attributes[:'moduleMesan']
      end

      if attributes.has_key?(:'moduleDivisions')
        self.module_divisions = attributes[:'moduleDivisions']
      end

      if attributes.has_key?(:'moduleBoligmappa')
        self.module_boligmappa = attributes[:'moduleBoligmappa']
      end

      if attributes.has_key?(:'moduleAdditionProjectMarkup')
        self.module_addition_project_markup = attributes[:'moduleAdditionProjectMarkup']
      end

      if attributes.has_key?(:'moduleWageProjectAccounting')
        self.module_wage_project_accounting = attributes[:'moduleWageProjectAccounting']
      end

      if attributes.has_key?(:'moduleAccountantConnectClient')
        self.module_accountant_connect_client = attributes[:'moduleAccountantConnectClient']
      end

      if attributes.has_key?(:'moduleWageAmortization')
        self.module_wage_amortization = attributes[:'moduleWageAmortization']
      end

      if attributes.has_key?(:'moduleSubscriptionsPeriodisation')
        self.module_subscriptions_periodisation = attributes[:'moduleSubscriptionsPeriodisation']
      end

      if attributes.has_key?(:'moduleActivityHourlyWageWageCode')
        self.module_activity_hourly_wage_wage_code = attributes[:'moduleActivityHourlyWageWageCode']
      end

      if attributes.has_key?(:'moduleCRM')
        self.module_crm = attributes[:'moduleCRM']
      end

      if attributes.has_key?(:'moduleApi20')
        self.module_api20 = attributes[:'moduleApi20']
      end

      if attributes.has_key?(:'moduleControlSchemaRequiredInvoicing')
        self.module_control_schema_required_invoicing = attributes[:'moduleControlSchemaRequiredInvoicing']
      end

      if attributes.has_key?(:'moduleControlSchemaRequiredHourTracking')
        self.module_control_schema_required_hour_tracking = attributes[:'moduleControlSchemaRequiredHourTracking']
      end

      if attributes.has_key?(:'moduleFinanceTax')
        self.module_finance_tax = attributes[:'moduleFinanceTax']
      end

      if attributes.has_key?(:'modulePensionreport')
        self.module_pensionreport = attributes[:'modulePensionreport']
      end

      if attributes.has_key?(:'moduleAgro')
        self.module_agro = attributes[:'moduleAgro']
      end

      if attributes.has_key?(:'moduleMamut')
        self.module_mamut = attributes[:'moduleMamut']
      end

      if attributes.has_key?(:'moduleInvoiceOptionPaper')
        self.module_invoice_option_paper = attributes[:'moduleInvoiceOptionPaper']
      end

      if attributes.has_key?(:'moduleSmartScan')
        self.module_smart_scan = attributes[:'moduleSmartScan']
      end

      if attributes.has_key?(:'moduleOffer')
        self.module_offer = attributes[:'moduleOffer']
      end

      if attributes.has_key?(:'moduleAutoBankReconciliation')
        self.module_auto_bank_reconciliation = attributes[:'moduleAutoBankReconciliation']
      end

      if attributes.has_key?(:'moduleVoucherAutomation')
        self.module_voucher_automation = attributes[:'moduleVoucherAutomation']
      end

      if attributes.has_key?(:'moduleEncryptedPaySlip')
        self.module_encrypted_pay_slip = attributes[:'moduleEncryptedPaySlip']
      end

      if attributes.has_key?(:'moduleInvoiceOptionVipps')
        self.module_invoice_option_vipps = attributes[:'moduleInvoiceOptionVipps']
      end

      if attributes.has_key?(:'moduleInvoiceOptionEfaktura')
        self.module_invoice_option_efaktura = attributes[:'moduleInvoiceOptionEfaktura']
      end

      if attributes.has_key?(:'moduleInvoiceOptionAvtaleGiro')
        self.module_invoice_option_avtale_giro = attributes[:'moduleInvoiceOptionAvtaleGiro']
      end

      if attributes.has_key?(:'moduleFactoringAprila')
        self.module_factoring_aprila = attributes[:'moduleFactoringAprila']
      end

      if attributes.has_key?(:'moduleCashCreditAprila')
        self.module_cash_credit_aprila = attributes[:'moduleCashCreditAprila']
      end

      if attributes.has_key?(:'moduleInvoiceOptionAutoinvoiceEhf')
        self.module_invoice_option_autoinvoice_ehf = attributes[:'moduleInvoiceOptionAutoinvoiceEhf']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          version == o.version &&
          changes == o.changes &&
          url == o.url &&
          company_id == o.company_id &&
          modulehourlist == o.modulehourlist &&
          module_travel_expense == o.module_travel_expense &&
          module_invoice == o.module_invoice &&
          moduleaccountinginternal == o.moduleaccountinginternal &&
          module_accounting_external == o.module_accounting_external &&
          moduleproject == o.moduleproject &&
          moduleproduct == o.moduleproduct &&
          modulecustomer == o.modulecustomer &&
          moduleemployee == o.moduleemployee &&
          moduledepartment == o.moduledepartment &&
          approveinvoices == o.approveinvoices &&
          approvehourlists == o.approvehourlists &&
          approvetravelreports == o.approvetravelreports &&
          modulebudget == o.modulebudget &&
          modulenote == o.modulenote &&
          moduletask == o.moduletask &&
          moduleresourceallocation == o.moduleresourceallocation &&
          moduleprojecteconomy == o.moduleprojecteconomy &&
          modulereferencefee == o.modulereferencefee &&
          modulehistorical == o.modulehistorical &&
          moduleprojectcategory == o.moduleprojectcategory &&
          moduleprojectlocation == o.moduleprojectlocation &&
          module_project_budget == o.module_project_budget &&
          modulesubscription == o.modulesubscription &&
          completeweeklyhourlists == o.completeweeklyhourlists &&
          completemonthlyhourlists == o.completemonthlyhourlists &&
          approvemonthlyhourlists == o.approvemonthlyhourlists &&
          moduleprojectprognosis == o.moduleprojectprognosis &&
          modulebunches == o.modulebunches &&
          module_vacation_balance == o.module_vacation_balance &&
          module_accounting_reports == o.module_accounting_reports &&
          module_customer_categories == o.module_customer_categories &&
          module_customer_category1 == o.module_customer_category1 &&
          module_customer_category2 == o.module_customer_category2 &&
          module_customer_category3 == o.module_customer_category3 &&
          moduleprojectsubcontract == o.moduleprojectsubcontract &&
          module_payroll_accounting == o.module_payroll_accounting &&
          module_time_balance == o.module_time_balance &&
          module_working_hours == o.module_working_hours &&
          module_currency == o.module_currency &&
          module_wage_export == o.module_wage_export &&
          module_auto_customer_number == o.module_auto_customer_number &&
          module_auto_vendor_number == o.module_auto_vendor_number &&
          module_provision_salary == o.module_provision_salary &&
          module_order_number == o.module_order_number &&
          module_order_discount == o.module_order_discount &&
          module_order_markup == o.module_order_markup &&
          module_order_line_cost == o.module_order_line_cost &&
          module_stop_watch == o.module_stop_watch &&
          module_contact == o.module_contact &&
          module_auto_project_number == o.module_auto_project_number &&
          module_swedish == o.module_swedish &&
          module_resource_groups == o.module_resource_groups &&
          module_ocr == o.module_ocr &&
          module_travel_expense_rates == o.module_travel_expense_rates &&
          monthly_hourlist_minus_time_warning == o.monthly_hourlist_minus_time_warning &&
          module_voucher_scanning == o.module_voucher_scanning &&
          module_invoice_scanning == o.module_invoice_scanning &&
          module_project_participants == o.module_project_participants &&
          module_holyday_plan == o.module_holyday_plan &&
          module_employee_category == o.module_employee_category &&
          module_product_invoice == o.module_product_invoice &&
          auto_invoicing == o.auto_invoicing &&
          module_invoice_fee_comment == o.module_invoice_fee_comment &&
          module_employee_accounting == o.module_employee_accounting &&
          module_department_accounting == o.module_department_accounting &&
          module_project_accounting == o.module_project_accounting &&
          module_product_accounting == o.module_product_accounting &&
          module_subscription_address_list == o.module_subscription_address_list &&
          module_electro == o.module_electro &&
          module_nrf == o.module_nrf &&
          module_gtin == o.module_gtin &&
          module_elproffen == o.module_elproffen &&
          module_rorkjop == o.module_rorkjop &&
          module_order_ext == o.module_order_ext &&
          module_result_budget == o.module_result_budget &&
          module_amortization == o.module_amortization &&
          module_change_debt_collector == o.module_change_debt_collector &&
          module_voucher_types == o.module_voucher_types &&
          module_onninen123 == o.module_onninen123 &&
          module_elektro_union == o.module_elektro_union &&
          module_ahlsell_partner == o.module_ahlsell_partner &&
          module_archive == o.module_archive &&
          module_warehouse == o.module_warehouse &&
          module_project_budget_reference_fee == o.module_project_budget_reference_fee &&
          module_nets_eboks == o.module_nets_eboks &&
          module_nets_print_salary == o.module_nets_print_salary &&
          module_nets_print_invoice == o.module_nets_print_invoice &&
          module_invoice_import == o.module_invoice_import &&
          module_email == o.module_email &&
          module_ocr_auto_pay == o.module_ocr_auto_pay &&
          module_ehf == o.module_ehf &&
          module_approve_voucher == o.module_approve_voucher &&
          module_approve_department_voucher == o.module_approve_department_voucher &&
          module_approve_project_voucher == o.module_approve_project_voucher &&
          module_order_out == o.module_order_out &&
          module_mesan == o.module_mesan &&
          module_divisions == o.module_divisions &&
          module_boligmappa == o.module_boligmappa &&
          module_addition_project_markup == o.module_addition_project_markup &&
          module_wage_project_accounting == o.module_wage_project_accounting &&
          module_accountant_connect_client == o.module_accountant_connect_client &&
          module_wage_amortization == o.module_wage_amortization &&
          module_subscriptions_periodisation == o.module_subscriptions_periodisation &&
          module_activity_hourly_wage_wage_code == o.module_activity_hourly_wage_wage_code &&
          module_crm == o.module_crm &&
          module_api20 == o.module_api20 &&
          module_control_schema_required_invoicing == o.module_control_schema_required_invoicing &&
          module_control_schema_required_hour_tracking == o.module_control_schema_required_hour_tracking &&
          module_finance_tax == o.module_finance_tax &&
          module_pensionreport == o.module_pensionreport &&
          module_agro == o.module_agro &&
          module_mamut == o.module_mamut &&
          module_invoice_option_paper == o.module_invoice_option_paper &&
          module_smart_scan == o.module_smart_scan &&
          module_offer == o.module_offer &&
          module_auto_bank_reconciliation == o.module_auto_bank_reconciliation &&
          module_voucher_automation == o.module_voucher_automation &&
          module_encrypted_pay_slip == o.module_encrypted_pay_slip &&
          module_invoice_option_vipps == o.module_invoice_option_vipps &&
          module_invoice_option_efaktura == o.module_invoice_option_efaktura &&
          module_invoice_option_avtale_giro == o.module_invoice_option_avtale_giro &&
          module_factoring_aprila == o.module_factoring_aprila &&
          module_cash_credit_aprila == o.module_cash_credit_aprila &&
          module_invoice_option_autoinvoice_ehf == o.module_invoice_option_autoinvoice_ehf
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, company_id, modulehourlist, module_travel_expense, module_invoice, moduleaccountinginternal, module_accounting_external, moduleproject, moduleproduct, modulecustomer, moduleemployee, moduledepartment, approveinvoices, approvehourlists, approvetravelreports, modulebudget, modulenote, moduletask, moduleresourceallocation, moduleprojecteconomy, modulereferencefee, modulehistorical, moduleprojectcategory, moduleprojectlocation, module_project_budget, modulesubscription, completeweeklyhourlists, completemonthlyhourlists, approvemonthlyhourlists, moduleprojectprognosis, modulebunches, module_vacation_balance, module_accounting_reports, module_customer_categories, module_customer_category1, module_customer_category2, module_customer_category3, moduleprojectsubcontract, module_payroll_accounting, module_time_balance, module_working_hours, module_currency, module_wage_export, module_auto_customer_number, module_auto_vendor_number, module_provision_salary, module_order_number, module_order_discount, module_order_markup, module_order_line_cost, module_stop_watch, module_contact, module_auto_project_number, module_swedish, module_resource_groups, module_ocr, module_travel_expense_rates, monthly_hourlist_minus_time_warning, module_voucher_scanning, module_invoice_scanning, module_project_participants, module_holyday_plan, module_employee_category, module_product_invoice, auto_invoicing, module_invoice_fee_comment, module_employee_accounting, module_department_accounting, module_project_accounting, module_product_accounting, module_subscription_address_list, module_electro, module_nrf, module_gtin, module_elproffen, module_rorkjop, module_order_ext, module_result_budget, module_amortization, module_change_debt_collector, module_voucher_types, module_onninen123, module_elektro_union, module_ahlsell_partner, module_archive, module_warehouse, module_project_budget_reference_fee, module_nets_eboks, module_nets_print_salary, module_nets_print_invoice, module_invoice_import, module_email, module_ocr_auto_pay, module_ehf, module_approve_voucher, module_approve_department_voucher, module_approve_project_voucher, module_order_out, module_mesan, module_divisions, module_boligmappa, module_addition_project_markup, module_wage_project_accounting, module_accountant_connect_client, module_wage_amortization, module_subscriptions_periodisation, module_activity_hourly_wage_wage_code, module_crm, module_api20, module_control_schema_required_invoicing, module_control_schema_required_hour_tracking, module_finance_tax, module_pensionreport, module_agro, module_mamut, module_invoice_option_paper, module_smart_scan, module_offer, module_auto_bank_reconciliation, module_voucher_automation, module_encrypted_pay_slip, module_invoice_option_vipps, module_invoice_option_efaktura, module_invoice_option_avtale_giro, module_factoring_aprila, module_cash_credit_aprila, module_invoice_option_autoinvoice_ehf].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = TripletexRubyClient.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end
end
