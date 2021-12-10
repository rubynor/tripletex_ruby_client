# tripletex_ruby_client

TripletexRubyClient - the Ruby gem for the Tripletex API

## Usage  - **Download the spec** [swagger.json](/v2/swagger.json) file, it is a [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification).  - **Generating a client** can easily be done using tools like [swagger-codegen](https://github.com/swagger-api/swagger-codegen) or other that accepts [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) specs.     - For swagger codegen it is recommended to use the flag: **--removeOperationIdPrefix**.        Unique operation ids are about to be introduced to the spec, and this ensures forward compatibility - and results in less verbose generated code.   ## Overview  - Partial resource updating is done using the `PUT` method with optional fields instead of the `PATCH` method.  - **Actions** or **commands** are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  - **Summaries** or **aggregated** results are represented in our RESTful path with a prefixed `>`. Example: `/v2/hours/>thisWeeksBillables`.  - **Request ID** is a key found in all responses in the header with the name `x-tlx-request-id`. For validation and error responses it is also in the response body. If additional log information is absolutely necessary, our support division can locate the key value.  - **version** This is a revision number found on all persisted resources. If included, it will prevent your PUT/POST from overriding any updates to the resource since your GET.  - **Date** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DD`.  - **DateTime** follows the **[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)** standard, meaning the format `YYYY-MM-DDThh:mm:ss`.  - **Searching** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  - **Missing fields** or even **no response data** can occur because result objects and fields are filtered on authorization.  - **See [GitHub](https://github.com/Tripletex/tripletex-api2) for more documentation, examples, changelog and more.**  - **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for additional information.**   ## Authentication  - **Tokens:** The Tripletex API uses 3 different tokens    - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.    - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=1505&languageId=0)    - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header.  - **Authentication** is done via [Basic access authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)    - **username** is used to specify what company to access.      - `0` or blank means the company of the employee.      - Any other value means accountant clients. Use `/company/>withLoginAccess` to get a list of those.    - **password** is the **sessionToken**.    - If you need to create the header yourself use `Authorization: Basic <encoded token>` where `encoded token` is the string `<target company id or 0>:<your session token>` Base64 encoded.   ## Tags  - `[BETA]` This is a beta endpoint and can be subject to change. - `[DEPRECATED]` Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.   ## Fields  Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements, done via `<field>(<subResourceFields>)`. `*` means all fields for that resource. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All resources and some subResources :  `*,activity(name),employee(*)`.   ## Sorting  Use the `sorting` parameter to specify sorting. It takes a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `<field>.<subObjectField>`. Example values: - `date` - `project.name` - `project.name, -date`   ## Changes  To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  **NOTE** > For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).   ## Rate limiting  Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope  #### Multiple values  ```json {   \"fullResultSize\": ###, // {number} [DEPRECATED]   \"from\": ###, // {number} Paging starting from   \"count\": ###, // {number} Paging count   \"versionDigest\": \"###\", // {string} Hash of full result, null if no result   \"values\": [...{...object...},{...object...},{...object...}...] } ```  #### Single value  ```json {   \"value\": {...single object...} } ```   ## WebHook envelope  ```json {   \"subscriptionId\": ###, // Subscription id   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Id of object this event is for   \"value\": {... single object, null if object.deleted ...} } ```   ## Error/warning envelope  ```json {   \"status\": ###, // {number} HTTP status code   \"code\": #####, // {number} internal status code of event   \"message\": \"###\", // {string} Basic feedback message in your language   \"link\": \"###\", // {string} Link to doc   \"developerMessage\": \"###\", // {string} More technical message   \"validationMessages\": [ // {array} List of validation messages, can be null     {       \"field\": \"###\", // {string} Name of field       \"message\": \"###\" // {string} Validation message for field     }   ],   \"requestId\": \"###\" // {string} Same as x-tlx-request-id  } ```   ## Status codes / Error codes  - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   -  **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000** Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception - **403 Forbidden** - When AuthorisationManager says no.   -  **9000** Security Exception - **404 Not Found** - For resources that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000** Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** - Unexpected condition was encountered and no more specific message is suitable   - **1000** Exception 

This SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 2.69.5
- Package version: 1.0.0
- Build package: io.swagger.codegen.languages.RubyClientCodegen
For more information, please visit [https://github.com/Tripletex/tripletex-api2](https://github.com/Tripletex/tripletex-api2)

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build tripletex_ruby_client.gemspec
```

Then either install the gem locally:

```shell
gem install ./tripletex_ruby_client-1.0.0.gem
```
(for development, run `gem install --dev ./tripletex_ruby_client-1.0.0.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'tripletex_ruby_client', '~> 1.0.0'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/GIT_USER_ID/GIT_REPO_ID, then add the following in the Gemfile:

    gem 'tripletex_ruby_client', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:
```ruby
# Load the gem
require 'tripletex_ruby_client'

# Setup authorization
TripletexRubyClient.configure do |config|
  # Configure HTTP basic authorization: tokenAuthScheme
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = TripletexRubyClient::ActivityApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: 'fields_example' # String | Fields filter pattern
}

begin
  #Find activity by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ActivityApi->get: #{e}"
end

```

## Documentation for API Endpoints

All URIs are relative to *https://tripletex.no/v2*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*TripletexRubyClient::ActivityApi* | [**get**](docs/ActivityApi.md#get) | **GET** /activity/{id} | Find activity by ID.
*TripletexRubyClient::ActivityApi* | [**get_for_time_sheet**](docs/ActivityApi.md#get_for_time_sheet) | **GET** /activity/&gt;forTimeSheet | Find applicable time sheet activities for an employee on a specific day.
*TripletexRubyClient::ActivityApi* | [**post**](docs/ActivityApi.md#post) | **POST** /activity | Add activity.
*TripletexRubyClient::ActivityApi* | [**post_list**](docs/ActivityApi.md#post_list) | **POST** /activity/list | Add multiple activities.
*TripletexRubyClient::ActivityApi* | [**search**](docs/ActivityApi.md#search) | **GET** /activity | Find activities corresponding with sent data.
*TripletexRubyClient::AssetApi* | [**delete**](docs/AssetApi.md#delete) | **DELETE** /asset/{id} | Delete asset.
*TripletexRubyClient::AssetApi* | [**get**](docs/AssetApi.md#get) | **GET** /asset/{id} | Get asset by ID.
*TripletexRubyClient::AssetApi* | [**post**](docs/AssetApi.md#post) | **POST** /asset | Create one asset.
*TripletexRubyClient::AssetApi* | [**post_list**](docs/AssetApi.md#post_list) | **POST** /asset/list | Create several assets.
*TripletexRubyClient::AssetApi* | [**put**](docs/AssetApi.md#put) | **PUT** /asset/{id} | Update asset.
*TripletexRubyClient::AssetApi* | [**search**](docs/AssetApi.md#search) | **GET** /asset | Find assets corresponding with sent data.
*TripletexRubyClient::BalanceSheetApi* | [**search**](docs/BalanceSheetApi.md#search) | **GET** /balanceSheet | [BETA] Get balance sheet (saldobalanse).
*TripletexRubyClient::BankApi* | [**get**](docs/BankApi.md#get) | **GET** /bank/{id} | [BETA] Get bank.
*TripletexRubyClient::BankApi* | [**search**](docs/BankApi.md#search) | **GET** /bank | [BETA] Find bank corresponding with sent data.
*TripletexRubyClient::BankreconciliationApi* | [**adjustment**](docs/BankreconciliationApi.md#adjustment) | **PUT** /bank/reconciliation/{id}/:adjustment | [BETA] Add an adjustment to reconciliation by ID.
*TripletexRubyClient::BankreconciliationApi* | [**closed_with_unmatched_transactions**](docs/BankreconciliationApi.md#closed_with_unmatched_transactions) | **GET** /bank/reconciliation/closedWithUnmatchedTransactions | [BETA] Get the last closed reconciliation with unmached transactions by account ID.
*TripletexRubyClient::BankreconciliationApi* | [**delete**](docs/BankreconciliationApi.md#delete) | **DELETE** /bank/reconciliation/{id} | [BETA] Delete bank reconciliation by ID.
*TripletexRubyClient::BankreconciliationApi* | [**get**](docs/BankreconciliationApi.md#get) | **GET** /bank/reconciliation/{id} | [BETA] Get bank reconciliation.
*TripletexRubyClient::BankreconciliationApi* | [**last_closed**](docs/BankreconciliationApi.md#last_closed) | **GET** /bank/reconciliation/&gt;lastClosed | [BETA] Get last closed reconciliation by account ID.
*TripletexRubyClient::BankreconciliationApi* | [**post**](docs/BankreconciliationApi.md#post) | **POST** /bank/reconciliation | [BETA] Post a bank reconciliation.
*TripletexRubyClient::BankreconciliationApi* | [**put**](docs/BankreconciliationApi.md#put) | **PUT** /bank/reconciliation/{id} | [BETA] Update a bank reconciliation.
*TripletexRubyClient::BankreconciliationApi* | [**search**](docs/BankreconciliationApi.md#search) | **GET** /bank/reconciliation | [BETA] Find bank reconciliation corresponding with sent data.
*TripletexRubyClient::BankreconciliationmatchApi* | [**delete**](docs/BankreconciliationmatchApi.md#delete) | **DELETE** /bank/reconciliation/match/{id} | [BETA] Delete a bank reconciliation match by ID.
*TripletexRubyClient::BankreconciliationmatchApi* | [**get**](docs/BankreconciliationmatchApi.md#get) | **GET** /bank/reconciliation/match/{id} | [BETA] Get bank reconciliation match by ID.
*TripletexRubyClient::BankreconciliationmatchApi* | [**post**](docs/BankreconciliationmatchApi.md#post) | **POST** /bank/reconciliation/match | [BETA] Create a bank reconciliation match.
*TripletexRubyClient::BankreconciliationmatchApi* | [**put**](docs/BankreconciliationmatchApi.md#put) | **PUT** /bank/reconciliation/match/{id} | [BETA] Update a bank reconciliation match by ID.
*TripletexRubyClient::BankreconciliationmatchApi* | [**search**](docs/BankreconciliationmatchApi.md#search) | **GET** /bank/reconciliation/match | [BETA] Find bank reconciliation match corresponding with sent data.
*TripletexRubyClient::BankreconciliationmatchApi* | [**suggest**](docs/BankreconciliationmatchApi.md#suggest) | **PUT** /bank/reconciliation/match/:suggest | [BETA] Suggest matches for a bank reconciliation by ID.
*TripletexRubyClient::BankreconciliationpaymentTypeApi* | [**get**](docs/BankreconciliationpaymentTypeApi.md#get) | **GET** /bank/reconciliation/paymentType/{id} | [BETA] Get payment type by ID.
*TripletexRubyClient::BankreconciliationpaymentTypeApi* | [**search**](docs/BankreconciliationpaymentTypeApi.md#search) | **GET** /bank/reconciliation/paymentType | [BETA] Find payment type corresponding with sent data.
*TripletexRubyClient::BankstatementApi* | [**delete**](docs/BankstatementApi.md#delete) | **DELETE** /bank/statement/{id} | [BETA] Delete bank statement by ID.
*TripletexRubyClient::BankstatementApi* | [**get**](docs/BankstatementApi.md#get) | **GET** /bank/statement/{id} | [BETA] Get bank statement.
*TripletexRubyClient::BankstatementApi* | [**import_bank_statement**](docs/BankstatementApi.md#import_bank_statement) | **POST** /bank/statement/import | [BETA] Upload bank statement file.
*TripletexRubyClient::BankstatementApi* | [**search**](docs/BankstatementApi.md#search) | **GET** /bank/statement | [BETA] Find bank statement corresponding with sent data.
*TripletexRubyClient::BankstatementtransactionApi* | [**get**](docs/BankstatementtransactionApi.md#get) | **GET** /bank/statement/transaction/{id} | [BETA] Get bank transaction by ID.
*TripletexRubyClient::BankstatementtransactionApi* | [**get_details**](docs/BankstatementtransactionApi.md#get_details) | **GET** /bank/statement/transaction/{id}/details | [BETA] Get additional details about transaction by ID.
*TripletexRubyClient::BankstatementtransactionApi* | [**search**](docs/BankstatementtransactionApi.md#search) | **GET** /bank/statement/transaction | [BETA] Find bank transaction corresponding with sent data.
*TripletexRubyClient::CompanyApi* | [**get**](docs/CompanyApi.md#get) | **GET** /company/{id} | Find company by ID.
*TripletexRubyClient::CompanyApi* | [**get_divisions**](docs/CompanyApi.md#get_divisions) | **GET** /company/divisions | [DEPRECATED] Find divisions.
*TripletexRubyClient::CompanyApi* | [**get_with_login_access**](docs/CompanyApi.md#get_with_login_access) | **GET** /company/&gt;withLoginAccess | Returns client customers (with accountant/auditor relation) where the current user has login access (proxy login).
*TripletexRubyClient::CompanyApi* | [**put**](docs/CompanyApi.md#put) | **PUT** /company | Update company information.
*TripletexRubyClient::CompanyaltinnApi* | [**put**](docs/CompanyaltinnApi.md#put) | **PUT** /company/settings/altinn | [BETA] Update AltInn id and password.
*TripletexRubyClient::CompanyaltinnApi* | [**search**](docs/CompanyaltinnApi.md#search) | **GET** /company/settings/altinn | [BETA] Find Altinn id for login in company.
*TripletexRubyClient::CompanysalesmodulesApi* | [**get**](docs/CompanysalesmodulesApi.md#get) | **GET** /company/salesmodules | [BETA] Get active sales modules.
*TripletexRubyClient::CompanysalesmodulesApi* | [**post**](docs/CompanysalesmodulesApi.md#post) | **POST** /company/salesmodules | [BETA] Add (activate) a new sales module.
*TripletexRubyClient::ContactApi* | [**get**](docs/ContactApi.md#get) | **GET** /contact/{id} | Get contact by ID.
*TripletexRubyClient::ContactApi* | [**post**](docs/ContactApi.md#post) | **POST** /contact | Create contact.
*TripletexRubyClient::ContactApi* | [**put**](docs/ContactApi.md#put) | **PUT** /contact/{id} | [BETA] Update contact.
*TripletexRubyClient::ContactApi* | [**search**](docs/ContactApi.md#search) | **GET** /contact | Find contacts corresponding with sent data.
*TripletexRubyClient::CountryApi* | [**get**](docs/CountryApi.md#get) | **GET** /country/{id} | Get country by ID.
*TripletexRubyClient::CountryApi* | [**search**](docs/CountryApi.md#search) | **GET** /country | Find countries corresponding with sent data.
*TripletexRubyClient::CrmprospectApi* | [**get**](docs/CrmprospectApi.md#get) | **GET** /crm/prospect/{id} | Get prospect by ID.
*TripletexRubyClient::CrmprospectApi* | [**search**](docs/CrmprospectApi.md#search) | **GET** /crm/prospect | Find prospects corresponding with sent data.
*TripletexRubyClient::CurrencyApi* | [**get**](docs/CurrencyApi.md#get) | **GET** /currency/{id} | Get currency by ID.
*TripletexRubyClient::CurrencyApi* | [**get_rate**](docs/CurrencyApi.md#get_rate) | **GET** /currency/{id}/rate | Find currency exchange rate corresponding with sent data.
*TripletexRubyClient::CurrencyApi* | [**search**](docs/CurrencyApi.md#search) | **GET** /currency | Find currencies corresponding with sent data.
*TripletexRubyClient::CustomerApi* | [**delete**](docs/CustomerApi.md#delete) | **DELETE** /customer/{id} | [BETA] Delete customer by ID
*TripletexRubyClient::CustomerApi* | [**get**](docs/CustomerApi.md#get) | **GET** /customer/{id} | Get customer by ID.
*TripletexRubyClient::CustomerApi* | [**post**](docs/CustomerApi.md#post) | **POST** /customer | Create customer. Related customer addresses may also be created.
*TripletexRubyClient::CustomerApi* | [**post_list**](docs/CustomerApi.md#post_list) | **POST** /customer/list | [BETA] Create multiple customers. Related supplier addresses may also be created.
*TripletexRubyClient::CustomerApi* | [**put**](docs/CustomerApi.md#put) | **PUT** /customer/{id} | Update customer. 
*TripletexRubyClient::CustomerApi* | [**put_list**](docs/CustomerApi.md#put_list) | **PUT** /customer/list | [BETA] Update multiple customers. Addresses can also be updated.
*TripletexRubyClient::CustomerApi* | [**search**](docs/CustomerApi.md#search) | **GET** /customer | Find customers corresponding with sent data.
*TripletexRubyClient::CustomercategoryApi* | [**get**](docs/CustomercategoryApi.md#get) | **GET** /customer/category/{id} | Find customer/supplier category by ID.
*TripletexRubyClient::CustomercategoryApi* | [**post**](docs/CustomercategoryApi.md#post) | **POST** /customer/category | Add new customer/supplier category.
*TripletexRubyClient::CustomercategoryApi* | [**put**](docs/CustomercategoryApi.md#put) | **PUT** /customer/category/{id} | Update customer/supplier category.
*TripletexRubyClient::CustomercategoryApi* | [**search**](docs/CustomercategoryApi.md#search) | **GET** /customer/category | Find customer/supplier categories corresponding with sent data.
*TripletexRubyClient::DeliveryAddressApi* | [**get**](docs/DeliveryAddressApi.md#get) | **GET** /deliveryAddress/{id} | Get address by ID.
*TripletexRubyClient::DeliveryAddressApi* | [**put**](docs/DeliveryAddressApi.md#put) | **PUT** /deliveryAddress/{id} | Update address.
*TripletexRubyClient::DeliveryAddressApi* | [**search**](docs/DeliveryAddressApi.md#search) | **GET** /deliveryAddress | Find addresses corresponding with sent data.
*TripletexRubyClient::DepartmentApi* | [**delete**](docs/DepartmentApi.md#delete) | **DELETE** /department/{id} | Delete department by ID
*TripletexRubyClient::DepartmentApi* | [**get**](docs/DepartmentApi.md#get) | **GET** /department/{id} | Get department by ID.
*TripletexRubyClient::DepartmentApi* | [**post**](docs/DepartmentApi.md#post) | **POST** /department | [BETA] Add new department.
*TripletexRubyClient::DepartmentApi* | [**post_list**](docs/DepartmentApi.md#post_list) | **POST** /department/list | [BETA] Register new departments.
*TripletexRubyClient::DepartmentApi* | [**put**](docs/DepartmentApi.md#put) | **PUT** /department/{id} | [BETA] Update department.
*TripletexRubyClient::DepartmentApi* | [**put_list**](docs/DepartmentApi.md#put_list) | **PUT** /department/list | [BETA] Update multiple departments.
*TripletexRubyClient::DepartmentApi* | [**query**](docs/DepartmentApi.md#query) | **GET** /department/query | [BETA] Wildcard search.
*TripletexRubyClient::DepartmentApi* | [**search**](docs/DepartmentApi.md#search) | **GET** /department | Find department corresponding with sent data.
*TripletexRubyClient::DivisionApi* | [**post**](docs/DivisionApi.md#post) | **POST** /division | [BETA] Create division.
*TripletexRubyClient::DivisionApi* | [**post_list**](docs/DivisionApi.md#post_list) | **POST** /division/list | [BETA] Create divisions.
*TripletexRubyClient::DivisionApi* | [**put**](docs/DivisionApi.md#put) | **PUT** /division/{id} | [BETA] Update division information.
*TripletexRubyClient::DivisionApi* | [**put_list**](docs/DivisionApi.md#put_list) | **PUT** /division/list | [BETA] Update multiple divisions.
*TripletexRubyClient::DivisionApi* | [**search**](docs/DivisionApi.md#search) | **GET** /division | [BETA] Get divisions.
*TripletexRubyClient::DocumentApi* | [**download_content**](docs/DocumentApi.md#download_content) | **GET** /document/{id}/content | [BETA] Get content of document given by ID.
*TripletexRubyClient::DocumentApi* | [**get**](docs/DocumentApi.md#get) | **GET** /document/{id} | [BETA] Get document by ID.
*TripletexRubyClient::DocumentArchiveApi* | [**account_post**](docs/DocumentArchiveApi.md#account_post) | **POST** /documentArchive/account/{id} | [BETA] Upload file to Account Document Archive.
*TripletexRubyClient::DocumentArchiveApi* | [**customer_post**](docs/DocumentArchiveApi.md#customer_post) | **POST** /documentArchive/customer/{id} | [BETA] Upload file to Customer Document Archive.
*TripletexRubyClient::DocumentArchiveApi* | [**delete**](docs/DocumentArchiveApi.md#delete) | **DELETE** /documentArchive/{id} | [BETA] Delete document archive.
*TripletexRubyClient::DocumentArchiveApi* | [**employee_post**](docs/DocumentArchiveApi.md#employee_post) | **POST** /documentArchive/employee/{id} | [BETA] Upload file to Employee Document Archive.
*TripletexRubyClient::DocumentArchiveApi* | [**get_account**](docs/DocumentArchiveApi.md#get_account) | **GET** /documentArchive/account/{id} | [BETA] Find documents archived associated with account object type.
*TripletexRubyClient::DocumentArchiveApi* | [**get_customer**](docs/DocumentArchiveApi.md#get_customer) | **GET** /documentArchive/customer/{id} | [BETA] Find documents archived associated with customer object type.
*TripletexRubyClient::DocumentArchiveApi* | [**get_employee**](docs/DocumentArchiveApi.md#get_employee) | **GET** /documentArchive/employee/{id} | [BETA] Find documents archived associated with employee object type.
*TripletexRubyClient::DocumentArchiveApi* | [**get_product**](docs/DocumentArchiveApi.md#get_product) | **GET** /documentArchive/product/{id} | [BETA] Find documents archived associated with product object type.
*TripletexRubyClient::DocumentArchiveApi* | [**get_project**](docs/DocumentArchiveApi.md#get_project) | **GET** /documentArchive/project/{id} | [BETA] Find documents archived associated with project object type.
*TripletexRubyClient::DocumentArchiveApi* | [**get_prospect**](docs/DocumentArchiveApi.md#get_prospect) | **GET** /documentArchive/prospect/{id} | [BETA] Find documents archived associated with prospect object type.
*TripletexRubyClient::DocumentArchiveApi* | [**get_supplier**](docs/DocumentArchiveApi.md#get_supplier) | **GET** /documentArchive/supplier/{id} | [BETA] Find documents archived associated with supplier object type.
*TripletexRubyClient::DocumentArchiveApi* | [**product_post**](docs/DocumentArchiveApi.md#product_post) | **POST** /documentArchive/product/{id} | [BETA] Upload file to Product Document Archive.
*TripletexRubyClient::DocumentArchiveApi* | [**project_post**](docs/DocumentArchiveApi.md#project_post) | **POST** /documentArchive/project/{id} | [BETA] Upload file to Project Document Archive.
*TripletexRubyClient::DocumentArchiveApi* | [**prospect_post**](docs/DocumentArchiveApi.md#prospect_post) | **POST** /documentArchive/prospect/{id} | [BETA] Upload file to Prospect Document Archive.
*TripletexRubyClient::DocumentArchiveApi* | [**put**](docs/DocumentArchiveApi.md#put) | **PUT** /documentArchive/{id} | [BETA] Update document archive.
*TripletexRubyClient::DocumentArchiveApi* | [**reception_post**](docs/DocumentArchiveApi.md#reception_post) | **POST** /documentArchive/reception | [BETA] Upload a file to the document archive reception. Send as multipart form.
*TripletexRubyClient::DocumentArchiveApi* | [**supplier_post**](docs/DocumentArchiveApi.md#supplier_post) | **POST** /documentArchive/supplier/{id} | [BETA] Upload file to Supplier Document Archive.
*TripletexRubyClient::EmployeeApi* | [**get**](docs/EmployeeApi.md#get) | **GET** /employee/{id} | Get employee by ID.
*TripletexRubyClient::EmployeeApi* | [**post**](docs/EmployeeApi.md#post) | **POST** /employee | [BETA] Create one employee.
*TripletexRubyClient::EmployeeApi* | [**post_list**](docs/EmployeeApi.md#post_list) | **POST** /employee/list | [BETA] Create several employees.
*TripletexRubyClient::EmployeeApi* | [**put**](docs/EmployeeApi.md#put) | **PUT** /employee/{id} | Update employee.
*TripletexRubyClient::EmployeeApi* | [**search**](docs/EmployeeApi.md#search) | **GET** /employee | Find employees corresponding with sent data.
*TripletexRubyClient::EmployeecategoryApi* | [**delete**](docs/EmployeecategoryApi.md#delete) | **DELETE** /employee/category/{id} | [BETA] Delete employee category by ID
*TripletexRubyClient::EmployeecategoryApi* | [**delete_by_ids**](docs/EmployeecategoryApi.md#delete_by_ids) | **DELETE** /employee/category/list | [BETA] Delete multiple employee categories
*TripletexRubyClient::EmployeecategoryApi* | [**get**](docs/EmployeecategoryApi.md#get) | **GET** /employee/category/{id} | [BETA] Get employee category by ID.
*TripletexRubyClient::EmployeecategoryApi* | [**post**](docs/EmployeecategoryApi.md#post) | **POST** /employee/category | [BETA] Create a new employee category.
*TripletexRubyClient::EmployeecategoryApi* | [**post_list**](docs/EmployeecategoryApi.md#post_list) | **POST** /employee/category/list | [BETA] Create new employee categories.
*TripletexRubyClient::EmployeecategoryApi* | [**put**](docs/EmployeecategoryApi.md#put) | **PUT** /employee/category/{id} | [BETA] Update employee category information.
*TripletexRubyClient::EmployeecategoryApi* | [**put_list**](docs/EmployeecategoryApi.md#put_list) | **PUT** /employee/category/list | [BETA] Update multiple employee categories.
*TripletexRubyClient::EmployeecategoryApi* | [**search**](docs/EmployeecategoryApi.md#search) | **GET** /employee/category | [BETA] Find employee category corresponding with sent data.
*TripletexRubyClient::EmployeeemploymentApi* | [**get**](docs/EmployeeemploymentApi.md#get) | **GET** /employee/employment/{id} | Find employment by ID.
*TripletexRubyClient::EmployeeemploymentApi* | [**post**](docs/EmployeeemploymentApi.md#post) | **POST** /employee/employment | [BETA] Create employment.
*TripletexRubyClient::EmployeeemploymentApi* | [**put**](docs/EmployeeemploymentApi.md#put) | **PUT** /employee/employment/{id} | [BETA] Update employemnt. 
*TripletexRubyClient::EmployeeemploymentApi* | [**search**](docs/EmployeeemploymentApi.md#search) | **GET** /employee/employment | Find all employments for employee.
*TripletexRubyClient::EmployeeemploymentdetailsApi* | [**get**](docs/EmployeeemploymentdetailsApi.md#get) | **GET** /employee/employment/details/{id} | [BETA] Find employment details by ID.
*TripletexRubyClient::EmployeeemploymentdetailsApi* | [**post**](docs/EmployeeemploymentdetailsApi.md#post) | **POST** /employee/employment/details | [BETA] Create employment details.
*TripletexRubyClient::EmployeeemploymentdetailsApi* | [**put**](docs/EmployeeemploymentdetailsApi.md#put) | **PUT** /employee/employment/details/{id} | [BETA] Update employment details. 
*TripletexRubyClient::EmployeeemploymentdetailsApi* | [**search**](docs/EmployeeemploymentdetailsApi.md#search) | **GET** /employee/employment/details | [BETA] Find all employmentdetails for employment.
*TripletexRubyClient::EmployeeemploymentemploymentTypeApi* | [**get_employment_end_reason_type**](docs/EmployeeemploymentemploymentTypeApi.md#get_employment_end_reason_type) | **GET** /employee/employment/employmentType/employmentEndReasonType | [BETA] Find all employment end reason type IDs.
*TripletexRubyClient::EmployeeemploymentemploymentTypeApi* | [**get_employment_form_type**](docs/EmployeeemploymentemploymentTypeApi.md#get_employment_form_type) | **GET** /employee/employment/employmentType/employmentFormType | [BETA] Find all employment form type IDs.
*TripletexRubyClient::EmployeeemploymentemploymentTypeApi* | [**get_maritime_employment_type**](docs/EmployeeemploymentemploymentTypeApi.md#get_maritime_employment_type) | **GET** /employee/employment/employmentType/maritimeEmploymentType | [BETA] Find all maritime employment type IDs.
*TripletexRubyClient::EmployeeemploymentemploymentTypeApi* | [**get_salary_type**](docs/EmployeeemploymentemploymentTypeApi.md#get_salary_type) | **GET** /employee/employment/employmentType/salaryType | [BETA] Find all salary type IDs.
*TripletexRubyClient::EmployeeemploymentemploymentTypeApi* | [**get_schedule_type**](docs/EmployeeemploymentemploymentTypeApi.md#get_schedule_type) | **GET** /employee/employment/employmentType/scheduleType | [BETA] Find all schedule type IDs.
*TripletexRubyClient::EmployeeemploymentemploymentTypeApi* | [**search**](docs/EmployeeemploymentemploymentTypeApi.md#search) | **GET** /employee/employment/employmentType | [BETA] Find all employment type IDs.
*TripletexRubyClient::EmployeeemploymentleaveOfAbsenceApi* | [**get**](docs/EmployeeemploymentleaveOfAbsenceApi.md#get) | **GET** /employee/employment/leaveOfAbsence/{id} | [BETA] Find leave of absence by ID.
*TripletexRubyClient::EmployeeemploymentleaveOfAbsenceApi* | [**post**](docs/EmployeeemploymentleaveOfAbsenceApi.md#post) | **POST** /employee/employment/leaveOfAbsence | [BETA] Create leave of absence.
*TripletexRubyClient::EmployeeemploymentleaveOfAbsenceApi* | [**post_list**](docs/EmployeeemploymentleaveOfAbsenceApi.md#post_list) | **POST** /employee/employment/leaveOfAbsence/list | [BETA] Create multiple leave of absences.
*TripletexRubyClient::EmployeeemploymentleaveOfAbsenceApi* | [**put**](docs/EmployeeemploymentleaveOfAbsenceApi.md#put) | **PUT** /employee/employment/leaveOfAbsence/{id} | [BETA] Update leave of absence. 
*TripletexRubyClient::EmployeeemploymentleaveOfAbsenceTypeApi* | [**search**](docs/EmployeeemploymentleaveOfAbsenceTypeApi.md#search) | **GET** /employee/employment/leaveOfAbsenceType | [BETA] Find all leave of absence type IDs.
*TripletexRubyClient::EmployeeemploymentoccupationCodeApi* | [**search**](docs/EmployeeemploymentoccupationCodeApi.md#search) | **GET** /employee/employment/occupationCode | [BETA] Find all profession codes.
*TripletexRubyClient::EmployeeemploymentremunerationTypeApi* | [**search**](docs/EmployeeemploymentremunerationTypeApi.md#search) | **GET** /employee/employment/remunerationType | [BETA] Find all remuneration type IDs.
*TripletexRubyClient::EmployeeemploymentworkingHoursSchemeApi* | [**search**](docs/EmployeeemploymentworkingHoursSchemeApi.md#search) | **GET** /employee/employment/workingHoursScheme | [BETA] Find working hours scheme ID.
*TripletexRubyClient::EmployeeentitlementApi* | [**client**](docs/EmployeeentitlementApi.md#client) | **GET** /employee/entitlement/client | [BETA] Find all entitlements at client for user.
*TripletexRubyClient::EmployeeentitlementApi* | [**get**](docs/EmployeeentitlementApi.md#get) | **GET** /employee/entitlement/{id} | Get entitlement by ID.
*TripletexRubyClient::EmployeeentitlementApi* | [**grant_client_entitlements_by_template**](docs/EmployeeentitlementApi.md#grant_client_entitlements_by_template) | **PUT** /employee/entitlement/:grantClientEntitlementsByTemplate | [BETA] Update employee entitlements in client account.
*TripletexRubyClient::EmployeeentitlementApi* | [**grant_entitlements_by_template**](docs/EmployeeentitlementApi.md#grant_entitlements_by_template) | **PUT** /employee/entitlement/:grantEntitlementsByTemplate | [BETA] Update employee entitlements.
*TripletexRubyClient::EmployeeentitlementApi* | [**search**](docs/EmployeeentitlementApi.md#search) | **GET** /employee/entitlement | Find all entitlements for user.
*TripletexRubyClient::EmployeehourlyCostAndRateApi* | [**get**](docs/EmployeehourlyCostAndRateApi.md#get) | **GET** /employee/hourlyCostAndRate/{id} | [BETA] Find hourly cost and rate by ID.
*TripletexRubyClient::EmployeehourlyCostAndRateApi* | [**post**](docs/EmployeehourlyCostAndRateApi.md#post) | **POST** /employee/hourlyCostAndRate | [BETA] Create hourly cost and rate.
*TripletexRubyClient::EmployeehourlyCostAndRateApi* | [**put**](docs/EmployeehourlyCostAndRateApi.md#put) | **PUT** /employee/hourlyCostAndRate/{id} | [BETA] Update hourly cost and rate. 
*TripletexRubyClient::EmployeehourlyCostAndRateApi* | [**search**](docs/EmployeehourlyCostAndRateApi.md#search) | **GET** /employee/hourlyCostAndRate | Find all hourly cost and rates for employee.
*TripletexRubyClient::EmployeenextOfKinApi* | [**get**](docs/EmployeenextOfKinApi.md#get) | **GET** /employee/nextOfKin/{id} | [BETA] Find next of kin by ID.
*TripletexRubyClient::EmployeenextOfKinApi* | [**post**](docs/EmployeenextOfKinApi.md#post) | **POST** /employee/nextOfKin | [BETA] Create next of kin.
*TripletexRubyClient::EmployeenextOfKinApi* | [**put**](docs/EmployeenextOfKinApi.md#put) | **PUT** /employee/nextOfKin/{id} | [BETA] Update next of kin. 
*TripletexRubyClient::EmployeenextOfKinApi* | [**search**](docs/EmployeenextOfKinApi.md#search) | **GET** /employee/nextOfKin | Find all next of kin for employee.
*TripletexRubyClient::EmployeepreferencesApi* | [**logged_in_employee_preferences**](docs/EmployeepreferencesApi.md#logged_in_employee_preferences) | **GET** /employee/preferences/&gt;loggedInEmployeePreferences | [BETA] Get employee preferences for current user
*TripletexRubyClient::EmployeepreferencesApi* | [**search**](docs/EmployeepreferencesApi.md#search) | **GET** /employee/preferences | [BETA] Find employee category corresponding with sent data.
*TripletexRubyClient::EmployeestandardTimeApi* | [**get**](docs/EmployeestandardTimeApi.md#get) | **GET** /employee/standardTime/{id} | [BETA] Find standard time by ID.
*TripletexRubyClient::EmployeestandardTimeApi* | [**post**](docs/EmployeestandardTimeApi.md#post) | **POST** /employee/standardTime | [BETA] Create standard time.
*TripletexRubyClient::EmployeestandardTimeApi* | [**put**](docs/EmployeestandardTimeApi.md#put) | **PUT** /employee/standardTime/{id} | [BETA] Update standard time. 
*TripletexRubyClient::EmployeestandardTimeApi* | [**search**](docs/EmployeestandardTimeApi.md#search) | **GET** /employee/standardTime | [BETA] Find all standard times for employee.
*TripletexRubyClient::EventApi* | [**example**](docs/EventApi.md#example) | **GET** /event/{eventType} | [BETA] Get example webhook payload
*TripletexRubyClient::EventApi* | [**get**](docs/EventApi.md#get) | **GET** /event | [BETA] Get all (WebHook) event keys.
*TripletexRubyClient::EventsubscriptionApi* | [**delete**](docs/EventsubscriptionApi.md#delete) | **DELETE** /event/subscription/{id} | [BETA] Delete the given subscription.
*TripletexRubyClient::EventsubscriptionApi* | [**delete_by_ids**](docs/EventsubscriptionApi.md#delete_by_ids) | **DELETE** /event/subscription/list | [BETA] Delete multiple subscriptions.
*TripletexRubyClient::EventsubscriptionApi* | [**get**](docs/EventsubscriptionApi.md#get) | **GET** /event/subscription/{id} | [BETA] Get subscription by ID.
*TripletexRubyClient::EventsubscriptionApi* | [**post**](docs/EventsubscriptionApi.md#post) | **POST** /event/subscription | [BETA] Create a new subscription for current EmployeeToken.
*TripletexRubyClient::EventsubscriptionApi* | [**post_list**](docs/EventsubscriptionApi.md#post_list) | **POST** /event/subscription/list | [BETA] Create multiple subscriptions for current EmployeeToken.
*TripletexRubyClient::EventsubscriptionApi* | [**put**](docs/EventsubscriptionApi.md#put) | **PUT** /event/subscription/{id} | [BETA] Change a current subscription, based on id.
*TripletexRubyClient::EventsubscriptionApi* | [**put_list**](docs/EventsubscriptionApi.md#put_list) | **PUT** /event/subscription/list | [BETA] Update multiple subscription.
*TripletexRubyClient::EventsubscriptionApi* | [**search**](docs/EventsubscriptionApi.md#search) | **GET** /event/subscription | [BETA] Find all ongoing subscriptions.
*TripletexRubyClient::InventoryApi* | [**delete**](docs/InventoryApi.md#delete) | **DELETE** /inventory/{id} | [BETA] Delete inventory.
*TripletexRubyClient::InventoryApi* | [**get**](docs/InventoryApi.md#get) | **GET** /inventory/{id} | Get inventory by ID.
*TripletexRubyClient::InventoryApi* | [**post**](docs/InventoryApi.md#post) | **POST** /inventory | Create new inventory.
*TripletexRubyClient::InventoryApi* | [**put**](docs/InventoryApi.md#put) | **PUT** /inventory/{id} | Update inventory.
*TripletexRubyClient::InventoryApi* | [**search**](docs/InventoryApi.md#search) | **GET** /inventory | Find inventory corresponding with sent data.
*TripletexRubyClient::InventoryinventoriesApi* | [**search**](docs/InventoryinventoriesApi.md#search) | **GET** /inventory/inventories | [BETA] Find inventories corresponding with sent data.
*TripletexRubyClient::InventorylocationApi* | [**delete**](docs/InventorylocationApi.md#delete) | **DELETE** /inventory/location/{id} | [BETA] Delete inventory location. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::InventorylocationApi* | [**delete_by_ids**](docs/InventorylocationApi.md#delete_by_ids) | **DELETE** /inventory/location/list | [BETA] Delete inventory location. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::InventorylocationApi* | [**get**](docs/InventorylocationApi.md#get) | **GET** /inventory/location/{id} | Get inventory location by ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::InventorylocationApi* | [**post**](docs/InventorylocationApi.md#post) | **POST** /inventory/location | [BETA] Create new inventory location. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::InventorylocationApi* | [**post_list**](docs/InventorylocationApi.md#post_list) | **POST** /inventory/location/list | [BETA] Add multiple inventory locations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::InventorylocationApi* | [**put**](docs/InventorylocationApi.md#put) | **PUT** /inventory/location/{id} | [BETA] Update inventory location. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::InventorylocationApi* | [**put_list**](docs/InventorylocationApi.md#put_list) | **PUT** /inventory/location/list | [BETA] Update multiple inventory locations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::InventorylocationApi* | [**search**](docs/InventorylocationApi.md#search) | **GET** /inventory/location | [BETA] Find inventory locations by inventory ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::InventorystocktakingApi* | [**delete**](docs/InventorystocktakingApi.md#delete) | **DELETE** /inventory/stocktaking/{id} | [BETA] Delete stocktaking.
*TripletexRubyClient::InventorystocktakingApi* | [**get**](docs/InventorystocktakingApi.md#get) | **GET** /inventory/stocktaking/{id} | [BETA] Get stocktaking by ID.
*TripletexRubyClient::InventorystocktakingApi* | [**post**](docs/InventorystocktakingApi.md#post) | **POST** /inventory/stocktaking | [BETA] Create new stocktaking.
*TripletexRubyClient::InventorystocktakingApi* | [**put**](docs/InventorystocktakingApi.md#put) | **PUT** /inventory/stocktaking/{id} | [BETA] Update stocktaking.
*TripletexRubyClient::InventorystocktakingApi* | [**search**](docs/InventorystocktakingApi.md#search) | **GET** /inventory/stocktaking | [BETA] Find stocktaking corresponding with sent data.
*TripletexRubyClient::InventorystocktakingproductlineApi* | [**delete**](docs/InventorystocktakingproductlineApi.md#delete) | **DELETE** /inventory/stocktaking/productline/{id} | [BETA] Delete product line.
*TripletexRubyClient::InventorystocktakingproductlineApi* | [**get**](docs/InventorystocktakingproductlineApi.md#get) | **GET** /inventory/stocktaking/productline/{id} | [BETA] Get product line by ID.
*TripletexRubyClient::InventorystocktakingproductlineApi* | [**post**](docs/InventorystocktakingproductlineApi.md#post) | **POST** /inventory/stocktaking/productline | [BETA] Create product line. When creating several product lines, use /list for better performance.
*TripletexRubyClient::InventorystocktakingproductlineApi* | [**put**](docs/InventorystocktakingproductlineApi.md#put) | **PUT** /inventory/stocktaking/productline/{id} | [BETA] Update product line.
*TripletexRubyClient::InventorystocktakingproductlineApi* | [**search**](docs/InventorystocktakingproductlineApi.md#search) | **GET** /inventory/stocktaking/productline | [BETA] Find all product lines by stocktaking ID.
*TripletexRubyClient::InvoiceApi* | [**create_credit_note**](docs/InvoiceApi.md#create_credit_note) | **PUT** /invoice/{id}/:createCreditNote | Creates a new Invoice representing a credit memo that nullifies the given invoice. Updates this invoice and any pre-existing inverse invoice.
*TripletexRubyClient::InvoiceApi* | [**create_reminder**](docs/InvoiceApi.md#create_reminder) | **PUT** /invoice/{id}/:createReminder | Create invoice reminder and sends it by the given dispatch type. Supports the reminder types SOFT_REMINDER, REMINDER and NOTICE_OF_DEBT_COLLECTION. DispatchType NETS_PRINT must have type NOTICE_OF_DEBT_COLLECTION. SMS and NETS_PRINT must be activated prior to usage in the API.
*TripletexRubyClient::InvoiceApi* | [**download_pdf**](docs/InvoiceApi.md#download_pdf) | **GET** /invoice/{invoiceId}/pdf | Get invoice document by invoice ID.
*TripletexRubyClient::InvoiceApi* | [**get**](docs/InvoiceApi.md#get) | **GET** /invoice/{id} | Get invoice by ID.
*TripletexRubyClient::InvoiceApi* | [**payment**](docs/InvoiceApi.md#payment) | **PUT** /invoice/{id}/:payment | Update invoice. The invoice is updated with payment information. The amount is in the invoice’s currency.
*TripletexRubyClient::InvoiceApi* | [**post**](docs/InvoiceApi.md#post) | **POST** /invoice | Create invoice. Related Order and OrderLines can be created first, or included as new objects inside the Invoice.
*TripletexRubyClient::InvoiceApi* | [**post_list**](docs/InvoiceApi.md#post_list) | **POST** /invoice/list | [BETA] Create multiple invoices. Max 100 at a time.
*TripletexRubyClient::InvoiceApi* | [**search**](docs/InvoiceApi.md#search) | **GET** /invoice | Find invoices corresponding with sent data. Includes charged outgoing invoices only.
*TripletexRubyClient::InvoiceApi* | [**send**](docs/InvoiceApi.md#send) | **PUT** /invoice/{id}/:send | Send invoice by ID and sendType. Optionally override email recipient.
*TripletexRubyClient::InvoicedetailsApi* | [**get**](docs/InvoicedetailsApi.md#get) | **GET** /invoice/details/{id} | Get ProjectInvoiceDetails by ID.
*TripletexRubyClient::InvoicedetailsApi* | [**search**](docs/InvoicedetailsApi.md#search) | **GET** /invoice/details | Find ProjectInvoiceDetails corresponding with sent data.
*TripletexRubyClient::InvoicepaymentTypeApi* | [**get**](docs/InvoicepaymentTypeApi.md#get) | **GET** /invoice/paymentType/{id} | Get payment type by ID.
*TripletexRubyClient::InvoicepaymentTypeApi* | [**search**](docs/InvoicepaymentTypeApi.md#search) | **GET** /invoice/paymentType | Find payment type corresponding with sent data.
*TripletexRubyClient::LedgerApi* | [**open_post**](docs/LedgerApi.md#open_post) | **GET** /ledger/openPost | Find open posts corresponding with sent data.
*TripletexRubyClient::LedgerApi* | [**search**](docs/LedgerApi.md#search) | **GET** /ledger | Get ledger (hovedbok).
*TripletexRubyClient::LedgeraccountApi* | [**delete**](docs/LedgeraccountApi.md#delete) | **DELETE** /ledger/account/{id} | [BETA] Delete account.
*TripletexRubyClient::LedgeraccountApi* | [**delete_by_ids**](docs/LedgeraccountApi.md#delete_by_ids) | **DELETE** /ledger/account/list | [BETA] Delete multiple accounts.
*TripletexRubyClient::LedgeraccountApi* | [**get**](docs/LedgeraccountApi.md#get) | **GET** /ledger/account/{id} | Get account by ID.
*TripletexRubyClient::LedgeraccountApi* | [**post**](docs/LedgeraccountApi.md#post) | **POST** /ledger/account | [BETA] Create a new account.
*TripletexRubyClient::LedgeraccountApi* | [**post_list**](docs/LedgeraccountApi.md#post_list) | **POST** /ledger/account/list | [BETA] Create several accounts.
*TripletexRubyClient::LedgeraccountApi* | [**put**](docs/LedgeraccountApi.md#put) | **PUT** /ledger/account/{id} | [BETA] Update account.
*TripletexRubyClient::LedgeraccountApi* | [**put_list**](docs/LedgeraccountApi.md#put_list) | **PUT** /ledger/account/list | [BETA] Update multiple accounts.
*TripletexRubyClient::LedgeraccountApi* | [**search**](docs/LedgeraccountApi.md#search) | **GET** /ledger/account | Find accounts corresponding with sent data.
*TripletexRubyClient::LedgeraccountingPeriodApi* | [**get**](docs/LedgeraccountingPeriodApi.md#get) | **GET** /ledger/accountingPeriod/{id} | Get accounting period by ID.
*TripletexRubyClient::LedgeraccountingPeriodApi* | [**search**](docs/LedgeraccountingPeriodApi.md#search) | **GET** /ledger/accountingPeriod | Find accounting periods corresponding with sent data.
*TripletexRubyClient::LedgerannualAccountApi* | [**get**](docs/LedgerannualAccountApi.md#get) | **GET** /ledger/annualAccount/{id} | Get annual account by ID.
*TripletexRubyClient::LedgerannualAccountApi* | [**search**](docs/LedgerannualAccountApi.md#search) | **GET** /ledger/annualAccount | Find annual accounts corresponding with sent data.
*TripletexRubyClient::LedgercloseGroupApi* | [**get**](docs/LedgercloseGroupApi.md#get) | **GET** /ledger/closeGroup/{id} | Get close group by ID.
*TripletexRubyClient::LedgercloseGroupApi* | [**search**](docs/LedgercloseGroupApi.md#search) | **GET** /ledger/closeGroup | Find close groups corresponding with sent data.
*TripletexRubyClient::LedgerpaymentTypeOutApi* | [**delete**](docs/LedgerpaymentTypeOutApi.md#delete) | **DELETE** /ledger/paymentTypeOut/{id} | [BETA] Delete payment type for outgoing payments by ID.
*TripletexRubyClient::LedgerpaymentTypeOutApi* | [**get**](docs/LedgerpaymentTypeOutApi.md#get) | **GET** /ledger/paymentTypeOut/{id} | [BETA] Get payment type for outgoing payments by ID.
*TripletexRubyClient::LedgerpaymentTypeOutApi* | [**post**](docs/LedgerpaymentTypeOutApi.md#post) | **POST** /ledger/paymentTypeOut | [BETA] Create new payment type for outgoing payments
*TripletexRubyClient::LedgerpaymentTypeOutApi* | [**post_list**](docs/LedgerpaymentTypeOutApi.md#post_list) | **POST** /ledger/paymentTypeOut/list | [BETA] Create multiple payment types for outgoing payments at once
*TripletexRubyClient::LedgerpaymentTypeOutApi* | [**put**](docs/LedgerpaymentTypeOutApi.md#put) | **PUT** /ledger/paymentTypeOut/{id} | [BETA] Update existing payment type for outgoing payments
*TripletexRubyClient::LedgerpaymentTypeOutApi* | [**put_list**](docs/LedgerpaymentTypeOutApi.md#put_list) | **PUT** /ledger/paymentTypeOut/list | [BETA] Update multiple payment types for outgoing payments at once
*TripletexRubyClient::LedgerpaymentTypeOutApi* | [**search**](docs/LedgerpaymentTypeOutApi.md#search) | **GET** /ledger/paymentTypeOut | [BETA] Gets payment types for outgoing payments
*TripletexRubyClient::LedgerpostingApi* | [**get**](docs/LedgerpostingApi.md#get) | **GET** /ledger/posting/{id} | Find postings by ID.
*TripletexRubyClient::LedgerpostingApi* | [**open_post**](docs/LedgerpostingApi.md#open_post) | **GET** /ledger/posting/openPost | Find open posts corresponding with sent data.
*TripletexRubyClient::LedgerpostingApi* | [**search**](docs/LedgerpostingApi.md#search) | **GET** /ledger/posting | Find postings corresponding with sent data.
*TripletexRubyClient::LedgervatTypeApi* | [**create_relative_vat_type**](docs/LedgervatTypeApi.md#create_relative_vat_type) | **PUT** /ledger/vatType/createRelativeVatType | [BETA] Create a new relative VAT Type. These are used if the company has 'forholdsmessig fradrag for inngående MVA'.
*TripletexRubyClient::LedgervatTypeApi* | [**get**](docs/LedgervatTypeApi.md#get) | **GET** /ledger/vatType/{id} | Get vat type by ID.
*TripletexRubyClient::LedgervatTypeApi* | [**search**](docs/LedgervatTypeApi.md#search) | **GET** /ledger/vatType | Find vat types corresponding with sent data.
*TripletexRubyClient::LedgervoucherApi* | [**delete**](docs/LedgervoucherApi.md#delete) | **DELETE** /ledger/voucher/{id} | [BETA] Delete voucher by ID.
*TripletexRubyClient::LedgervoucherApi* | [**delete_attachment**](docs/LedgervoucherApi.md#delete_attachment) | **DELETE** /ledger/voucher/{voucherId}/attachment | [BETA] Delete attachment.
*TripletexRubyClient::LedgervoucherApi* | [**download_pdf**](docs/LedgervoucherApi.md#download_pdf) | **GET** /ledger/voucher/{voucherId}/pdf | Get PDF representation of voucher by ID.
*TripletexRubyClient::LedgervoucherApi* | [**external_voucher_number**](docs/LedgervoucherApi.md#external_voucher_number) | **GET** /ledger/voucher/&gt;externalVoucherNumber | [BETA] Find vouchers based on the external voucher number.
*TripletexRubyClient::LedgervoucherApi* | [**get**](docs/LedgervoucherApi.md#get) | **GET** /ledger/voucher/{id} | Get voucher by ID.
*TripletexRubyClient::LedgervoucherApi* | [**import_document**](docs/LedgervoucherApi.md#import_document) | **POST** /ledger/voucher/importDocument | [BETA] Upload a document to create one or more vouchers. Valid document formats are PDF, PNG, JPEG, TIFF and EHF. Send as multipart form.
*TripletexRubyClient::LedgervoucherApi* | [**import_gbat10**](docs/LedgervoucherApi.md#import_gbat10) | **POST** /ledger/voucher/importGbat10 | Import GBAT10. Send as multipart form.
*TripletexRubyClient::LedgervoucherApi* | [**non_posted**](docs/LedgervoucherApi.md#non_posted) | **GET** /ledger/voucher/&gt;nonPosted | [BETA] Find non-posted vouchers.
*TripletexRubyClient::LedgervoucherApi* | [**options**](docs/LedgervoucherApi.md#options) | **GET** /ledger/voucher/{id}/options | [BETA] Returns a data structure containing meta information about operations that are available for this voucher. Currently only implemented for DELETE: It is possible to check if the voucher is deletable.
*TripletexRubyClient::LedgervoucherApi* | [**post**](docs/LedgervoucherApi.md#post) | **POST** /ledger/voucher | Add new voucher. IMPORTANT: Also creates postings. Only the gross amounts will be used
*TripletexRubyClient::LedgervoucherApi* | [**put**](docs/LedgervoucherApi.md#put) | **PUT** /ledger/voucher/{id} | [BETA] Update voucher. Postings with guiRow==0 will be deleted and regenerated.
*TripletexRubyClient::LedgervoucherApi* | [**put_list**](docs/LedgervoucherApi.md#put_list) | **PUT** /ledger/voucher/list | [BETA] Update multiple vouchers. Postings with guiRow==0 will be deleted and regenerated.
*TripletexRubyClient::LedgervoucherApi* | [**reverse**](docs/LedgervoucherApi.md#reverse) | **PUT** /ledger/voucher/{id}/:reverse | Reverses the voucher, and returns the reversed voucher. Supports reversing most voucher types, except salary transactions.
*TripletexRubyClient::LedgervoucherApi* | [**search**](docs/LedgervoucherApi.md#search) | **GET** /ledger/voucher | Find vouchers corresponding with sent data.
*TripletexRubyClient::LedgervoucherApi* | [**send_to_inbox**](docs/LedgervoucherApi.md#send_to_inbox) | **PUT** /ledger/voucher/{id}/:sendToInbox | [BETA] Send voucher to inbox.
*TripletexRubyClient::LedgervoucherApi* | [**send_to_ledger**](docs/LedgervoucherApi.md#send_to_ledger) | **PUT** /ledger/voucher/{id}/:sendToLedger | [BETA] Send voucher to ledger.
*TripletexRubyClient::LedgervoucherApi* | [**upload_attachment**](docs/LedgervoucherApi.md#upload_attachment) | **POST** /ledger/voucher/{voucherId}/attachment | Upload attachment to voucher. If the voucher already has an attachment the content will be appended to the existing attachment as new PDF page(s). Valid document formats are PDF, PNG, JPEG and TIFF. Non PDF formats will be converted to PDF. Send as multipart form.
*TripletexRubyClient::LedgervoucherApi* | [**upload_pdf**](docs/LedgervoucherApi.md#upload_pdf) | **POST** /ledger/voucher/{voucherId}/pdf/{fileName} | [DEPRECATED] Use POST ledger/voucher/{voucherId}/attachment instead.
*TripletexRubyClient::LedgervoucherApi* | [**voucher_reception**](docs/LedgervoucherApi.md#voucher_reception) | **GET** /ledger/voucher/&gt;voucherReception | Find vouchers in voucher reception.
*TripletexRubyClient::LedgervoucherTypeApi* | [**get**](docs/LedgervoucherTypeApi.md#get) | **GET** /ledger/voucherType/{id} | Get voucher type by ID.
*TripletexRubyClient::LedgervoucherTypeApi* | [**search**](docs/LedgervoucherTypeApi.md#search) | **GET** /ledger/voucherType | Find voucher types corresponding with sent data.
*TripletexRubyClient::LedgervoucherhistoricalApi* | [**close_postings**](docs/LedgervoucherhistoricalApi.md#close_postings) | **PUT** /ledger/voucher/historical/:closePostings | [BETA] Close postings.
*TripletexRubyClient::LedgervoucherhistoricalApi* | [**post_employee**](docs/LedgervoucherhistoricalApi.md#post_employee) | **POST** /ledger/voucher/historical/employee | [BETA] Create one employee, based on import from external system. Validation is less strict, ie. employee department isn't required.
*TripletexRubyClient::LedgervoucherhistoricalApi* | [**post_historical**](docs/LedgervoucherhistoricalApi.md#post_historical) | **POST** /ledger/voucher/historical/historical | [BETA] API endpoint for creating historical vouchers. These are vouchers created outside Tripletex, and should be from closed accounting years. The intended usage is to get access to historical transcations in Tripletex. Also creates postings. All amount fields in postings will be used. VAT postings must be included, these are not generated automatically like they are for normal vouchers in Tripletex. Requires the \\\"All vouchers\\\" and \\\"Advanced Voucher\\\" permissions.
*TripletexRubyClient::LedgervoucherhistoricalApi* | [**reverse_historical_vouchers**](docs/LedgervoucherhistoricalApi.md#reverse_historical_vouchers) | **PUT** /ledger/voucher/historical/:reverseHistoricalVouchers | [BETA] Deletes all historical vouchers. Requires the \"All vouchers\" and \"Advanced Voucher\" permissions.
*TripletexRubyClient::LedgervoucherhistoricalApi* | [**upload_attachment**](docs/LedgervoucherhistoricalApi.md#upload_attachment) | **POST** /ledger/voucher/historical/{voucherId}/attachment | Upload attachment to voucher. If the voucher already has an attachment the content will be appended to the existing attachment as new PDF page(s). Valid document formats are PDF, PNG, JPEG and TIFF. Non PDF formats will be converted to PDF. Send as multipart form.
*TripletexRubyClient::MunicipalityApi* | [**search**](docs/MunicipalityApi.md#search) | **GET** /municipality | [BETA] Get municipalities.
*TripletexRubyClient::OrderApi* | [**approve_subscription_invoice**](docs/OrderApi.md#approve_subscription_invoice) | **PUT** /order/{id}/:approveSubscriptionInvoice | To create a subscription invoice, first create a order with the subscription enabled, then approve it with this method. This approves the order for subscription invoicing.
*TripletexRubyClient::OrderApi* | [**attach**](docs/OrderApi.md#attach) | **PUT** /order/{id}/:attach | Attach document to specified order ID.
*TripletexRubyClient::OrderApi* | [**get**](docs/OrderApi.md#get) | **GET** /order/{id} | Get order by ID.
*TripletexRubyClient::OrderApi* | [**invoice**](docs/OrderApi.md#invoice) | **PUT** /order/{id}/:invoice | Create new invoice from order.
*TripletexRubyClient::OrderApi* | [**invoice_multiple_orders**](docs/OrderApi.md#invoice_multiple_orders) | **PUT** /order/:invoiceMultipleOrders | [BETA] Charges a single customer invoice from multiple orders. The orders must be to the same customer, currency, due date, receiver email and attn.
*TripletexRubyClient::OrderApi* | [**post**](docs/OrderApi.md#post) | **POST** /order | Create order.
*TripletexRubyClient::OrderApi* | [**post_list**](docs/OrderApi.md#post_list) | **POST** /order/list | [BETA] Create multiple Orders with OrderLines. Max 100 at a time.
*TripletexRubyClient::OrderApi* | [**put**](docs/OrderApi.md#put) | **PUT** /order/{id} | Update order.
*TripletexRubyClient::OrderApi* | [**search**](docs/OrderApi.md#search) | **GET** /order | Find orders corresponding with sent data.
*TripletexRubyClient::OrderApi* | [**un_approve_subscription_invoice**](docs/OrderApi.md#un_approve_subscription_invoice) | **PUT** /order/{id}/:unApproveSubscriptionInvoice | Unapproves the order for subscription invoicing.
*TripletexRubyClient::OrderorderGroupApi* | [**delete**](docs/OrderorderGroupApi.md#delete) | **DELETE** /order/orderGroup/{id} | [Beta] Delete orderGroup by ID.
*TripletexRubyClient::OrderorderGroupApi* | [**get**](docs/OrderorderGroupApi.md#get) | **GET** /order/orderGroup/{id} | [Beta] Get orderGroup by ID. A orderGroup is a way to group orderLines, and add comments and subtotals
*TripletexRubyClient::OrderorderGroupApi* | [**post**](docs/OrderorderGroupApi.md#post) | **POST** /order/orderGroup | [Beta] Post orderGroup.
*TripletexRubyClient::OrderorderGroupApi* | [**put**](docs/OrderorderGroupApi.md#put) | **PUT** /order/orderGroup | [Beta] Put orderGroup.
*TripletexRubyClient::OrderorderGroupApi* | [**search**](docs/OrderorderGroupApi.md#search) | **GET** /order/orderGroup | [BETA] Find orderGroups corresponding with sent data.
*TripletexRubyClient::OrderorderlineApi* | [**delete**](docs/OrderorderlineApi.md#delete) | **DELETE** /order/orderline/{id} | [BETA] Delete order line by ID.
*TripletexRubyClient::OrderorderlineApi* | [**get**](docs/OrderorderlineApi.md#get) | **GET** /order/orderline/{id} | Get order line by ID.
*TripletexRubyClient::OrderorderlineApi* | [**post**](docs/OrderorderlineApi.md#post) | **POST** /order/orderline | Create order line. When creating several order lines, use /list for better performance.
*TripletexRubyClient::OrderorderlineApi* | [**post_list**](docs/OrderorderlineApi.md#post_list) | **POST** /order/orderline/list | Create multiple order lines.
*TripletexRubyClient::OrderorderlineApi* | [**put**](docs/OrderorderlineApi.md#put) | **PUT** /order/orderline/{id} | [BETA] Put order line
*TripletexRubyClient::PickupPointApi* | [**get**](docs/PickupPointApi.md#get) | **GET** /pickupPoint/{id} | [BETA] Find pickup point by ID.
*TripletexRubyClient::PickupPointApi* | [**search**](docs/PickupPointApi.md#search) | **GET** /pickupPoint | [BETA] Search pickup points.
*TripletexRubyClient::ProductApi* | [**delete**](docs/ProductApi.md#delete) | **DELETE** /product/{id} | [BETA] Delete product.
*TripletexRubyClient::ProductApi* | [**delete_image**](docs/ProductApi.md#delete_image) | **DELETE** /product/{id}/image | [BETA] Delete image.
*TripletexRubyClient::ProductApi* | [**get**](docs/ProductApi.md#get) | **GET** /product/{id} | Get product by ID.
*TripletexRubyClient::ProductApi* | [**post**](docs/ProductApi.md#post) | **POST** /product | Create new product.
*TripletexRubyClient::ProductApi* | [**post_list**](docs/ProductApi.md#post_list) | **POST** /product/list | [BETA] Add multiple products.
*TripletexRubyClient::ProductApi* | [**put**](docs/ProductApi.md#put) | **PUT** /product/{id} | Update product.
*TripletexRubyClient::ProductApi* | [**put_list**](docs/ProductApi.md#put_list) | **PUT** /product/list | [BETA] Update a list of products.
*TripletexRubyClient::ProductApi* | [**search**](docs/ProductApi.md#search) | **GET** /product | Find products corresponding with sent data.
*TripletexRubyClient::ProductApi* | [**upload_image**](docs/ProductApi.md#upload_image) | **POST** /product/{id}/image | [BETA] Upload image to Product. Existing image on product will be replaced if exists
*TripletexRubyClient::ProductdiscountGroupApi* | [**get**](docs/ProductdiscountGroupApi.md#get) | **GET** /product/discountGroup/{id} | Get discount group by ID.
*TripletexRubyClient::ProductdiscountGroupApi* | [**search**](docs/ProductdiscountGroupApi.md#search) | **GET** /product/discountGroup | Find discount groups corresponding with sent data.
*TripletexRubyClient::ProductexternalApi* | [**get**](docs/ProductexternalApi.md#get) | **GET** /product/external/{id} | [BETA] Get external product by ID.
*TripletexRubyClient::ProductexternalApi* | [**search**](docs/ProductexternalApi.md#search) | **GET** /product/external | [BETA] Find external products corresponding with sent data. The sorting-field is not in use on this endpoint.
*TripletexRubyClient::ProductgroupApi* | [**delete**](docs/ProductgroupApi.md#delete) | **DELETE** /product/group/{id} | [BETA] Delete product group.
*TripletexRubyClient::ProductgroupApi* | [**delete_by_ids**](docs/ProductgroupApi.md#delete_by_ids) | **DELETE** /product/group/list | [BETA] Delete multiple product groups.
*TripletexRubyClient::ProductgroupApi* | [**get**](docs/ProductgroupApi.md#get) | **GET** /product/group/{id} | [BETA] Find product group by ID.
*TripletexRubyClient::ProductgroupApi* | [**post**](docs/ProductgroupApi.md#post) | **POST** /product/group | [BETA] Create new product group.
*TripletexRubyClient::ProductgroupApi* | [**post_list**](docs/ProductgroupApi.md#post_list) | **POST** /product/group/list | [BETA] Add multiple products groups.
*TripletexRubyClient::ProductgroupApi* | [**put**](docs/ProductgroupApi.md#put) | **PUT** /product/group/{id} | [BETA] Update product group.
*TripletexRubyClient::ProductgroupApi* | [**put_list**](docs/ProductgroupApi.md#put_list) | **PUT** /product/group/list | [BETA] Update a list of product groups.
*TripletexRubyClient::ProductgroupApi* | [**search**](docs/ProductgroupApi.md#search) | **GET** /product/group | [BETA] Find product group with sent data
*TripletexRubyClient::ProductgroupRelationApi* | [**delete**](docs/ProductgroupRelationApi.md#delete) | **DELETE** /product/groupRelation/{id} | [BETA] Delete product group relation.
*TripletexRubyClient::ProductgroupRelationApi* | [**delete_by_ids**](docs/ProductgroupRelationApi.md#delete_by_ids) | **DELETE** /product/groupRelation/list | [BETA] Delete multiple product group relations.
*TripletexRubyClient::ProductgroupRelationApi* | [**get**](docs/ProductgroupRelationApi.md#get) | **GET** /product/groupRelation/{id} | [BETA] Find product group relation by ID.
*TripletexRubyClient::ProductgroupRelationApi* | [**post**](docs/ProductgroupRelationApi.md#post) | **POST** /product/groupRelation | [BETA] Create new product group relation.
*TripletexRubyClient::ProductgroupRelationApi* | [**post_list**](docs/ProductgroupRelationApi.md#post_list) | **POST** /product/groupRelation/list | [BETA] Add multiple products group relations.
*TripletexRubyClient::ProductgroupRelationApi* | [**search**](docs/ProductgroupRelationApi.md#search) | **GET** /product/groupRelation | [BETA] Find product group relation with sent data.
*TripletexRubyClient::ProductinventoryLocationApi* | [**delete**](docs/ProductinventoryLocationApi.md#delete) | **DELETE** /product/inventoryLocation/{id} | [BETA] Delete product inventory location. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::ProductinventoryLocationApi* | [**get**](docs/ProductinventoryLocationApi.md#get) | **GET** /product/inventoryLocation/{id} | Get inventory location by ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::ProductinventoryLocationApi* | [**post**](docs/ProductinventoryLocationApi.md#post) | **POST** /product/inventoryLocation | [BETA] Create new product inventory location. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::ProductinventoryLocationApi* | [**post_list**](docs/ProductinventoryLocationApi.md#post_list) | **POST** /product/inventoryLocation/list | [BETA] Add multiple product inventory locations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::ProductinventoryLocationApi* | [**put**](docs/ProductinventoryLocationApi.md#put) | **PUT** /product/inventoryLocation/{id} | [BETA] Update product inventory location. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::ProductinventoryLocationApi* | [**put_list**](docs/ProductinventoryLocationApi.md#put_list) | **PUT** /product/inventoryLocation/list | [BETA] Update multiple product inventory locations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::ProductinventoryLocationApi* | [**search**](docs/ProductinventoryLocationApi.md#search) | **GET** /product/inventoryLocation | [BETA] Find inventory locations by product ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::ProductlogisticsSettingsApi* | [**get**](docs/ProductlogisticsSettingsApi.md#get) | **GET** /product/logisticsSettings | [BETA] Get logistics settings of logged in company.
*TripletexRubyClient::ProductlogisticsSettingsApi* | [**put**](docs/ProductlogisticsSettingsApi.md#put) | **PUT** /product/logisticsSettings | [BETA] Update logistics settings of logged in company.
*TripletexRubyClient::ProductproductPriceApi* | [**search**](docs/ProductproductPriceApi.md#search) | **GET** /product/productPrice | [BETA] Find prices for a product. Only available for users that have activated the Logistics/Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::ProductsupplierProductApi* | [**delete**](docs/ProductsupplierProductApi.md#delete) | **DELETE** /product/supplierProduct/{id} | [BETA] Delete supplierProduct.
*TripletexRubyClient::ProductsupplierProductApi* | [**get**](docs/ProductsupplierProductApi.md#get) | **GET** /product/supplierProduct/{id} | Get supplierProduct by ID.
*TripletexRubyClient::ProductsupplierProductApi* | [**post**](docs/ProductsupplierProductApi.md#post) | **POST** /product/supplierProduct | Create new supplierProduct.
*TripletexRubyClient::ProductsupplierProductApi* | [**post_list**](docs/ProductsupplierProductApi.md#post_list) | **POST** /product/supplierProduct/list | Create list of new supplierProduct.
*TripletexRubyClient::ProductsupplierProductApi* | [**put**](docs/ProductsupplierProductApi.md#put) | **PUT** /product/supplierProduct/{id} | Update supplierProduct.
*TripletexRubyClient::ProductsupplierProductApi* | [**put_list**](docs/ProductsupplierProductApi.md#put_list) | **PUT** /product/supplierProduct/list | [BETA] Update a list of supplierProduct.
*TripletexRubyClient::ProductsupplierProductApi* | [**search**](docs/ProductsupplierProductApi.md#search) | **GET** /product/supplierProduct | Find products corresponding with sent data.
*TripletexRubyClient::ProductunitApi* | [**delete**](docs/ProductunitApi.md#delete) | **DELETE** /product/unit/{id} | [BETA] Delete product unit by ID.
*TripletexRubyClient::ProductunitApi* | [**get**](docs/ProductunitApi.md#get) | **GET** /product/unit/{id} | Get product unit by ID.
*TripletexRubyClient::ProductunitApi* | [**post**](docs/ProductunitApi.md#post) | **POST** /product/unit | [BETA] Create new product unit.
*TripletexRubyClient::ProductunitApi* | [**post_list**](docs/ProductunitApi.md#post_list) | **POST** /product/unit/list | [BETA] Create multiple product units.
*TripletexRubyClient::ProductunitApi* | [**put**](docs/ProductunitApi.md#put) | **PUT** /product/unit/{id} | [BETA] Update product unit.
*TripletexRubyClient::ProductunitApi* | [**put_list**](docs/ProductunitApi.md#put_list) | **PUT** /product/unit/list | [BETA] Update list of product units.
*TripletexRubyClient::ProductunitApi* | [**query**](docs/ProductunitApi.md#query) | **GET** /product/unit/query | [BETA] Wildcard search.
*TripletexRubyClient::ProductunitApi* | [**search**](docs/ProductunitApi.md#search) | **GET** /product/unit | Find product units corresponding with sent data.
*TripletexRubyClient::ProductunitmasterApi* | [**get**](docs/ProductunitmasterApi.md#get) | **GET** /product/unit/master/{id} | [BETA] Get product unit master by ID.
*TripletexRubyClient::ProductunitmasterApi* | [**search**](docs/ProductunitmasterApi.md#search) | **GET** /product/unit/master | [BETA] Find product units master corresponding with sent data.
*TripletexRubyClient::ProjectApi* | [**delete**](docs/ProjectApi.md#delete) | **DELETE** /project/{id} | [BETA] Delete project.
*TripletexRubyClient::ProjectApi* | [**delete_by_ids**](docs/ProjectApi.md#delete_by_ids) | **DELETE** /project/list | [BETA] Delete projects.
*TripletexRubyClient::ProjectApi* | [**delete_list**](docs/ProjectApi.md#delete_list) | **DELETE** /project | [BETA] Delete multiple projects.
*TripletexRubyClient::ProjectApi* | [**get**](docs/ProjectApi.md#get) | **GET** /project/{id} | Find project by ID.
*TripletexRubyClient::ProjectApi* | [**get_for_time_sheet**](docs/ProjectApi.md#get_for_time_sheet) | **GET** /project/&gt;forTimeSheet | Find projects applicable for time sheet registration on a specific day.
*TripletexRubyClient::ProjectApi* | [**post**](docs/ProjectApi.md#post) | **POST** /project | [BETA] Add new project.
*TripletexRubyClient::ProjectApi* | [**post_list**](docs/ProjectApi.md#post_list) | **POST** /project/list | [BETA] Register new projects. Multiple projects for different users can be sent in the same request.
*TripletexRubyClient::ProjectApi* | [**put**](docs/ProjectApi.md#put) | **PUT** /project/{id} | [BETA] Update project.
*TripletexRubyClient::ProjectApi* | [**put_list**](docs/ProjectApi.md#put_list) | **PUT** /project/list | [BETA] Update multiple projects.
*TripletexRubyClient::ProjectApi* | [**search**](docs/ProjectApi.md#search) | **GET** /project | Find projects corresponding with sent data.
*TripletexRubyClient::ProjectcategoryApi* | [**get**](docs/ProjectcategoryApi.md#get) | **GET** /project/category/{id} | Find project category by ID.
*TripletexRubyClient::ProjectcategoryApi* | [**post**](docs/ProjectcategoryApi.md#post) | **POST** /project/category | Add new project category.
*TripletexRubyClient::ProjectcategoryApi* | [**put**](docs/ProjectcategoryApi.md#put) | **PUT** /project/category/{id} | Update project category.
*TripletexRubyClient::ProjectcategoryApi* | [**search**](docs/ProjectcategoryApi.md#search) | **GET** /project/category | Find project categories corresponding with sent data.
*TripletexRubyClient::ProjectcontrolFormApi* | [**get**](docs/ProjectcontrolFormApi.md#get) | **GET** /project/controlForm/{id} | [BETA] Get project control form by ID.
*TripletexRubyClient::ProjectcontrolFormApi* | [**search**](docs/ProjectcontrolFormApi.md#search) | **GET** /project/controlForm | [BETA] Get project control forms by project ID.
*TripletexRubyClient::ProjectcontrolFormTypeApi* | [**get**](docs/ProjectcontrolFormTypeApi.md#get) | **GET** /project/controlFormType/{id} | [BETA] Get project control form type by ID.
*TripletexRubyClient::ProjectcontrolFormTypeApi* | [**search**](docs/ProjectcontrolFormTypeApi.md#search) | **GET** /project/controlFormType | [BETA] Get project control form types
*TripletexRubyClient::ProjecthourlyRatesApi* | [**delete**](docs/ProjecthourlyRatesApi.md#delete) | **DELETE** /project/hourlyRates/{id} | Delete Project Hourly Rate 
*TripletexRubyClient::ProjecthourlyRatesApi* | [**delete_by_ids**](docs/ProjecthourlyRatesApi.md#delete_by_ids) | **DELETE** /project/hourlyRates/list | Delete project hourly rates.
*TripletexRubyClient::ProjecthourlyRatesApi* | [**delete_by_project_ids**](docs/ProjecthourlyRatesApi.md#delete_by_project_ids) | **DELETE** /project/hourlyRates/deleteByProjectIds | Delete project hourly rates by project id.
*TripletexRubyClient::ProjecthourlyRatesApi* | [**get**](docs/ProjecthourlyRatesApi.md#get) | **GET** /project/hourlyRates/{id} | Find project hourly rate by ID.
*TripletexRubyClient::ProjecthourlyRatesApi* | [**post**](docs/ProjecthourlyRatesApi.md#post) | **POST** /project/hourlyRates | Create a project hourly rate. 
*TripletexRubyClient::ProjecthourlyRatesApi* | [**post_list**](docs/ProjecthourlyRatesApi.md#post_list) | **POST** /project/hourlyRates/list | Create multiple project hourly rates.
*TripletexRubyClient::ProjecthourlyRatesApi* | [**put**](docs/ProjecthourlyRatesApi.md#put) | **PUT** /project/hourlyRates/{id} | Update a project hourly rate.
*TripletexRubyClient::ProjecthourlyRatesApi* | [**put_list**](docs/ProjecthourlyRatesApi.md#put_list) | **PUT** /project/hourlyRates/list | Update multiple project hourly rates.
*TripletexRubyClient::ProjecthourlyRatesApi* | [**search**](docs/ProjecthourlyRatesApi.md#search) | **GET** /project/hourlyRates | Find project hourly rates corresponding with sent data.
*TripletexRubyClient::ProjecthourlyRatesApi* | [**update_or_add_hour_rates**](docs/ProjecthourlyRatesApi.md#update_or_add_hour_rates) | **PUT** /project/hourlyRates/updateOrAddHourRates | Update or add the same project hourly rate from project overview.
*TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi* | [**delete**](docs/ProjecthourlyRatesprojectSpecificRatesApi.md#delete) | **DELETE** /project/hourlyRates/projectSpecificRates/{id} | Delete project specific rate 
*TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi* | [**delete_by_ids**](docs/ProjecthourlyRatesprojectSpecificRatesApi.md#delete_by_ids) | **DELETE** /project/hourlyRates/projectSpecificRates/list | Delete project specific rates.
*TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi* | [**get**](docs/ProjecthourlyRatesprojectSpecificRatesApi.md#get) | **GET** /project/hourlyRates/projectSpecificRates/{id} | Find project specific rate by ID.
*TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi* | [**post**](docs/ProjecthourlyRatesprojectSpecificRatesApi.md#post) | **POST** /project/hourlyRates/projectSpecificRates | Create new project specific rate. 
*TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi* | [**post_list**](docs/ProjecthourlyRatesprojectSpecificRatesApi.md#post_list) | **POST** /project/hourlyRates/projectSpecificRates/list | Create multiple new project specific rates.
*TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi* | [**put**](docs/ProjecthourlyRatesprojectSpecificRatesApi.md#put) | **PUT** /project/hourlyRates/projectSpecificRates/{id} | Update a project specific rate.
*TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi* | [**put_list**](docs/ProjecthourlyRatesprojectSpecificRatesApi.md#put_list) | **PUT** /project/hourlyRates/projectSpecificRates/list | Update multiple project specific rates.
*TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi* | [**search**](docs/ProjecthourlyRatesprojectSpecificRatesApi.md#search) | **GET** /project/hourlyRates/projectSpecificRates | Find project specific rates corresponding with sent data.
*TripletexRubyClient::ProjectimportApi* | [**import_project_statement**](docs/ProjectimportApi.md#import_project_statement) | **POST** /project/import | Upload project import file.
*TripletexRubyClient::ProjectorderlineApi* | [**delete**](docs/ProjectorderlineApi.md#delete) | **DELETE** /project/orderline/{id} | Delete order line by ID.
*TripletexRubyClient::ProjectorderlineApi* | [**get**](docs/ProjectorderlineApi.md#get) | **GET** /project/orderline/{id} | [BETA] Get order line by ID.
*TripletexRubyClient::ProjectorderlineApi* | [**post**](docs/ProjectorderlineApi.md#post) | **POST** /project/orderline | [BETA] Create order line. When creating several order lines, use /list for better performance.
*TripletexRubyClient::ProjectorderlineApi* | [**post_list**](docs/ProjectorderlineApi.md#post_list) | **POST** /project/orderline/list | [BETA] Create multiple order lines.
*TripletexRubyClient::ProjectorderlineApi* | [**put**](docs/ProjectorderlineApi.md#put) | **PUT** /project/orderline/{id} | [BETA] Update project orderline.
*TripletexRubyClient::ProjectorderlineApi* | [**search**](docs/ProjectorderlineApi.md#search) | **GET** /project/orderline | [BETA] Find all order lines for project.
*TripletexRubyClient::ProjectparticipantApi* | [**delete_by_ids**](docs/ProjectparticipantApi.md#delete_by_ids) | **DELETE** /project/participant/list | [BETA] Delete project participants.
*TripletexRubyClient::ProjectparticipantApi* | [**get**](docs/ProjectparticipantApi.md#get) | **GET** /project/participant/{id} | [BETA] Find project participant by ID.
*TripletexRubyClient::ProjectparticipantApi* | [**post**](docs/ProjectparticipantApi.md#post) | **POST** /project/participant | [BETA] Add new project participant.
*TripletexRubyClient::ProjectparticipantApi* | [**post_list**](docs/ProjectparticipantApi.md#post_list) | **POST** /project/participant/list | [BETA] Add new project participant. Multiple project participants can be sent in the same request.
*TripletexRubyClient::ProjectparticipantApi* | [**put**](docs/ProjectparticipantApi.md#put) | **PUT** /project/participant/{id} | [BETA] Update project participant.
*TripletexRubyClient::ProjectperiodApi* | [**get_budget_status**](docs/ProjectperiodApi.md#get_budget_status) | **GET** /project/{id}/period/budgetStatus | Get the budget status for the project period
*TripletexRubyClient::ProjectperiodApi* | [**hourlist_report**](docs/ProjectperiodApi.md#hourlist_report) | **GET** /project/{id}/period/hourlistReport | Find hourlist report by project period.
*TripletexRubyClient::ProjectperiodApi* | [**invoiced**](docs/ProjectperiodApi.md#invoiced) | **GET** /project/{id}/period/invoiced | Find invoiced info by project period.
*TripletexRubyClient::ProjectperiodApi* | [**invoicing_reserve**](docs/ProjectperiodApi.md#invoicing_reserve) | **GET** /project/{id}/period/invoicingReserve | Find invoicing reserve by project period.
*TripletexRubyClient::ProjectperiodApi* | [**monthly_status**](docs/ProjectperiodApi.md#monthly_status) | **GET** /project/{id}/period/monthlyStatus | Find overall status by project period.
*TripletexRubyClient::ProjectperiodApi* | [**overall_status**](docs/ProjectperiodApi.md#overall_status) | **GET** /project/{id}/period/overallStatus | Find overall status by project period.
*TripletexRubyClient::ProjectprojectActivityApi* | [**delete**](docs/ProjectprojectActivityApi.md#delete) | **DELETE** /project/projectActivity/{id} | Delete project activity
*TripletexRubyClient::ProjectprojectActivityApi* | [**delete_by_ids**](docs/ProjectprojectActivityApi.md#delete_by_ids) | **DELETE** /project/projectActivity/list | Delete project activities
*TripletexRubyClient::ProjectprojectActivityApi* | [**get**](docs/ProjectprojectActivityApi.md#get) | **GET** /project/projectActivity/{id} | Find project activity by id
*TripletexRubyClient::ProjectprojectActivityApi* | [**post**](docs/ProjectprojectActivityApi.md#post) | **POST** /project/projectActivity | Add project activity.
*TripletexRubyClient::ProjectsettingsApi* | [**get**](docs/ProjectsettingsApi.md#get) | **GET** /project/settings | Get project settings of logged in company.
*TripletexRubyClient::ProjectsettingsApi* | [**put**](docs/ProjectsettingsApi.md#put) | **PUT** /project/settings | Update project settings for company
*TripletexRubyClient::ProjecttaskApi* | [**search**](docs/ProjecttaskApi.md#search) | **GET** /project/task | Find all tasks for project.
*TripletexRubyClient::ProjecttemplateApi* | [**get**](docs/ProjecttemplateApi.md#get) | **GET** /project/template/{id} | Get project template by ID.
*TripletexRubyClient::PurchaseOrderApi* | [**delete**](docs/PurchaseOrderApi.md#delete) | **DELETE** /purchaseOrder/{id} |  [BETA] Delete purchase order.
*TripletexRubyClient::PurchaseOrderApi* | [**delete_attachment**](docs/PurchaseOrderApi.md#delete_attachment) | **DELETE** /purchaseOrder/{id}/attachment | [BETA] Delete attachment.
*TripletexRubyClient::PurchaseOrderApi* | [**get**](docs/PurchaseOrderApi.md#get) | **GET** /purchaseOrder/{id} |  [BETA] Find purchase order by ID.
*TripletexRubyClient::PurchaseOrderApi* | [**post**](docs/PurchaseOrderApi.md#post) | **POST** /purchaseOrder | [BETA] Creates a new purchase order
*TripletexRubyClient::PurchaseOrderApi* | [**put**](docs/PurchaseOrderApi.md#put) | **PUT** /purchaseOrder/{id} |  [BETA] Update purchase order.
*TripletexRubyClient::PurchaseOrderApi* | [**search**](docs/PurchaseOrderApi.md#search) | **GET** /purchaseOrder | [BETA] Find purchase orders with send data
*TripletexRubyClient::PurchaseOrderApi* | [**send**](docs/PurchaseOrderApi.md#send) | **PUT** /purchaseOrder/{id}/:send | [BETA] Send purchase order by id and sendType.
*TripletexRubyClient::PurchaseOrderApi* | [**send_by_email**](docs/PurchaseOrderApi.md#send_by_email) | **PUT** /purchaseOrder/{id}/:sendByEmail | [BETA] Send purchase order by customisable email.
*TripletexRubyClient::PurchaseOrderApi* | [**upload_attachment**](docs/PurchaseOrderApi.md#upload_attachment) | **POST** /purchaseOrder/{id}/attachment | [BETA] Upload attachment to Purchase Order.
*TripletexRubyClient::PurchaseOrderApi* | [**upload_attachments**](docs/PurchaseOrderApi.md#upload_attachments) | **POST** /purchaseOrder/{id}/attachment/list | Upload multiple attachments to Purchase Order.
*TripletexRubyClient::PurchaseOrderdeviationApi* | [**approve**](docs/PurchaseOrderdeviationApi.md#approve) | **PUT** /purchaseOrder/deviation/{id}/:approve | [BETA] Approve deviations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrderdeviationApi* | [**delete**](docs/PurchaseOrderdeviationApi.md#delete) | **DELETE** /purchaseOrder/deviation/{id} | [BETA] Delete goods receipt by purchase order ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrderdeviationApi* | [**deliver**](docs/PurchaseOrderdeviationApi.md#deliver) | **PUT** /purchaseOrder/deviation/{id}/:deliver | [BETA] Send deviations to approval. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrderdeviationApi* | [**get**](docs/PurchaseOrderdeviationApi.md#get) | **GET** /purchaseOrder/deviation/{id} |  [BETA] Get deviation by order line ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrderdeviationApi* | [**post**](docs/PurchaseOrderdeviationApi.md#post) | **POST** /purchaseOrder/deviation | [BETA] Register deviation on goods receipt. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrderdeviationApi* | [**post_list**](docs/PurchaseOrderdeviationApi.md#post_list) | **POST** /purchaseOrder/deviation/list | [BETA] Register multiple deviations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrderdeviationApi* | [**put**](docs/PurchaseOrderdeviationApi.md#put) | **PUT** /purchaseOrder/deviation/{id} | Update deviation. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrderdeviationApi* | [**put_list**](docs/PurchaseOrderdeviationApi.md#put_list) | **PUT** /purchaseOrder/deviation/list | [BETA] Update multiple deviations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrderdeviationApi* | [**search**](docs/PurchaseOrderdeviationApi.md#search) | **GET** /purchaseOrder/deviation | [BETA] Find handled deviations for purchase order. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrderdeviationApi* | [**undeliver**](docs/PurchaseOrderdeviationApi.md#undeliver) | **PUT** /purchaseOrder/deviation/{id}/:undeliver | [BETA] Undeliver the deviations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrdergoodsReceiptApi* | [**confirm**](docs/PurchaseOrdergoodsReceiptApi.md#confirm) | **PUT** /purchaseOrder/goodsReceipt/{id}/:confirm | [BETA] Confirm goods receipt. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrdergoodsReceiptApi* | [**delete**](docs/PurchaseOrdergoodsReceiptApi.md#delete) | **DELETE** /purchaseOrder/goodsReceipt/{id} | [BETA] Delete goods receipt by ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrdergoodsReceiptApi* | [**delete_by_ids**](docs/PurchaseOrdergoodsReceiptApi.md#delete_by_ids) | **DELETE** /purchaseOrder/goodsReceipt/list | [BETA] Delete multiple goods receipt by ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrdergoodsReceiptApi* | [**get**](docs/PurchaseOrdergoodsReceiptApi.md#get) | **GET** /purchaseOrder/goodsReceipt/{id} | [BETA] Get goods receipt by purchase order ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrdergoodsReceiptApi* | [**post**](docs/PurchaseOrdergoodsReceiptApi.md#post) | **POST** /purchaseOrder/goodsReceipt | [BETA] Register goods receipt without an existing purchase order. When registration of several goods receipt, use /list for better performance. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrdergoodsReceiptApi* | [**post_list**](docs/PurchaseOrdergoodsReceiptApi.md#post_list) | **POST** /purchaseOrder/goodsReceipt/list | [BETA] Register multiple goods receipt without an existing purchase order. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrdergoodsReceiptApi* | [**put**](docs/PurchaseOrdergoodsReceiptApi.md#put) | **PUT** /purchaseOrder/goodsReceipt/{id} | [BETA] Update goods receipt. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrdergoodsReceiptApi* | [**receive_and_confirm**](docs/PurchaseOrdergoodsReceiptApi.md#receive_and_confirm) | **PUT** /purchaseOrder/goodsReceipt/{id}/:receiveAndConfirm | [BETA]  Receive all ordered products and approve goods receipt. Only available for users that have activated the Logistics/Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrdergoodsReceiptApi* | [**register_goods_receipt**](docs/PurchaseOrdergoodsReceiptApi.md#register_goods_receipt) | **PUT** /purchaseOrder/goodsReceipt/{id}/:registerGoodsReceipt | [BETA] Register goods receipt. Quantity received on the products is set to the same as quantity ordered. To update the quantity received, use PUT /purchaseOrder/goodsReceiptLine/{id}. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrdergoodsReceiptApi* | [**search**](docs/PurchaseOrdergoodsReceiptApi.md#search) | **GET** /purchaseOrder/goodsReceipt | [BETA] Get goods receipt. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrdergoodsReceiptLineApi* | [**delete**](docs/PurchaseOrdergoodsReceiptLineApi.md#delete) | **DELETE** /purchaseOrder/goodsReceiptLine/{id} | [BETA] Delete goods receipt line by ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrdergoodsReceiptLineApi* | [**delete_list**](docs/PurchaseOrdergoodsReceiptLineApi.md#delete_list) | **DELETE** /purchaseOrder/goodsReceiptLine/list | [BETA] Delete goods receipt lines by ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrdergoodsReceiptLineApi* | [**get**](docs/PurchaseOrdergoodsReceiptLineApi.md#get) | **GET** /purchaseOrder/goodsReceiptLine/{id} | [BETA] Get goods receipt line by purchase order line ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrdergoodsReceiptLineApi* | [**post**](docs/PurchaseOrdergoodsReceiptLineApi.md#post) | **POST** /purchaseOrder/goodsReceiptLine | [BETA] Register new goods receipt; new product on an existing purchase order. When registration of several goods receipt, use /list for better performance. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrdergoodsReceiptLineApi* | [**post_list**](docs/PurchaseOrdergoodsReceiptLineApi.md#post_list) | **POST** /purchaseOrder/goodsReceiptLine/list | [BETA] Register multiple new goods receipt on an existing purchase order. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrdergoodsReceiptLineApi* | [**put**](docs/PurchaseOrdergoodsReceiptLineApi.md#put) | **PUT** /purchaseOrder/goodsReceiptLine/{id} | [BETA] Update a goods receipt line on a goods receipt. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrdergoodsReceiptLineApi* | [**put_list**](docs/PurchaseOrdergoodsReceiptLineApi.md#put_list) | **PUT** /purchaseOrder/goodsReceiptLine/list | [BETA] Update goods receipt lines on a goods receipt. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrdergoodsReceiptLineApi* | [**search**](docs/PurchaseOrdergoodsReceiptLineApi.md#search) | **GET** /purchaseOrder/goodsReceiptLine | [BETA] Find goods receipt lines for purchase order. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrderorderlineApi* | [**delete**](docs/PurchaseOrderorderlineApi.md#delete) | **DELETE** /purchaseOrder/orderline/{id} |  [BETA] Delete purchase order line.
*TripletexRubyClient::PurchaseOrderorderlineApi* | [**get**](docs/PurchaseOrderorderlineApi.md#get) | **GET** /purchaseOrder/orderline/{id} |  [BETA] Find purchase order line by ID.
*TripletexRubyClient::PurchaseOrderorderlineApi* | [**post**](docs/PurchaseOrderorderlineApi.md#post) | **POST** /purchaseOrder/orderline |  [BETA] Creates purchase order line.
*TripletexRubyClient::PurchaseOrderorderlineApi* | [**put**](docs/PurchaseOrderorderlineApi.md#put) | **PUT** /purchaseOrder/orderline/{id} |  [BETA] Updates purchase order line
*TripletexRubyClient::PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi* | [**delete**](docs/PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.md#delete) | **DELETE** /purchaseOrder/purchaseOrderIncomingInvoiceRelation/{id} | [BETA] Delete purchase order voucher relation. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi* | [**delete_by_ids**](docs/PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.md#delete_by_ids) | **DELETE** /purchaseOrder/purchaseOrderIncomingInvoiceRelation/list | [BETA] Delete multiple purchase order voucher relations. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi* | [**get**](docs/PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.md#get) | **GET** /purchaseOrder/purchaseOrderIncomingInvoiceRelation/{id} | [BETA] Find purchase order relation to voucher by ID. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi* | [**post**](docs/PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.md#post) | **POST** /purchaseOrder/purchaseOrderIncomingInvoiceRelation | [BETA] Create new relation between purchase order and a voucher. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi* | [**post_list**](docs/PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.md#post_list) | **POST** /purchaseOrder/purchaseOrderIncomingInvoiceRelation/list | [BETA] Create a new list of relations between purchase order and voucher. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi* | [**search**](docs/PurchaseOrderpurchaseOrderIncomingInvoiceRelationApi.md#search) | **GET** /purchaseOrder/purchaseOrderIncomingInvoiceRelation | [BETA] Find purchase order relation to voucher with sent data. Only available for users that have activated the Logistics Plus Beta-program in 'Our customer account'
*TripletexRubyClient::ReminderApi* | [**get**](docs/ReminderApi.md#get) | **GET** /reminder/{id} | Get reminder by ID.
*TripletexRubyClient::ReminderApi* | [**search**](docs/ReminderApi.md#search) | **GET** /reminder | Find reminders corresponding with sent data.
*TripletexRubyClient::ResultbudgetApi* | [**get_company_result_budget**](docs/ResultbudgetApi.md#get_company_result_budget) | **GET** /resultbudget/company | Get result budget for company
*TripletexRubyClient::ResultbudgetApi* | [**get_department_result_budget**](docs/ResultbudgetApi.md#get_department_result_budget) | **GET** /resultbudget/department/{id} | Get result budget associated with a departmentId
*TripletexRubyClient::ResultbudgetApi* | [**get_employee_result_budget**](docs/ResultbudgetApi.md#get_employee_result_budget) | **GET** /resultbudget/employee/{id} | Get result budget associated with an employeeId
*TripletexRubyClient::ResultbudgetApi* | [**get_product_result_budget**](docs/ResultbudgetApi.md#get_product_result_budget) | **GET** /resultbudget/product/{id} | Get result budget associated with a productId
*TripletexRubyClient::ResultbudgetApi* | [**get_project_result_budget**](docs/ResultbudgetApi.md#get_project_result_budget) | **GET** /resultbudget/project/{id} | Get result budget associated with a projectId
*TripletexRubyClient::SaftApi* | [**export_saft**](docs/SaftApi.md#export_saft) | **GET** /saft/exportSAFT | [BETA] Create SAF-T export for the Tripletex account.
*TripletexRubyClient::SaftApi* | [**import_saft**](docs/SaftApi.md#import_saft) | **POST** /saft/importSAFT | [BETA] Import SAF-T. Send XML file as multipart form.
*TripletexRubyClient::SalarycompilationApi* | [**download_pdf**](docs/SalarycompilationApi.md#download_pdf) | **GET** /salary/compilation/pdf | [BETA] Find salary compilation (PDF document) by employee.
*TripletexRubyClient::SalarycompilationApi* | [**get**](docs/SalarycompilationApi.md#get) | **GET** /salary/compilation | [BETA] Find salary compilation by employee.
*TripletexRubyClient::SalarypayslipApi* | [**download_pdf**](docs/SalarypayslipApi.md#download_pdf) | **GET** /salary/payslip/{id}/pdf | [BETA] Find payslip (PDF document) by ID.
*TripletexRubyClient::SalarypayslipApi* | [**get**](docs/SalarypayslipApi.md#get) | **GET** /salary/payslip/{id} | [BETA] Find payslip by ID.
*TripletexRubyClient::SalarypayslipApi* | [**search**](docs/SalarypayslipApi.md#search) | **GET** /salary/payslip | [BETA] Find payslips corresponding with sent data.
*TripletexRubyClient::SalarysettingsApi* | [**get**](docs/SalarysettingsApi.md#get) | **GET** /salary/settings | [BETA] Get salary settings of logged in company.
*TripletexRubyClient::SalarysettingsApi* | [**put**](docs/SalarysettingsApi.md#put) | **PUT** /salary/settings | [BETA] Update settings of logged in company.
*TripletexRubyClient::SalarysettingsholidayApi* | [**delete_by_ids**](docs/SalarysettingsholidayApi.md#delete_by_ids) | **DELETE** /salary/settings/holiday/list | [BETA] delete multiple holiday settings of current logged in company.
*TripletexRubyClient::SalarysettingsholidayApi* | [**post**](docs/SalarysettingsholidayApi.md#post) | **POST** /salary/settings/holiday | [BETA] Create a holiday setting of current logged in company.
*TripletexRubyClient::SalarysettingsholidayApi* | [**post_list**](docs/SalarysettingsholidayApi.md#post_list) | **POST** /salary/settings/holiday/list | [BETA] Create multiple holiday settings of current logged in company.
*TripletexRubyClient::SalarysettingsholidayApi* | [**put**](docs/SalarysettingsholidayApi.md#put) | **PUT** /salary/settings/holiday/{id} | [BETA] update a holiday setting of current logged in company.
*TripletexRubyClient::SalarysettingsholidayApi* | [**put_list**](docs/SalarysettingsholidayApi.md#put_list) | **PUT** /salary/settings/holiday/list | [BETA] update multiple holiday settings of current logged in company.
*TripletexRubyClient::SalarysettingsholidayApi* | [**search**](docs/SalarysettingsholidayApi.md#search) | **GET** /salary/settings/holiday | [BETA] Find holiday settings of current logged in company.
*TripletexRubyClient::SalarysettingspensionSchemeApi* | [**delete**](docs/SalarysettingspensionSchemeApi.md#delete) | **DELETE** /salary/settings/pensionScheme/{id} | [BETA] Delete a Pension Scheme
*TripletexRubyClient::SalarysettingspensionSchemeApi* | [**delete_by_ids**](docs/SalarysettingspensionSchemeApi.md#delete_by_ids) | **DELETE** /salary/settings/pensionScheme/list | [BETA] delete multiple Pension Schemes.
*TripletexRubyClient::SalarysettingspensionSchemeApi* | [**get**](docs/SalarysettingspensionSchemeApi.md#get) | **GET** /salary/settings/pensionScheme/{id} | [BETA] Get Pension Scheme for a specific ID
*TripletexRubyClient::SalarysettingspensionSchemeApi* | [**post**](docs/SalarysettingspensionSchemeApi.md#post) | **POST** /salary/settings/pensionScheme | [BETA] Create a Pension Scheme.
*TripletexRubyClient::SalarysettingspensionSchemeApi* | [**post_list**](docs/SalarysettingspensionSchemeApi.md#post_list) | **POST** /salary/settings/pensionScheme/list | [BETA] Create multiple Pension Schemes.
*TripletexRubyClient::SalarysettingspensionSchemeApi* | [**put**](docs/SalarysettingspensionSchemeApi.md#put) | **PUT** /salary/settings/pensionScheme/{id} | [BETA] Update a Pension Scheme
*TripletexRubyClient::SalarysettingspensionSchemeApi* | [**put_list**](docs/SalarysettingspensionSchemeApi.md#put_list) | **PUT** /salary/settings/pensionScheme/list | [BETA] update multiple Pension Schemes.
*TripletexRubyClient::SalarysettingspensionSchemeApi* | [**search**](docs/SalarysettingspensionSchemeApi.md#search) | **GET** /salary/settings/pensionScheme | [BETA] Find pension schemes.
*TripletexRubyClient::SalarytransactionApi* | [**delete**](docs/SalarytransactionApi.md#delete) | **DELETE** /salary/transaction/{id} | [BETA] Delete salary transaction by ID.
*TripletexRubyClient::SalarytransactionApi* | [**get**](docs/SalarytransactionApi.md#get) | **GET** /salary/transaction/{id} | [BETA] Find salary transaction by ID.
*TripletexRubyClient::SalarytransactionApi* | [**post**](docs/SalarytransactionApi.md#post) | **POST** /salary/transaction | [BETA] Create a new salary transaction.
*TripletexRubyClient::SalarytypeApi* | [**get**](docs/SalarytypeApi.md#get) | **GET** /salary/type/{id} | [BETA] Find salary type by ID.
*TripletexRubyClient::SalarytypeApi* | [**search**](docs/SalarytypeApi.md#search) | **GET** /salary/type | [BETA] Find salary type corresponding with sent data.
*TripletexRubyClient::SupplierApi* | [**delete**](docs/SupplierApi.md#delete) | **DELETE** /supplier/{id} | [BETA] Delete supplier by ID
*TripletexRubyClient::SupplierApi* | [**get**](docs/SupplierApi.md#get) | **GET** /supplier/{id} | Get supplier by ID.
*TripletexRubyClient::SupplierApi* | [**post**](docs/SupplierApi.md#post) | **POST** /supplier | Create supplier. Related supplier addresses may also be created.
*TripletexRubyClient::SupplierApi* | [**post_list**](docs/SupplierApi.md#post_list) | **POST** /supplier/list | [BETA] Create multiple suppliers. Related supplier addresses may also be created.
*TripletexRubyClient::SupplierApi* | [**put**](docs/SupplierApi.md#put) | **PUT** /supplier/{id} | Update supplier. 
*TripletexRubyClient::SupplierApi* | [**put_list**](docs/SupplierApi.md#put_list) | **PUT** /supplier/list | [BETA] Update multiple suppliers. Addresses can also be updated.
*TripletexRubyClient::SupplierApi* | [**search**](docs/SupplierApi.md#search) | **GET** /supplier | Find suppliers corresponding with sent data.
*TripletexRubyClient::SupplierInvoiceApi* | [**add_payment**](docs/SupplierInvoiceApi.md#add_payment) | **POST** /supplierInvoice/{invoiceId}/:addPayment | [BETA] Register payment, paymentType == 0 finds the last paymentType for this vendor
*TripletexRubyClient::SupplierInvoiceApi* | [**add_recipient**](docs/SupplierInvoiceApi.md#add_recipient) | **PUT** /supplierInvoice/{invoiceId}/:addRecipient | [BETA] Add recipient to supplier invoices.
*TripletexRubyClient::SupplierInvoiceApi* | [**add_recipient_to_many**](docs/SupplierInvoiceApi.md#add_recipient_to_many) | **PUT** /supplierInvoice/:addRecipient | [BETA] Add recipient.
*TripletexRubyClient::SupplierInvoiceApi* | [**approve**](docs/SupplierInvoiceApi.md#approve) | **PUT** /supplierInvoice/{invoiceId}/:approve | [BETA] Approve supplier invoice.
*TripletexRubyClient::SupplierInvoiceApi* | [**approve_many**](docs/SupplierInvoiceApi.md#approve_many) | **PUT** /supplierInvoice/:approve | [BETA] Approve supplier invoices.
*TripletexRubyClient::SupplierInvoiceApi* | [**change_dimension_many**](docs/SupplierInvoiceApi.md#change_dimension_many) | **PUT** /supplierInvoice/{invoiceId}/:changeDimension | Change dimension on a supplier invoice.
*TripletexRubyClient::SupplierInvoiceApi* | [**download_pdf**](docs/SupplierInvoiceApi.md#download_pdf) | **GET** /supplierInvoice/{invoiceId}/pdf | [BETA] Get supplierInvoice document by invoice ID.
*TripletexRubyClient::SupplierInvoiceApi* | [**get**](docs/SupplierInvoiceApi.md#get) | **GET** /supplierInvoice/{id} | [BETA] Get supplierInvoice by ID.
*TripletexRubyClient::SupplierInvoiceApi* | [**get_approval_invoices**](docs/SupplierInvoiceApi.md#get_approval_invoices) | **GET** /supplierInvoice/forApproval | [BETA] Get supplierInvoices for approval
*TripletexRubyClient::SupplierInvoiceApi* | [**put_postings**](docs/SupplierInvoiceApi.md#put_postings) | **PUT** /supplierInvoice/voucher/{id}/postings | [BETA] Put debit postings.
*TripletexRubyClient::SupplierInvoiceApi* | [**reject**](docs/SupplierInvoiceApi.md#reject) | **PUT** /supplierInvoice/{invoiceId}/:reject | [BETA] reject supplier invoice.
*TripletexRubyClient::SupplierInvoiceApi* | [**reject_many**](docs/SupplierInvoiceApi.md#reject_many) | **PUT** /supplierInvoice/:reject | [BETA] reject supplier invoices.
*TripletexRubyClient::SupplierInvoiceApi* | [**search**](docs/SupplierInvoiceApi.md#search) | **GET** /supplierInvoice | [BETA] Find supplierInvoices corresponding with sent data.
*TripletexRubyClient::TimesheetentryApi* | [**delete**](docs/TimesheetentryApi.md#delete) | **DELETE** /timesheet/entry/{id} | Delete timesheet entry by ID.
*TripletexRubyClient::TimesheetentryApi* | [**get**](docs/TimesheetentryApi.md#get) | **GET** /timesheet/entry/{id} | Find timesheet entry by ID.
*TripletexRubyClient::TimesheetentryApi* | [**get_recent_activities**](docs/TimesheetentryApi.md#get_recent_activities) | **GET** /timesheet/entry/&gt;recentActivities | Find recently used timesheet activities.
*TripletexRubyClient::TimesheetentryApi* | [**get_recent_projects**](docs/TimesheetentryApi.md#get_recent_projects) | **GET** /timesheet/entry/&gt;recentProjects | Find projects with recent activities (timesheet entry registered).
*TripletexRubyClient::TimesheetentryApi* | [**get_total_hours**](docs/TimesheetentryApi.md#get_total_hours) | **GET** /timesheet/entry/&gt;totalHours | Find total hours registered on an employee in a specific period.
*TripletexRubyClient::TimesheetentryApi* | [**post**](docs/TimesheetentryApi.md#post) | **POST** /timesheet/entry | Add new timesheet entry. Only one entry per employee/date/activity/project combination is supported.
*TripletexRubyClient::TimesheetentryApi* | [**post_list**](docs/TimesheetentryApi.md#post_list) | **POST** /timesheet/entry/list | Add new timesheet entry. Multiple objects for several users can be sent in the same request.
*TripletexRubyClient::TimesheetentryApi* | [**put**](docs/TimesheetentryApi.md#put) | **PUT** /timesheet/entry/{id} | Update timesheet entry by ID. Note: Timesheet entry object fields which are present but not set, or set to 0, will be nulled.
*TripletexRubyClient::TimesheetentryApi* | [**put_list**](docs/TimesheetentryApi.md#put_list) | **PUT** /timesheet/entry/list | Update timesheet entry. Multiple objects for different users can be sent in the same request.
*TripletexRubyClient::TimesheetentryApi* | [**search**](docs/TimesheetentryApi.md#search) | **GET** /timesheet/entry | Find timesheet entry corresponding with sent data.
*TripletexRubyClient::TimesheetmonthApi* | [**approve**](docs/TimesheetmonthApi.md#approve) | **PUT** /timesheet/month/:approve | approve month(s).  If id is provided the other args are ignored
*TripletexRubyClient::TimesheetmonthApi* | [**complete**](docs/TimesheetmonthApi.md#complete) | **PUT** /timesheet/month/:complete | complete month(s).  If id is provided the other args are ignored
*TripletexRubyClient::TimesheetmonthApi* | [**get**](docs/TimesheetmonthApi.md#get) | **GET** /timesheet/month/{id} | Find monthly status entry by ID.
*TripletexRubyClient::TimesheetmonthApi* | [**get_by_month_number**](docs/TimesheetmonthApi.md#get_by_month_number) | **GET** /timesheet/month/byMonthNumber | Find monthly status for given month.
*TripletexRubyClient::TimesheetmonthApi* | [**reopen**](docs/TimesheetmonthApi.md#reopen) | **PUT** /timesheet/month/:reopen | reopen month(s).  If id is provided the other args are ignored
*TripletexRubyClient::TimesheetmonthApi* | [**unapprove**](docs/TimesheetmonthApi.md#unapprove) | **PUT** /timesheet/month/:unapprove | unapprove month(s).  If id is provided the other args are ignored
*TripletexRubyClient::TimesheetsalaryTypeSpecificationApi* | [**delete**](docs/TimesheetsalaryTypeSpecificationApi.md#delete) | **DELETE** /timesheet/salaryTypeSpecification/{id} | [BETA] Delete a timesheet SalaryType Specification
*TripletexRubyClient::TimesheetsalaryTypeSpecificationApi* | [**get**](docs/TimesheetsalaryTypeSpecificationApi.md#get) | **GET** /timesheet/salaryTypeSpecification/{id} | [BETA] Get timesheet SalaryType Specification for a specific ID
*TripletexRubyClient::TimesheetsalaryTypeSpecificationApi* | [**post**](docs/TimesheetsalaryTypeSpecificationApi.md#post) | **POST** /timesheet/salaryTypeSpecification | [BETA] Create a timesheet SalaryType Specification. Only one entry per employee/date/SalaryType
*TripletexRubyClient::TimesheetsalaryTypeSpecificationApi* | [**put**](docs/TimesheetsalaryTypeSpecificationApi.md#put) | **PUT** /timesheet/salaryTypeSpecification/{id} | [BETA] Update a timesheet SalaryType Specification
*TripletexRubyClient::TimesheetsalaryTypeSpecificationApi* | [**search**](docs/TimesheetsalaryTypeSpecificationApi.md#search) | **GET** /timesheet/salaryTypeSpecification | [BETA] Get list of timesheet SalaryType Specifications
*TripletexRubyClient::TimesheetsettingsApi* | [**get**](docs/TimesheetsettingsApi.md#get) | **GET** /timesheet/settings | [BETA] Get timesheet settings of logged in company.
*TripletexRubyClient::TimesheettimeClockApi* | [**get**](docs/TimesheettimeClockApi.md#get) | **GET** /timesheet/timeClock/{id} | Find time clock entry by ID.
*TripletexRubyClient::TimesheettimeClockApi* | [**get_present**](docs/TimesheettimeClockApi.md#get_present) | **GET** /timesheet/timeClock/present | Find a user’s present running time clock.
*TripletexRubyClient::TimesheettimeClockApi* | [**put**](docs/TimesheettimeClockApi.md#put) | **PUT** /timesheet/timeClock/{id} | Update time clock by ID.
*TripletexRubyClient::TimesheettimeClockApi* | [**search**](docs/TimesheettimeClockApi.md#search) | **GET** /timesheet/timeClock | Find time clock entries corresponding with sent data.
*TripletexRubyClient::TimesheettimeClockApi* | [**start**](docs/TimesheettimeClockApi.md#start) | **PUT** /timesheet/timeClock/:start | Start time clock.
*TripletexRubyClient::TimesheettimeClockApi* | [**stop**](docs/TimesheettimeClockApi.md#stop) | **PUT** /timesheet/timeClock/{id}/:stop | Stop time clock.
*TripletexRubyClient::TimesheetweekApi* | [**approve**](docs/TimesheetweekApi.md#approve) | **PUT** /timesheet/week/:approve | Approve week. By ID or (ISO-8601 week and employeeId combination).
*TripletexRubyClient::TimesheetweekApi* | [**complete**](docs/TimesheetweekApi.md#complete) | **PUT** /timesheet/week/:complete | Complete week. By ID or (ISO-8601 week and employeeId combination).
*TripletexRubyClient::TimesheetweekApi* | [**reopen**](docs/TimesheetweekApi.md#reopen) | **PUT** /timesheet/week/:reopen | Reopen week. By ID or (ISO-8601 week and employeeId combination).
*TripletexRubyClient::TimesheetweekApi* | [**search**](docs/TimesheetweekApi.md#search) | **GET** /timesheet/week | Find weekly status By ID, week/year combination, employeeId. or an approver
*TripletexRubyClient::TimesheetweekApi* | [**unapprove**](docs/TimesheetweekApi.md#unapprove) | **PUT** /timesheet/week/:unapprove | Unapprove week. By ID or (ISO-8601 week and employeeId combination).
*TripletexRubyClient::TokenconsumerApi* | [**get_by_token**](docs/TokenconsumerApi.md#get_by_token) | **GET** /token/consumer/byToken | Get consumer token by token string.
*TripletexRubyClient::TokenemployeeApi* | [**create**](docs/TokenemployeeApi.md#create) | **PUT** /token/employee/:create | Create an employee token. Only selected consumers are allowed
*TripletexRubyClient::TokensessionApi* | [**create**](docs/TokensessionApi.md#create) | **PUT** /token/session/:create | Create session token.
*TripletexRubyClient::TokensessionApi* | [**delete**](docs/TokensessionApi.md#delete) | **DELETE** /token/session/{token} | Delete session token.
*TripletexRubyClient::TokensessionApi* | [**who_am_i**](docs/TokensessionApi.md#who_am_i) | **GET** /token/session/&gt;whoAmI | Find information about the current user.
*TripletexRubyClient::TransportTypeApi* | [**get**](docs/TransportTypeApi.md#get) | **GET** /transportType/{id} |  [BETA] Find transport type by ID.
*TripletexRubyClient::TransportTypeApi* | [**search**](docs/TransportTypeApi.md#search) | **GET** /transportType |  [BETA] Search transport type.
*TripletexRubyClient::TravelExpenseApi* | [**approve**](docs/TravelExpenseApi.md#approve) | **PUT** /travelExpense/:approve | [BETA] Approve travel expenses.
*TripletexRubyClient::TravelExpenseApi* | [**copy**](docs/TravelExpenseApi.md#copy) | **PUT** /travelExpense/:copy | [BETA] Copy travel expense.
*TripletexRubyClient::TravelExpenseApi* | [**create_vouchers**](docs/TravelExpenseApi.md#create_vouchers) | **PUT** /travelExpense/:createVouchers | [BETA] Create vouchers
*TripletexRubyClient::TravelExpenseApi* | [**delete**](docs/TravelExpenseApi.md#delete) | **DELETE** /travelExpense/{id} | [BETA] Delete travel expense.
*TripletexRubyClient::TravelExpenseApi* | [**delete_attachment**](docs/TravelExpenseApi.md#delete_attachment) | **DELETE** /travelExpense/{travelExpenseId}/attachment | [BETA] Delete attachment.
*TripletexRubyClient::TravelExpenseApi* | [**deliver**](docs/TravelExpenseApi.md#deliver) | **PUT** /travelExpense/:deliver | [BETA] Deliver travel expenses.
*TripletexRubyClient::TravelExpenseApi* | [**download_attachment**](docs/TravelExpenseApi.md#download_attachment) | **GET** /travelExpense/{travelExpenseId}/attachment | Get attachment by travel expense ID.
*TripletexRubyClient::TravelExpenseApi* | [**get**](docs/TravelExpenseApi.md#get) | **GET** /travelExpense/{id} | [BETA] Get travel expense by ID.
*TripletexRubyClient::TravelExpenseApi* | [**post**](docs/TravelExpenseApi.md#post) | **POST** /travelExpense | [BETA] Create travel expense.
*TripletexRubyClient::TravelExpenseApi* | [**put**](docs/TravelExpenseApi.md#put) | **PUT** /travelExpense/{id} | [BETA] Update travel expense.
*TripletexRubyClient::TravelExpenseApi* | [**search**](docs/TravelExpenseApi.md#search) | **GET** /travelExpense | [BETA] Find travel expenses corresponding with sent data.
*TripletexRubyClient::TravelExpenseApi* | [**unapprove**](docs/TravelExpenseApi.md#unapprove) | **PUT** /travelExpense/:unapprove | [BETA] Unapprove travel expenses.
*TripletexRubyClient::TravelExpenseApi* | [**undeliver**](docs/TravelExpenseApi.md#undeliver) | **PUT** /travelExpense/:undeliver | [BETA] Undeliver travel expenses.
*TripletexRubyClient::TravelExpenseApi* | [**upload_attachment**](docs/TravelExpenseApi.md#upload_attachment) | **POST** /travelExpense/{travelExpenseId}/attachment | Upload attachment to travel expense.
*TripletexRubyClient::TravelExpenseApi* | [**upload_attachments**](docs/TravelExpenseApi.md#upload_attachments) | **POST** /travelExpense/{travelExpenseId}/attachment/list | Upload multiple attachments to travel expense.
*TripletexRubyClient::TravelExpenseaccommodationAllowanceApi* | [**delete**](docs/TravelExpenseaccommodationAllowanceApi.md#delete) | **DELETE** /travelExpense/accommodationAllowance/{id} | [BETA] Delete accommodation allowance.
*TripletexRubyClient::TravelExpenseaccommodationAllowanceApi* | [**get**](docs/TravelExpenseaccommodationAllowanceApi.md#get) | **GET** /travelExpense/accommodationAllowance/{id} | [BETA] Get travel accommodation allowance by ID.
*TripletexRubyClient::TravelExpenseaccommodationAllowanceApi* | [**post**](docs/TravelExpenseaccommodationAllowanceApi.md#post) | **POST** /travelExpense/accommodationAllowance | [BETA] Create accommodation allowance.
*TripletexRubyClient::TravelExpenseaccommodationAllowanceApi* | [**put**](docs/TravelExpenseaccommodationAllowanceApi.md#put) | **PUT** /travelExpense/accommodationAllowance/{id} | [BETA] Update accommodation allowance.
*TripletexRubyClient::TravelExpenseaccommodationAllowanceApi* | [**search**](docs/TravelExpenseaccommodationAllowanceApi.md#search) | **GET** /travelExpense/accommodationAllowance | [BETA] Find accommodation allowances corresponding with sent data.
*TripletexRubyClient::TravelExpensecostApi* | [**delete**](docs/TravelExpensecostApi.md#delete) | **DELETE** /travelExpense/cost/{id} | [BETA] Delete cost.
*TripletexRubyClient::TravelExpensecostApi* | [**get**](docs/TravelExpensecostApi.md#get) | **GET** /travelExpense/cost/{id} | [BETA] Get cost by ID.
*TripletexRubyClient::TravelExpensecostApi* | [**post**](docs/TravelExpensecostApi.md#post) | **POST** /travelExpense/cost | [BETA] Create cost.
*TripletexRubyClient::TravelExpensecostApi* | [**put**](docs/TravelExpensecostApi.md#put) | **PUT** /travelExpense/cost/{id} | [BETA] Update cost.
*TripletexRubyClient::TravelExpensecostApi* | [**search**](docs/TravelExpensecostApi.md#search) | **GET** /travelExpense/cost | [BETA] Find costs corresponding with sent data.
*TripletexRubyClient::TravelExpensecostCategoryApi* | [**get**](docs/TravelExpensecostCategoryApi.md#get) | **GET** /travelExpense/costCategory/{id} | [BETA] Get cost category by ID.
*TripletexRubyClient::TravelExpensecostCategoryApi* | [**search**](docs/TravelExpensecostCategoryApi.md#search) | **GET** /travelExpense/costCategory | [BETA] Find cost category corresponding with sent data.
*TripletexRubyClient::TravelExpensemileageAllowanceApi* | [**delete**](docs/TravelExpensemileageAllowanceApi.md#delete) | **DELETE** /travelExpense/mileageAllowance/{id} | [BETA] Delete mileage allowance.
*TripletexRubyClient::TravelExpensemileageAllowanceApi* | [**get**](docs/TravelExpensemileageAllowanceApi.md#get) | **GET** /travelExpense/mileageAllowance/{id} | [BETA] Get mileage allowance by ID.
*TripletexRubyClient::TravelExpensemileageAllowanceApi* | [**post**](docs/TravelExpensemileageAllowanceApi.md#post) | **POST** /travelExpense/mileageAllowance | [BETA] Create mileage allowance.
*TripletexRubyClient::TravelExpensemileageAllowanceApi* | [**put**](docs/TravelExpensemileageAllowanceApi.md#put) | **PUT** /travelExpense/mileageAllowance/{id} | [BETA] Update mileage allowance.
*TripletexRubyClient::TravelExpensemileageAllowanceApi* | [**search**](docs/TravelExpensemileageAllowanceApi.md#search) | **GET** /travelExpense/mileageAllowance | [BETA] Find mileage allowances corresponding with sent data.
*TripletexRubyClient::TravelExpensepassengerApi* | [**delete**](docs/TravelExpensepassengerApi.md#delete) | **DELETE** /travelExpense/passenger/{id} | [BETA] Delete passenger.
*TripletexRubyClient::TravelExpensepassengerApi* | [**get**](docs/TravelExpensepassengerApi.md#get) | **GET** /travelExpense/passenger/{id} | [BETA] Get passenger by ID.
*TripletexRubyClient::TravelExpensepassengerApi* | [**post**](docs/TravelExpensepassengerApi.md#post) | **POST** /travelExpense/passenger | [BETA] Create passenger.
*TripletexRubyClient::TravelExpensepassengerApi* | [**put**](docs/TravelExpensepassengerApi.md#put) | **PUT** /travelExpense/passenger/{id} | [BETA] Update passenger.
*TripletexRubyClient::TravelExpensepassengerApi* | [**search**](docs/TravelExpensepassengerApi.md#search) | **GET** /travelExpense/passenger | [BETA] Find passengers corresponding with sent data.
*TripletexRubyClient::TravelExpensepaymentTypeApi* | [**get**](docs/TravelExpensepaymentTypeApi.md#get) | **GET** /travelExpense/paymentType/{id} | [BETA] Get payment type by ID.
*TripletexRubyClient::TravelExpensepaymentTypeApi* | [**search**](docs/TravelExpensepaymentTypeApi.md#search) | **GET** /travelExpense/paymentType | [BETA] Find payment type corresponding with sent data.
*TripletexRubyClient::TravelExpenseperDiemCompensationApi* | [**delete**](docs/TravelExpenseperDiemCompensationApi.md#delete) | **DELETE** /travelExpense/perDiemCompensation/{id} | [BETA] Delete per diem compensation.
*TripletexRubyClient::TravelExpenseperDiemCompensationApi* | [**get**](docs/TravelExpenseperDiemCompensationApi.md#get) | **GET** /travelExpense/perDiemCompensation/{id} | [BETA] Get per diem compensation by ID.
*TripletexRubyClient::TravelExpenseperDiemCompensationApi* | [**post**](docs/TravelExpenseperDiemCompensationApi.md#post) | **POST** /travelExpense/perDiemCompensation | [BETA] Create per diem compensation.
*TripletexRubyClient::TravelExpenseperDiemCompensationApi* | [**put**](docs/TravelExpenseperDiemCompensationApi.md#put) | **PUT** /travelExpense/perDiemCompensation/{id} | [BETA] Update per diem compensation.
*TripletexRubyClient::TravelExpenseperDiemCompensationApi* | [**search**](docs/TravelExpenseperDiemCompensationApi.md#search) | **GET** /travelExpense/perDiemCompensation | [BETA] Find per diem compensations corresponding with sent data.
*TripletexRubyClient::TravelExpenserateApi* | [**get**](docs/TravelExpenserateApi.md#get) | **GET** /travelExpense/rate/{id} | [BETA] Get travel expense rate by ID.
*TripletexRubyClient::TravelExpenserateApi* | [**search**](docs/TravelExpenserateApi.md#search) | **GET** /travelExpense/rate | [BETA] Find rates corresponding with sent data.
*TripletexRubyClient::TravelExpenserateCategoryApi* | [**get**](docs/TravelExpenserateCategoryApi.md#get) | **GET** /travelExpense/rateCategory/{id} | [BETA] Get travel expense rate category by ID.
*TripletexRubyClient::TravelExpenserateCategoryApi* | [**search**](docs/TravelExpenserateCategoryApi.md#search) | **GET** /travelExpense/rateCategory | [BETA] Find rate categories corresponding with sent data.
*TripletexRubyClient::TravelExpenserateCategoryGroupApi* | [**get**](docs/TravelExpenserateCategoryGroupApi.md#get) | **GET** /travelExpense/rateCategoryGroup/{id} | [BETA] Get travel report rate category group by ID.
*TripletexRubyClient::TravelExpenserateCategoryGroupApi* | [**search**](docs/TravelExpenserateCategoryGroupApi.md#search) | **GET** /travelExpense/rateCategoryGroup | [BETA] Find rate categoriy groups corresponding with sent data.
*TripletexRubyClient::TravelExpensesettingsApi* | [**get**](docs/TravelExpensesettingsApi.md#get) | **GET** /travelExpense/settings | [BETA] Get travel expense settings of logged in company.
*TripletexRubyClient::TravelExpensezoneApi* | [**get**](docs/TravelExpensezoneApi.md#get) | **GET** /travelExpense/zone/{id} | Get travel expense zone by ID.
*TripletexRubyClient::TravelExpensezoneApi* | [**search**](docs/TravelExpensezoneApi.md#search) | **GET** /travelExpense/zone | Find travel expense zones corresponding with sent data.
*TripletexRubyClient::VatReturnscommentApi* | [**all**](docs/VatReturnscommentApi.md#all) | **GET** /vatReturns/comment/&gt;all | [BETA] - Get all structured comments available
*TripletexRubyClient::VatReturnscommentApi* | [**query**](docs/VatReturnscommentApi.md#query) | **GET** /vatReturns/comment | [BETA] - Get all structured comments related to a given vatCode
*TripletexRubyClient::VoucherApprovalListElementApi* | [**get**](docs/VoucherApprovalListElementApi.md#get) | **GET** /voucherApprovalListElement/{id} | [BETA] Get by ID.
*TripletexRubyClient::VoucherMessageApi* | [**post**](docs/VoucherMessageApi.md#post) | **POST** /voucherMessage | [BETA] Post new voucherMessage.
*TripletexRubyClient::VoucherMessageApi* | [**search**](docs/VoucherMessageApi.md#search) | **GET** /voucherMessage | [BETA] Find voucherMessage (or a comment) put on a voucher by inputting voucher ids
*TripletexRubyClient::VoucherStatusApi* | [**get**](docs/VoucherStatusApi.md#get) | **GET** /voucherStatus/{id} | [BETA] Get voucherStatus by ID.
*TripletexRubyClient::VoucherStatusApi* | [**post**](docs/VoucherStatusApi.md#post) | **POST** /voucherStatus | [BETA] Post new voucherStatus.
*TripletexRubyClient::VoucherStatusApi* | [**search**](docs/VoucherStatusApi.md#search) | **GET** /voucherStatus | [BETA] Find voucherStatus corresponding with sent data. The voucherStatus is used to coordinate integration processes. Requires setup done by Tripletex, currently supports debt collection.


## Documentation for Models

 - [TripletexRubyClient::AccommodationAllowance](docs/AccommodationAllowance.md)
 - [TripletexRubyClient::Account](docs/Account.md)
 - [TripletexRubyClient::AccountingPeriod](docs/AccountingPeriod.md)
 - [TripletexRubyClient::Activity](docs/Activity.md)
 - [TripletexRubyClient::Addon](docs/Addon.md)
 - [TripletexRubyClient::AddonLogoDTO](docs/AddonLogoDTO.md)
 - [TripletexRubyClient::Address](docs/Address.md)
 - [TripletexRubyClient::AltinnCompanyModule](docs/AltinnCompanyModule.md)
 - [TripletexRubyClient::AltinnInstance](docs/AltinnInstance.md)
 - [TripletexRubyClient::AnnualAccount](docs/AnnualAccount.md)
 - [TripletexRubyClient::ApiConsumer](docs/ApiConsumer.md)
 - [TripletexRubyClient::ApiError](docs/ApiError.md)
 - [TripletexRubyClient::ApiValidationMessage](docs/ApiValidationMessage.md)
 - [TripletexRubyClient::AppSpecific](docs/AppSpecific.md)
 - [TripletexRubyClient::ApproveResponseDTO](docs/ApproveResponseDTO.md)
 - [TripletexRubyClient::Asset](docs/Asset.md)
 - [TripletexRubyClient::AutoLogin](docs/AutoLogin.md)
 - [TripletexRubyClient::AutoLoginPayloadDTO](docs/AutoLoginPayloadDTO.md)
 - [TripletexRubyClient::AutoPayMessageDTO](docs/AutoPayMessageDTO.md)
 - [TripletexRubyClient::BalanceSheetAccount](docs/BalanceSheetAccount.md)
 - [TripletexRubyClient::Bank](docs/Bank.md)
 - [TripletexRubyClient::BankAgreement](docs/BankAgreement.md)
 - [TripletexRubyClient::BankAgreementCreationDTO](docs/BankAgreementCreationDTO.md)
 - [TripletexRubyClient::BankBalanceEstimation](docs/BankBalanceEstimation.md)
 - [TripletexRubyClient::BankOnboardingAccessRequestDTO](docs/BankOnboardingAccessRequestDTO.md)
 - [TripletexRubyClient::BankOnboardingDTO](docs/BankOnboardingDTO.md)
 - [TripletexRubyClient::BankOnboardingStepDTO](docs/BankOnboardingStepDTO.md)
 - [TripletexRubyClient::BankReconciliation](docs/BankReconciliation.md)
 - [TripletexRubyClient::BankReconciliationAdjustment](docs/BankReconciliationAdjustment.md)
 - [TripletexRubyClient::BankReconciliationMatch](docs/BankReconciliationMatch.md)
 - [TripletexRubyClient::BankReconciliationPaymentType](docs/BankReconciliationPaymentType.md)
 - [TripletexRubyClient::BankSettings](docs/BankSettings.md)
 - [TripletexRubyClient::BankStatement](docs/BankStatement.md)
 - [TripletexRubyClient::BankStatementBalanceDTO](docs/BankStatementBalanceDTO.md)
 - [TripletexRubyClient::BankTransaction](docs/BankTransaction.md)
 - [TripletexRubyClient::Banner](docs/Banner.md)
 - [TripletexRubyClient::BodyPart](docs/BodyPart.md)
 - [TripletexRubyClient::CalloutDTO](docs/CalloutDTO.md)
 - [TripletexRubyClient::Change](docs/Change.md)
 - [TripletexRubyClient::Choice](docs/Choice.md)
 - [TripletexRubyClient::CloseGroup](docs/CloseGroup.md)
 - [TripletexRubyClient::Color](docs/Color.md)
 - [TripletexRubyClient::Comment](docs/Comment.md)
 - [TripletexRubyClient::CommentField](docs/CommentField.md)
 - [TripletexRubyClient::CommentInput](docs/CommentInput.md)
 - [TripletexRubyClient::Company](docs/Company.md)
 - [TripletexRubyClient::CompanyAuthorityDTO](docs/CompanyAuthorityDTO.md)
 - [TripletexRubyClient::CompanyAutoCompleteDTO](docs/CompanyAutoCompleteDTO.md)
 - [TripletexRubyClient::CompanyBankAccountPresentation](docs/CompanyBankAccountPresentation.md)
 - [TripletexRubyClient::CompanyHoliday](docs/CompanyHoliday.md)
 - [TripletexRubyClient::ConsumerToken](docs/ConsumerToken.md)
 - [TripletexRubyClient::Contact](docs/Contact.md)
 - [TripletexRubyClient::ContentDisposition](docs/ContentDisposition.md)
 - [TripletexRubyClient::Cost](docs/Cost.md)
 - [TripletexRubyClient::Country](docs/Country.md)
 - [TripletexRubyClient::Credentials](docs/Credentials.md)
 - [TripletexRubyClient::Currency](docs/Currency.md)
 - [TripletexRubyClient::CurrencyExchangeRate](docs/CurrencyExchangeRate.md)
 - [TripletexRubyClient::Customer](docs/Customer.md)
 - [TripletexRubyClient::CustomerCategory](docs/CustomerCategory.md)
 - [TripletexRubyClient::CustomerTripletexAccount](docs/CustomerTripletexAccount.md)
 - [TripletexRubyClient::CustomerTripletexAccount2](docs/CustomerTripletexAccount2.md)
 - [TripletexRubyClient::DashboardDTO](docs/DashboardDTO.md)
 - [TripletexRubyClient::Delete](docs/Delete.md)
 - [TripletexRubyClient::DeliveryAddress](docs/DeliveryAddress.md)
 - [TripletexRubyClient::Department](docs/Department.md)
 - [TripletexRubyClient::Deviation](docs/Deviation.md)
 - [TripletexRubyClient::DiscountGroup](docs/DiscountGroup.md)
 - [TripletexRubyClient::Division](docs/Division.md)
 - [TripletexRubyClient::Document](docs/Document.md)
 - [TripletexRubyClient::DocumentArchive](docs/DocumentArchive.md)
 - [TripletexRubyClient::ElectronicSupportDTO](docs/ElectronicSupportDTO.md)
 - [TripletexRubyClient::Employee](docs/Employee.md)
 - [TripletexRubyClient::EmployeeCategory](docs/EmployeeCategory.md)
 - [TripletexRubyClient::EmployeeCompanyDTO](docs/EmployeeCompanyDTO.md)
 - [TripletexRubyClient::EmployeeEmail](docs/EmployeeEmail.md)
 - [TripletexRubyClient::EmployeePeriod](docs/EmployeePeriod.md)
 - [TripletexRubyClient::EmployeePreferences](docs/EmployeePreferences.md)
 - [TripletexRubyClient::EmployeeToken](docs/EmployeeToken.md)
 - [TripletexRubyClient::EmployeeTokenBundle](docs/EmployeeTokenBundle.md)
 - [TripletexRubyClient::Employment](docs/Employment.md)
 - [TripletexRubyClient::EmploymentDetails](docs/EmploymentDetails.md)
 - [TripletexRubyClient::EmploymentType](docs/EmploymentType.md)
 - [TripletexRubyClient::EnhetsregisteretDTO](docs/EnhetsregisteretDTO.md)
 - [TripletexRubyClient::EnterpriseDTO](docs/EnterpriseDTO.md)
 - [TripletexRubyClient::Entitlement](docs/Entitlement.md)
 - [TripletexRubyClient::EventInfoDTO](docs/EventInfoDTO.md)
 - [TripletexRubyClient::EventInfoDescription](docs/EventInfoDescription.md)
 - [TripletexRubyClient::ExternalProduct](docs/ExternalProduct.md)
 - [TripletexRubyClient::FileIdForIncomingPaymentsDTO](docs/FileIdForIncomingPaymentsDTO.md)
 - [TripletexRubyClient::FlexSummary](docs/FlexSummary.md)
 - [TripletexRubyClient::FormDataBodyPart](docs/FormDataBodyPart.md)
 - [TripletexRubyClient::FormDataContentDisposition](docs/FormDataContentDisposition.md)
 - [TripletexRubyClient::FormDataMultiPart](docs/FormDataMultiPart.md)
 - [TripletexRubyClient::FundingPartnerApplication](docs/FundingPartnerApplication.md)
 - [TripletexRubyClient::FundingPartnerQualify](docs/FundingPartnerQualify.md)
 - [TripletexRubyClient::GoodsReceipt](docs/GoodsReceipt.md)
 - [TripletexRubyClient::GoodsReceiptLine](docs/GoodsReceiptLine.md)
 - [TripletexRubyClient::HistoricalPosting](docs/HistoricalPosting.md)
 - [TripletexRubyClient::HistoricalVoucher](docs/HistoricalVoucher.md)
 - [TripletexRubyClient::HolidayAllowanceEarned](docs/HolidayAllowanceEarned.md)
 - [TripletexRubyClient::HourSummary](docs/HourSummary.md)
 - [TripletexRubyClient::HourlyCostAndRate](docs/HourlyCostAndRate.md)
 - [TripletexRubyClient::HourlyRate](docs/HourlyRate.md)
 - [TripletexRubyClient::IdPortenLogin](docs/IdPortenLogin.md)
 - [TripletexRubyClient::IdPortenLoginRequest](docs/IdPortenLoginRequest.md)
 - [TripletexRubyClient::IdPortenLoginStatus](docs/IdPortenLoginStatus.md)
 - [TripletexRubyClient::Image](docs/Image.md)
 - [TripletexRubyClient::ImageField](docs/ImageField.md)
 - [TripletexRubyClient::InternationalId](docs/InternationalId.md)
 - [TripletexRubyClient::Inventories](docs/Inventories.md)
 - [TripletexRubyClient::Inventory](docs/Inventory.md)
 - [TripletexRubyClient::InventoryLocation](docs/InventoryLocation.md)
 - [TripletexRubyClient::Invoice](docs/Invoice.md)
 - [TripletexRubyClient::InvoiceField](docs/InvoiceField.md)
 - [TripletexRubyClient::InvoiceSendTypeDTO](docs/InvoiceSendTypeDTO.md)
 - [TripletexRubyClient::InvoiceSettingsDTO](docs/InvoiceSettingsDTO.md)
 - [TripletexRubyClient::Job](docs/Job.md)
 - [TripletexRubyClient::JobDetailDTO](docs/JobDetailDTO.md)
 - [TripletexRubyClient::LeaveOfAbsence](docs/LeaveOfAbsence.md)
 - [TripletexRubyClient::LeaveOfAbsenceType](docs/LeaveOfAbsenceType.md)
 - [TripletexRubyClient::LedgerAccount](docs/LedgerAccount.md)
 - [TripletexRubyClient::LegacyAddress](docs/LegacyAddress.md)
 - [TripletexRubyClient::Link](docs/Link.md)
 - [TripletexRubyClient::LinkMobilityReportDTO](docs/LinkMobilityReportDTO.md)
 - [TripletexRubyClient::ListResponse](docs/ListResponse.md)
 - [TripletexRubyClient::ListResponseAccommodationAllowance](docs/ListResponseAccommodationAllowance.md)
 - [TripletexRubyClient::ListResponseAccount](docs/ListResponseAccount.md)
 - [TripletexRubyClient::ListResponseAccountingPeriod](docs/ListResponseAccountingPeriod.md)
 - [TripletexRubyClient::ListResponseActivity](docs/ListResponseActivity.md)
 - [TripletexRubyClient::ListResponseAddon](docs/ListResponseAddon.md)
 - [TripletexRubyClient::ListResponseAnnualAccount](docs/ListResponseAnnualAccount.md)
 - [TripletexRubyClient::ListResponseApiConsumer](docs/ListResponseApiConsumer.md)
 - [TripletexRubyClient::ListResponseAsset](docs/ListResponseAsset.md)
 - [TripletexRubyClient::ListResponseBalanceSheetAccount](docs/ListResponseBalanceSheetAccount.md)
 - [TripletexRubyClient::ListResponseBank](docs/ListResponseBank.md)
 - [TripletexRubyClient::ListResponseBankAgreement](docs/ListResponseBankAgreement.md)
 - [TripletexRubyClient::ListResponseBankBalanceEstimation](docs/ListResponseBankBalanceEstimation.md)
 - [TripletexRubyClient::ListResponseBankReconciliation](docs/ListResponseBankReconciliation.md)
 - [TripletexRubyClient::ListResponseBankReconciliationAdjustment](docs/ListResponseBankReconciliationAdjustment.md)
 - [TripletexRubyClient::ListResponseBankReconciliationMatch](docs/ListResponseBankReconciliationMatch.md)
 - [TripletexRubyClient::ListResponseBankReconciliationPaymentType](docs/ListResponseBankReconciliationPaymentType.md)
 - [TripletexRubyClient::ListResponseBankStatement](docs/ListResponseBankStatement.md)
 - [TripletexRubyClient::ListResponseBankTransaction](docs/ListResponseBankTransaction.md)
 - [TripletexRubyClient::ListResponseBanner](docs/ListResponseBanner.md)
 - [TripletexRubyClient::ListResponseCalloutDTO](docs/ListResponseCalloutDTO.md)
 - [TripletexRubyClient::ListResponseCloseGroup](docs/ListResponseCloseGroup.md)
 - [TripletexRubyClient::ListResponseCompany](docs/ListResponseCompany.md)
 - [TripletexRubyClient::ListResponseCompanyAutoCompleteDTO](docs/ListResponseCompanyAutoCompleteDTO.md)
 - [TripletexRubyClient::ListResponseCompanyHoliday](docs/ListResponseCompanyHoliday.md)
 - [TripletexRubyClient::ListResponseContact](docs/ListResponseContact.md)
 - [TripletexRubyClient::ListResponseCost](docs/ListResponseCost.md)
 - [TripletexRubyClient::ListResponseCountry](docs/ListResponseCountry.md)
 - [TripletexRubyClient::ListResponseCurrency](docs/ListResponseCurrency.md)
 - [TripletexRubyClient::ListResponseCustomer](docs/ListResponseCustomer.md)
 - [TripletexRubyClient::ListResponseCustomerCategory](docs/ListResponseCustomerCategory.md)
 - [TripletexRubyClient::ListResponseDeliveryAddress](docs/ListResponseDeliveryAddress.md)
 - [TripletexRubyClient::ListResponseDepartment](docs/ListResponseDepartment.md)
 - [TripletexRubyClient::ListResponseDeviation](docs/ListResponseDeviation.md)
 - [TripletexRubyClient::ListResponseDiscountGroup](docs/ListResponseDiscountGroup.md)
 - [TripletexRubyClient::ListResponseDivision](docs/ListResponseDivision.md)
 - [TripletexRubyClient::ListResponseDocumentArchive](docs/ListResponseDocumentArchive.md)
 - [TripletexRubyClient::ListResponseEmployee](docs/ListResponseEmployee.md)
 - [TripletexRubyClient::ListResponseEmployeeCategory](docs/ListResponseEmployeeCategory.md)
 - [TripletexRubyClient::ListResponseEmployeeCompanyDTO](docs/ListResponseEmployeeCompanyDTO.md)
 - [TripletexRubyClient::ListResponseEmployment](docs/ListResponseEmployment.md)
 - [TripletexRubyClient::ListResponseEmploymentDetails](docs/ListResponseEmploymentDetails.md)
 - [TripletexRubyClient::ListResponseEmploymentType](docs/ListResponseEmploymentType.md)
 - [TripletexRubyClient::ListResponseEnhetsregisteretDTO](docs/ListResponseEnhetsregisteretDTO.md)
 - [TripletexRubyClient::ListResponseEntitlement](docs/ListResponseEntitlement.md)
 - [TripletexRubyClient::ListResponseExternalProduct](docs/ListResponseExternalProduct.md)
 - [TripletexRubyClient::ListResponseGoodsReceipt](docs/ListResponseGoodsReceipt.md)
 - [TripletexRubyClient::ListResponseGoodsReceiptLine](docs/ListResponseGoodsReceiptLine.md)
 - [TripletexRubyClient::ListResponseHistoricalVoucher](docs/ListResponseHistoricalVoucher.md)
 - [TripletexRubyClient::ListResponseHourlyCostAndRate](docs/ListResponseHourlyCostAndRate.md)
 - [TripletexRubyClient::ListResponseInventories](docs/ListResponseInventories.md)
 - [TripletexRubyClient::ListResponseInventory](docs/ListResponseInventory.md)
 - [TripletexRubyClient::ListResponseInventoryLocation](docs/ListResponseInventoryLocation.md)
 - [TripletexRubyClient::ListResponseInvoice](docs/ListResponseInvoice.md)
 - [TripletexRubyClient::ListResponseInvoiceSendTypeDTO](docs/ListResponseInvoiceSendTypeDTO.md)
 - [TripletexRubyClient::ListResponseLeaveOfAbsence](docs/ListResponseLeaveOfAbsence.md)
 - [TripletexRubyClient::ListResponseLeaveOfAbsenceType](docs/ListResponseLeaveOfAbsenceType.md)
 - [TripletexRubyClient::ListResponseLedgerAccount](docs/ListResponseLedgerAccount.md)
 - [TripletexRubyClient::ListResponseLegacyAddress](docs/ListResponseLegacyAddress.md)
 - [TripletexRubyClient::ListResponseMileageAllowance](docs/ListResponseMileageAllowance.md)
 - [TripletexRubyClient::ListResponseMonthlyStatus](docs/ListResponseMonthlyStatus.md)
 - [TripletexRubyClient::ListResponseMunicipality](docs/ListResponseMunicipality.md)
 - [TripletexRubyClient::ListResponseNextOfKin](docs/ListResponseNextOfKin.md)
 - [TripletexRubyClient::ListResponseNotification](docs/ListResponseNotification.md)
 - [TripletexRubyClient::ListResponseOccupationCode](docs/ListResponseOccupationCode.md)
 - [TripletexRubyClient::ListResponseOrder](docs/ListResponseOrder.md)
 - [TripletexRubyClient::ListResponseOrderGroup](docs/ListResponseOrderGroup.md)
 - [TripletexRubyClient::ListResponseOrderLine](docs/ListResponseOrderLine.md)
 - [TripletexRubyClient::ListResponseOrderOffer](docs/ListResponseOrderOffer.md)
 - [TripletexRubyClient::ListResponsePassenger](docs/ListResponsePassenger.md)
 - [TripletexRubyClient::ListResponsePayment](docs/ListResponsePayment.md)
 - [TripletexRubyClient::ListResponsePaymentType](docs/ListResponsePaymentType.md)
 - [TripletexRubyClient::ListResponsePaymentTypeOut](docs/ListResponsePaymentTypeOut.md)
 - [TripletexRubyClient::ListResponsePayslip](docs/ListResponsePayslip.md)
 - [TripletexRubyClient::ListResponsePayslipInternal](docs/ListResponsePayslipInternal.md)
 - [TripletexRubyClient::ListResponsePensionScheme](docs/ListResponsePensionScheme.md)
 - [TripletexRubyClient::ListResponsePerDiemCompensation](docs/ListResponsePerDiemCompensation.md)
 - [TripletexRubyClient::ListResponsePerDiemCompensationTransientDTO](docs/ListResponsePerDiemCompensationTransientDTO.md)
 - [TripletexRubyClient::ListResponsePersonAutoCompleteDTO](docs/ListResponsePersonAutoCompleteDTO.md)
 - [TripletexRubyClient::ListResponsePickupPoint](docs/ListResponsePickupPoint.md)
 - [TripletexRubyClient::ListResponsePosting](docs/ListResponsePosting.md)
 - [TripletexRubyClient::ListResponseProduct](docs/ListResponseProduct.md)
 - [TripletexRubyClient::ListResponseProductGroup](docs/ListResponseProductGroup.md)
 - [TripletexRubyClient::ListResponseProductGroupRelation](docs/ListResponseProductGroupRelation.md)
 - [TripletexRubyClient::ListResponseProductInventoryLocation](docs/ListResponseProductInventoryLocation.md)
 - [TripletexRubyClient::ListResponseProductLine](docs/ListResponseProductLine.md)
 - [TripletexRubyClient::ListResponseProductNews](docs/ListResponseProductNews.md)
 - [TripletexRubyClient::ListResponseProductPrice](docs/ListResponseProductPrice.md)
 - [TripletexRubyClient::ListResponseProductUnit](docs/ListResponseProductUnit.md)
 - [TripletexRubyClient::ListResponseProductUnitMaster](docs/ListResponseProductUnitMaster.md)
 - [TripletexRubyClient::ListResponseProject](docs/ListResponseProject.md)
 - [TripletexRubyClient::ListResponseProjectCategory](docs/ListResponseProjectCategory.md)
 - [TripletexRubyClient::ListResponseProjectControlForm](docs/ListResponseProjectControlForm.md)
 - [TripletexRubyClient::ListResponseProjectControlFormType](docs/ListResponseProjectControlFormType.md)
 - [TripletexRubyClient::ListResponseProjectHourlyRate](docs/ListResponseProjectHourlyRate.md)
 - [TripletexRubyClient::ListResponseProjectInvoiceDetails](docs/ListResponseProjectInvoiceDetails.md)
 - [TripletexRubyClient::ListResponseProjectOrderLine](docs/ListResponseProjectOrderLine.md)
 - [TripletexRubyClient::ListResponseProjectOverviewAggregate](docs/ListResponseProjectOverviewAggregate.md)
 - [TripletexRubyClient::ListResponseProjectParticipant](docs/ListResponseProjectParticipant.md)
 - [TripletexRubyClient::ListResponseProjectPeriodMonthlyStatus](docs/ListResponseProjectPeriodMonthlyStatus.md)
 - [TripletexRubyClient::ListResponseProjectSpecificRate](docs/ListResponseProjectSpecificRate.md)
 - [TripletexRubyClient::ListResponseProspect](docs/ListResponseProspect.md)
 - [TripletexRubyClient::ListResponsePurchaseOrder](docs/ListResponsePurchaseOrder.md)
 - [TripletexRubyClient::ListResponsePurchaseOrderIncomingInvoiceRelation](docs/ListResponsePurchaseOrderIncomingInvoiceRelation.md)
 - [TripletexRubyClient::ListResponseReelDomainDTO](docs/ListResponseReelDomainDTO.md)
 - [TripletexRubyClient::ListResponseReelFunctionDTO](docs/ListResponseReelFunctionDTO.md)
 - [TripletexRubyClient::ListResponseReminder](docs/ListResponseReminder.md)
 - [TripletexRubyClient::ListResponseRemunerationType](docs/ListResponseRemunerationType.md)
 - [TripletexRubyClient::ListResponseReport](docs/ListResponseReport.md)
 - [TripletexRubyClient::ListResponseReportAccess](docs/ListResponseReportAccess.md)
 - [TripletexRubyClient::ListResponseReportAuthorization](docs/ListResponseReportAuthorization.md)
 - [TripletexRubyClient::ListResponseResultBudget](docs/ListResponseResultBudget.md)
 - [TripletexRubyClient::ListResponseSalarySpecification](docs/ListResponseSalarySpecification.md)
 - [TripletexRubyClient::ListResponseSalarySpecificationInternal](docs/ListResponseSalarySpecificationInternal.md)
 - [TripletexRubyClient::ListResponseSalaryTransaction](docs/ListResponseSalaryTransaction.md)
 - [TripletexRubyClient::ListResponseSalaryTransactionInternal](docs/ListResponseSalaryTransactionInternal.md)
 - [TripletexRubyClient::ListResponseSalaryType](docs/ListResponseSalaryType.md)
 - [TripletexRubyClient::ListResponseSalaryTypeInternal](docs/ListResponseSalaryTypeInternal.md)
 - [TripletexRubyClient::ListResponseSalesForceAccountInfo](docs/ListResponseSalesForceAccountInfo.md)
 - [TripletexRubyClient::ListResponseSalesForceEmployee](docs/ListResponseSalesForceEmployee.md)
 - [TripletexRubyClient::ListResponseSalesModuleDTO](docs/ListResponseSalesModuleDTO.md)
 - [TripletexRubyClient::ListResponseSearchCompletionDTO](docs/ListResponseSearchCompletionDTO.md)
 - [TripletexRubyClient::ListResponseStandardTime](docs/ListResponseStandardTime.md)
 - [TripletexRubyClient::ListResponseStocktaking](docs/ListResponseStocktaking.md)
 - [TripletexRubyClient::ListResponseSubscription](docs/ListResponseSubscription.md)
 - [TripletexRubyClient::ListResponseSupplier](docs/ListResponseSupplier.md)
 - [TripletexRubyClient::ListResponseSupplierBalance](docs/ListResponseSupplierBalance.md)
 - [TripletexRubyClient::ListResponseSupplierInvoice](docs/ListResponseSupplierInvoice.md)
 - [TripletexRubyClient::ListResponseSupplierProduct](docs/ListResponseSupplierProduct.md)
 - [TripletexRubyClient::ListResponseSystemReportCategoryDTO](docs/ListResponseSystemReportCategoryDTO.md)
 - [TripletexRubyClient::ListResponseTask](docs/ListResponseTask.md)
 - [TripletexRubyClient::ListResponseTemplate](docs/ListResponseTemplate.md)
 - [TripletexRubyClient::ListResponseTimeClock](docs/ListResponseTimeClock.md)
 - [TripletexRubyClient::ListResponseTimesheetEntry](docs/ListResponseTimesheetEntry.md)
 - [TripletexRubyClient::ListResponseTimesheetSalaryTypeSpecification](docs/ListResponseTimesheetSalaryTypeSpecification.md)
 - [TripletexRubyClient::ListResponseTransportType](docs/ListResponseTransportType.md)
 - [TripletexRubyClient::ListResponseTravelCostCategory](docs/ListResponseTravelCostCategory.md)
 - [TripletexRubyClient::ListResponseTravelExpense](docs/ListResponseTravelExpense.md)
 - [TripletexRubyClient::ListResponseTravelExpenseRate](docs/ListResponseTravelExpenseRate.md)
 - [TripletexRubyClient::ListResponseTravelExpenseRateCategory](docs/ListResponseTravelExpenseRateCategory.md)
 - [TripletexRubyClient::ListResponseTravelExpenseRateCategoryGroup](docs/ListResponseTravelExpenseRateCategoryGroup.md)
 - [TripletexRubyClient::ListResponseTravelExpenseZone](docs/ListResponseTravelExpenseZone.md)
 - [TripletexRubyClient::ListResponseTravelPaymentType](docs/ListResponseTravelPaymentType.md)
 - [TripletexRubyClient::ListResponseTripletexCompanyModules](docs/ListResponseTripletexCompanyModules.md)
 - [TripletexRubyClient::ListResponseUpsaleMetric](docs/ListResponseUpsaleMetric.md)
 - [TripletexRubyClient::ListResponseUserTemplate](docs/ListResponseUserTemplate.md)
 - [TripletexRubyClient::ListResponseVatReturnsComment](docs/ListResponseVatReturnsComment.md)
 - [TripletexRubyClient::ListResponseVatReturnsVatCodeCommentDTO](docs/ListResponseVatReturnsVatCodeCommentDTO.md)
 - [TripletexRubyClient::ListResponseVatTermPeriod](docs/ListResponseVatTermPeriod.md)
 - [TripletexRubyClient::ListResponseVatType](docs/ListResponseVatType.md)
 - [TripletexRubyClient::ListResponseVfFactoringOffer](docs/ListResponseVfFactoringOffer.md)
 - [TripletexRubyClient::ListResponseVoucher](docs/ListResponseVoucher.md)
 - [TripletexRubyClient::ListResponseVoucherMessage](docs/ListResponseVoucherMessage.md)
 - [TripletexRubyClient::ListResponseVoucherStatus](docs/ListResponseVoucherStatus.md)
 - [TripletexRubyClient::ListResponseVoucherType](docs/ListResponseVoucherType.md)
 - [TripletexRubyClient::ListResponseWeek](docs/ListResponseWeek.md)
 - [TripletexRubyClient::ListResponseWorkingHoursScheme](docs/ListResponseWorkingHoursScheme.md)
 - [TripletexRubyClient::ListResponseZtlAccount](docs/ListResponseZtlAccount.md)
 - [TripletexRubyClient::ListResponseZtlConsent](docs/ListResponseZtlConsent.md)
 - [TripletexRubyClient::ListResponseZtlOnboarding](docs/ListResponseZtlOnboarding.md)
 - [TripletexRubyClient::LoggedInUserInfoDTO](docs/LoggedInUserInfoDTO.md)
 - [TripletexRubyClient::LogisticsSettings](docs/LogisticsSettings.md)
 - [TripletexRubyClient::MaritimeEmployment](docs/MaritimeEmployment.md)
 - [TripletexRubyClient::MaventaEventDataDTO](docs/MaventaEventDataDTO.md)
 - [TripletexRubyClient::MaventaStatusDTO](docs/MaventaStatusDTO.md)
 - [TripletexRubyClient::MediaType](docs/MediaType.md)
 - [TripletexRubyClient::Menu](docs/Menu.md)
 - [TripletexRubyClient::MenuItem](docs/MenuItem.md)
 - [TripletexRubyClient::MessageBodyWorkers](docs/MessageBodyWorkers.md)
 - [TripletexRubyClient::MileageAllowance](docs/MileageAllowance.md)
 - [TripletexRubyClient::MobileAppLogin](docs/MobileAppLogin.md)
 - [TripletexRubyClient::Modules](docs/Modules.md)
 - [TripletexRubyClient::MonthlyStatus](docs/MonthlyStatus.md)
 - [TripletexRubyClient::MultiPart](docs/MultiPart.md)
 - [TripletexRubyClient::Municipality](docs/Municipality.md)
 - [TripletexRubyClient::NextOfKin](docs/NextOfKin.md)
 - [TripletexRubyClient::Notification](docs/Notification.md)
 - [TripletexRubyClient::OccupationCode](docs/OccupationCode.md)
 - [TripletexRubyClient::OnboardAccountDTO](docs/OnboardAccountDTO.md)
 - [TripletexRubyClient::Order](docs/Order.md)
 - [TripletexRubyClient::OrderGroup](docs/OrderGroup.md)
 - [TripletexRubyClient::OrderLine](docs/OrderLine.md)
 - [TripletexRubyClient::OrderLinePostingDTO](docs/OrderLinePostingDTO.md)
 - [TripletexRubyClient::OrderOffer](docs/OrderOffer.md)
 - [TripletexRubyClient::PG2CallbackDTO](docs/PG2CallbackDTO.md)
 - [TripletexRubyClient::PageOptions](docs/PageOptions.md)
 - [TripletexRubyClient::ParameterizedHeader](docs/ParameterizedHeader.md)
 - [TripletexRubyClient::Passenger](docs/Passenger.md)
 - [TripletexRubyClient::Payment](docs/Payment.md)
 - [TripletexRubyClient::PaymentType](docs/PaymentType.md)
 - [TripletexRubyClient::PaymentTypeOut](docs/PaymentTypeOut.md)
 - [TripletexRubyClient::Payslip](docs/Payslip.md)
 - [TripletexRubyClient::PayslipHelperInternal](docs/PayslipHelperInternal.md)
 - [TripletexRubyClient::PayslipInternal](docs/PayslipInternal.md)
 - [TripletexRubyClient::PensionScheme](docs/PensionScheme.md)
 - [TripletexRubyClient::PerDiemCompensation](docs/PerDiemCompensation.md)
 - [TripletexRubyClient::PerDiemCompensationTransientDTO](docs/PerDiemCompensationTransientDTO.md)
 - [TripletexRubyClient::PersonAutoCompleteDTO](docs/PersonAutoCompleteDTO.md)
 - [TripletexRubyClient::PickupPoint](docs/PickupPoint.md)
 - [TripletexRubyClient::Posting](docs/Posting.md)
 - [TripletexRubyClient::Prediction](docs/Prediction.md)
 - [TripletexRubyClient::Product](docs/Product.md)
 - [TripletexRubyClient::ProductGroup](docs/ProductGroup.md)
 - [TripletexRubyClient::ProductGroupRelation](docs/ProductGroupRelation.md)
 - [TripletexRubyClient::ProductInventoryLocation](docs/ProductInventoryLocation.md)
 - [TripletexRubyClient::ProductLine](docs/ProductLine.md)
 - [TripletexRubyClient::ProductNews](docs/ProductNews.md)
 - [TripletexRubyClient::ProductPrice](docs/ProductPrice.md)
 - [TripletexRubyClient::ProductSettings](docs/ProductSettings.md)
 - [TripletexRubyClient::ProductUnit](docs/ProductUnit.md)
 - [TripletexRubyClient::ProductUnitMaster](docs/ProductUnitMaster.md)
 - [TripletexRubyClient::Project](docs/Project.md)
 - [TripletexRubyClient::ProjectAccess](docs/ProjectAccess.md)
 - [TripletexRubyClient::ProjectActivity](docs/ProjectActivity.md)
 - [TripletexRubyClient::ProjectBudgetStatus](docs/ProjectBudgetStatus.md)
 - [TripletexRubyClient::ProjectCategory](docs/ProjectCategory.md)
 - [TripletexRubyClient::ProjectControlForm](docs/ProjectControlForm.md)
 - [TripletexRubyClient::ProjectControlFormType](docs/ProjectControlFormType.md)
 - [TripletexRubyClient::ProjectHourlyRate](docs/ProjectHourlyRate.md)
 - [TripletexRubyClient::ProjectHourlyRateTemplate](docs/ProjectHourlyRateTemplate.md)
 - [TripletexRubyClient::ProjectInvoiceDetails](docs/ProjectInvoiceDetails.md)
 - [TripletexRubyClient::ProjectOnboardingSummaryDTO](docs/ProjectOnboardingSummaryDTO.md)
 - [TripletexRubyClient::ProjectOrderLine](docs/ProjectOrderLine.md)
 - [TripletexRubyClient::ProjectOverviewAggregate](docs/ProjectOverviewAggregate.md)
 - [TripletexRubyClient::ProjectParticipant](docs/ProjectParticipant.md)
 - [TripletexRubyClient::ProjectPeriodHourlyReport](docs/ProjectPeriodHourlyReport.md)
 - [TripletexRubyClient::ProjectPeriodInvoiced](docs/ProjectPeriodInvoiced.md)
 - [TripletexRubyClient::ProjectPeriodInvoicingReserve](docs/ProjectPeriodInvoicingReserve.md)
 - [TripletexRubyClient::ProjectPeriodMonthlyStatus](docs/ProjectPeriodMonthlyStatus.md)
 - [TripletexRubyClient::ProjectPeriodOverallStatus](docs/ProjectPeriodOverallStatus.md)
 - [TripletexRubyClient::ProjectSettings](docs/ProjectSettings.md)
 - [TripletexRubyClient::ProjectSpecificRate](docs/ProjectSpecificRate.md)
 - [TripletexRubyClient::ProjectSpecificRateTemplate](docs/ProjectSpecificRateTemplate.md)
 - [TripletexRubyClient::ProjectTemplate](docs/ProjectTemplate.md)
 - [TripletexRubyClient::Prospect](docs/Prospect.md)
 - [TripletexRubyClient::Providers](docs/Providers.md)
 - [TripletexRubyClient::PurchaseOrder](docs/PurchaseOrder.md)
 - [TripletexRubyClient::PurchaseOrderIncomingInvoiceRelation](docs/PurchaseOrderIncomingInvoiceRelation.md)
 - [TripletexRubyClient::PurchaseOrderline](docs/PurchaseOrderline.md)
 - [TripletexRubyClient::ReelDocumentationDTO](docs/ReelDocumentationDTO.md)
 - [TripletexRubyClient::ReelDomainDTO](docs/ReelDomainDTO.md)
 - [TripletexRubyClient::ReelFunctionDTO](docs/ReelFunctionDTO.md)
 - [TripletexRubyClient::Reminder](docs/Reminder.md)
 - [TripletexRubyClient::RemunerationType](docs/RemunerationType.md)
 - [TripletexRubyClient::Report](docs/Report.md)
 - [TripletexRubyClient::ReportAccess](docs/ReportAccess.md)
 - [TripletexRubyClient::ReportAuthorization](docs/ReportAuthorization.md)
 - [TripletexRubyClient::ReportCell](docs/ReportCell.md)
 - [TripletexRubyClient::ReportFilterAccount](docs/ReportFilterAccount.md)
 - [TripletexRubyClient::ReportFilterCustomer](docs/ReportFilterCustomer.md)
 - [TripletexRubyClient::ReportFilterDepartment](docs/ReportFilterDepartment.md)
 - [TripletexRubyClient::ReportFilterEmployee](docs/ReportFilterEmployee.md)
 - [TripletexRubyClient::ReportFilterGeneral](docs/ReportFilterGeneral.md)
 - [TripletexRubyClient::ReportFilterPeriod](docs/ReportFilterPeriod.md)
 - [TripletexRubyClient::ReportFilterPeriodDatum](docs/ReportFilterPeriodDatum.md)
 - [TripletexRubyClient::ReportFilterProduct](docs/ReportFilterProduct.md)
 - [TripletexRubyClient::ReportFilterProject](docs/ReportFilterProject.md)
 - [TripletexRubyClient::ReportFilterRange](docs/ReportFilterRange.md)
 - [TripletexRubyClient::ReportFilterSingular](docs/ReportFilterSingular.md)
 - [TripletexRubyClient::ReportFilterSupplier](docs/ReportFilterSupplier.md)
 - [TripletexRubyClient::ReportGroup](docs/ReportGroup.md)
 - [TripletexRubyClient::ReportGroupAutoGroup](docs/ReportGroupAutoGroup.md)
 - [TripletexRubyClient::ReportGroupAutoGroupOrderBy](docs/ReportGroupAutoGroupOrderBy.md)
 - [TripletexRubyClient::ReportGroupFilter](docs/ReportGroupFilter.md)
 - [TripletexRubyClient::ReportResult](docs/ReportResult.md)
 - [TripletexRubyClient::ReportResultCell](docs/ReportResultCell.md)
 - [TripletexRubyClient::ReportResultEnvelope](docs/ReportResultEnvelope.md)
 - [TripletexRubyClient::ReportResultHeader](docs/ReportResultHeader.md)
 - [TripletexRubyClient::ResponseWrapper](docs/ResponseWrapper.md)
 - [TripletexRubyClient::ResponseWrapperAccommodationAllowance](docs/ResponseWrapperAccommodationAllowance.md)
 - [TripletexRubyClient::ResponseWrapperAccount](docs/ResponseWrapperAccount.md)
 - [TripletexRubyClient::ResponseWrapperAccountingPeriod](docs/ResponseWrapperAccountingPeriod.md)
 - [TripletexRubyClient::ResponseWrapperActivity](docs/ResponseWrapperActivity.md)
 - [TripletexRubyClient::ResponseWrapperAddon](docs/ResponseWrapperAddon.md)
 - [TripletexRubyClient::ResponseWrapperAddonStatusType](docs/ResponseWrapperAddonStatusType.md)
 - [TripletexRubyClient::ResponseWrapperAltinnCompanyModule](docs/ResponseWrapperAltinnCompanyModule.md)
 - [TripletexRubyClient::ResponseWrapperAltinnInstance](docs/ResponseWrapperAltinnInstance.md)
 - [TripletexRubyClient::ResponseWrapperAnnualAccount](docs/ResponseWrapperAnnualAccount.md)
 - [TripletexRubyClient::ResponseWrapperApiConsumer](docs/ResponseWrapperApiConsumer.md)
 - [TripletexRubyClient::ResponseWrapperAppSpecific](docs/ResponseWrapperAppSpecific.md)
 - [TripletexRubyClient::ResponseWrapperApproveResponseDTO](docs/ResponseWrapperApproveResponseDTO.md)
 - [TripletexRubyClient::ResponseWrapperAsset](docs/ResponseWrapperAsset.md)
 - [TripletexRubyClient::ResponseWrapperAutoLogin](docs/ResponseWrapperAutoLogin.md)
 - [TripletexRubyClient::ResponseWrapperBank](docs/ResponseWrapperBank.md)
 - [TripletexRubyClient::ResponseWrapperBankAgreement](docs/ResponseWrapperBankAgreement.md)
 - [TripletexRubyClient::ResponseWrapperBankBalanceEstimation](docs/ResponseWrapperBankBalanceEstimation.md)
 - [TripletexRubyClient::ResponseWrapperBankOnboardingDTO](docs/ResponseWrapperBankOnboardingDTO.md)
 - [TripletexRubyClient::ResponseWrapperBankReconciliation](docs/ResponseWrapperBankReconciliation.md)
 - [TripletexRubyClient::ResponseWrapperBankReconciliationMatch](docs/ResponseWrapperBankReconciliationMatch.md)
 - [TripletexRubyClient::ResponseWrapperBankReconciliationPaymentType](docs/ResponseWrapperBankReconciliationPaymentType.md)
 - [TripletexRubyClient::ResponseWrapperBankSettings](docs/ResponseWrapperBankSettings.md)
 - [TripletexRubyClient::ResponseWrapperBankStatement](docs/ResponseWrapperBankStatement.md)
 - [TripletexRubyClient::ResponseWrapperBankStatementBalanceDTO](docs/ResponseWrapperBankStatementBalanceDTO.md)
 - [TripletexRubyClient::ResponseWrapperBankTransaction](docs/ResponseWrapperBankTransaction.md)
 - [TripletexRubyClient::ResponseWrapperBanner](docs/ResponseWrapperBanner.md)
 - [TripletexRubyClient::ResponseWrapperBigDecimal](docs/ResponseWrapperBigDecimal.md)
 - [TripletexRubyClient::ResponseWrapperBoolean](docs/ResponseWrapperBoolean.md)
 - [TripletexRubyClient::ResponseWrapperBrregStatusCode](docs/ResponseWrapperBrregStatusCode.md)
 - [TripletexRubyClient::ResponseWrapperCloseGroup](docs/ResponseWrapperCloseGroup.md)
 - [TripletexRubyClient::ResponseWrapperCompany](docs/ResponseWrapperCompany.md)
 - [TripletexRubyClient::ResponseWrapperCompanyAuthorityDTO](docs/ResponseWrapperCompanyAuthorityDTO.md)
 - [TripletexRubyClient::ResponseWrapperCompanyHoliday](docs/ResponseWrapperCompanyHoliday.md)
 - [TripletexRubyClient::ResponseWrapperConsumerToken](docs/ResponseWrapperConsumerToken.md)
 - [TripletexRubyClient::ResponseWrapperContact](docs/ResponseWrapperContact.md)
 - [TripletexRubyClient::ResponseWrapperCost](docs/ResponseWrapperCost.md)
 - [TripletexRubyClient::ResponseWrapperCountry](docs/ResponseWrapperCountry.md)
 - [TripletexRubyClient::ResponseWrapperCurrency](docs/ResponseWrapperCurrency.md)
 - [TripletexRubyClient::ResponseWrapperCurrencyExchangeRate](docs/ResponseWrapperCurrencyExchangeRate.md)
 - [TripletexRubyClient::ResponseWrapperCustomer](docs/ResponseWrapperCustomer.md)
 - [TripletexRubyClient::ResponseWrapperCustomerCategory](docs/ResponseWrapperCustomerCategory.md)
 - [TripletexRubyClient::ResponseWrapperDashboardDTO](docs/ResponseWrapperDashboardDTO.md)
 - [TripletexRubyClient::ResponseWrapperDeliveryAddress](docs/ResponseWrapperDeliveryAddress.md)
 - [TripletexRubyClient::ResponseWrapperDepartment](docs/ResponseWrapperDepartment.md)
 - [TripletexRubyClient::ResponseWrapperDeviation](docs/ResponseWrapperDeviation.md)
 - [TripletexRubyClient::ResponseWrapperDiscountGroup](docs/ResponseWrapperDiscountGroup.md)
 - [TripletexRubyClient::ResponseWrapperDivision](docs/ResponseWrapperDivision.md)
 - [TripletexRubyClient::ResponseWrapperDocument](docs/ResponseWrapperDocument.md)
 - [TripletexRubyClient::ResponseWrapperDocumentArchive](docs/ResponseWrapperDocumentArchive.md)
 - [TripletexRubyClient::ResponseWrapperElectronicSupportDTO](docs/ResponseWrapperElectronicSupportDTO.md)
 - [TripletexRubyClient::ResponseWrapperEmployee](docs/ResponseWrapperEmployee.md)
 - [TripletexRubyClient::ResponseWrapperEmployeeCategory](docs/ResponseWrapperEmployeeCategory.md)
 - [TripletexRubyClient::ResponseWrapperEmployeePreferences](docs/ResponseWrapperEmployeePreferences.md)
 - [TripletexRubyClient::ResponseWrapperEmployeeToken](docs/ResponseWrapperEmployeeToken.md)
 - [TripletexRubyClient::ResponseWrapperEmployeeTokenBundle](docs/ResponseWrapperEmployeeTokenBundle.md)
 - [TripletexRubyClient::ResponseWrapperEmployment](docs/ResponseWrapperEmployment.md)
 - [TripletexRubyClient::ResponseWrapperEmploymentDetails](docs/ResponseWrapperEmploymentDetails.md)
 - [TripletexRubyClient::ResponseWrapperEntitlement](docs/ResponseWrapperEntitlement.md)
 - [TripletexRubyClient::ResponseWrapperEventInfoDTO](docs/ResponseWrapperEventInfoDTO.md)
 - [TripletexRubyClient::ResponseWrapperExternalProduct](docs/ResponseWrapperExternalProduct.md)
 - [TripletexRubyClient::ResponseWrapperFundingPartnerApplication](docs/ResponseWrapperFundingPartnerApplication.md)
 - [TripletexRubyClient::ResponseWrapperFundingPartnerQualify](docs/ResponseWrapperFundingPartnerQualify.md)
 - [TripletexRubyClient::ResponseWrapperGoodsReceipt](docs/ResponseWrapperGoodsReceipt.md)
 - [TripletexRubyClient::ResponseWrapperGoodsReceiptLine](docs/ResponseWrapperGoodsReceiptLine.md)
 - [TripletexRubyClient::ResponseWrapperHistoricalPosting](docs/ResponseWrapperHistoricalPosting.md)
 - [TripletexRubyClient::ResponseWrapperHourlyCostAndRate](docs/ResponseWrapperHourlyCostAndRate.md)
 - [TripletexRubyClient::ResponseWrapperIdPortenLogin](docs/ResponseWrapperIdPortenLogin.md)
 - [TripletexRubyClient::ResponseWrapperIdPortenLoginStatus](docs/ResponseWrapperIdPortenLoginStatus.md)
 - [TripletexRubyClient::ResponseWrapperImage](docs/ResponseWrapperImage.md)
 - [TripletexRubyClient::ResponseWrapperInteger](docs/ResponseWrapperInteger.md)
 - [TripletexRubyClient::ResponseWrapperInventory](docs/ResponseWrapperInventory.md)
 - [TripletexRubyClient::ResponseWrapperInventoryLocation](docs/ResponseWrapperInventoryLocation.md)
 - [TripletexRubyClient::ResponseWrapperInvoice](docs/ResponseWrapperInvoice.md)
 - [TripletexRubyClient::ResponseWrapperInvoiceSettingsDTO](docs/ResponseWrapperInvoiceSettingsDTO.md)
 - [TripletexRubyClient::ResponseWrapperLeaveOfAbsence](docs/ResponseWrapperLeaveOfAbsence.md)
 - [TripletexRubyClient::ResponseWrapperLegacyAddress](docs/ResponseWrapperLegacyAddress.md)
 - [TripletexRubyClient::ResponseWrapperListBankBalanceEstimation](docs/ResponseWrapperListBankBalanceEstimation.md)
 - [TripletexRubyClient::ResponseWrapperListElectronicSupportDTO](docs/ResponseWrapperListElectronicSupportDTO.md)
 - [TripletexRubyClient::ResponseWrapperListFileIdForIncomingPaymentsDTO](docs/ResponseWrapperListFileIdForIncomingPaymentsDTO.md)
 - [TripletexRubyClient::ResponseWrapperListInteger](docs/ResponseWrapperListInteger.md)
 - [TripletexRubyClient::ResponseWrapperListJob](docs/ResponseWrapperListJob.md)
 - [TripletexRubyClient::ResponseWrapperListString](docs/ResponseWrapperListString.md)
 - [TripletexRubyClient::ResponseWrapperLoggedInUserInfoDTO](docs/ResponseWrapperLoggedInUserInfoDTO.md)
 - [TripletexRubyClient::ResponseWrapperLogisticsSettings](docs/ResponseWrapperLogisticsSettings.md)
 - [TripletexRubyClient::ResponseWrapperLong](docs/ResponseWrapperLong.md)
 - [TripletexRubyClient::ResponseWrapperMapPilotFeatureBoolean](docs/ResponseWrapperMapPilotFeatureBoolean.md)
 - [TripletexRubyClient::ResponseWrapperMapStringEventInfoDescription](docs/ResponseWrapperMapStringEventInfoDescription.md)
 - [TripletexRubyClient::ResponseWrapperMenu](docs/ResponseWrapperMenu.md)
 - [TripletexRubyClient::ResponseWrapperMileageAllowance](docs/ResponseWrapperMileageAllowance.md)
 - [TripletexRubyClient::ResponseWrapperModules](docs/ResponseWrapperModules.md)
 - [TripletexRubyClient::ResponseWrapperMonthlyStatus](docs/ResponseWrapperMonthlyStatus.md)
 - [TripletexRubyClient::ResponseWrapperNextOfKin](docs/ResponseWrapperNextOfKin.md)
 - [TripletexRubyClient::ResponseWrapperNotification](docs/ResponseWrapperNotification.md)
 - [TripletexRubyClient::ResponseWrapperObject](docs/ResponseWrapperObject.md)
 - [TripletexRubyClient::ResponseWrapperOrder](docs/ResponseWrapperOrder.md)
 - [TripletexRubyClient::ResponseWrapperOrderGroup](docs/ResponseWrapperOrderGroup.md)
 - [TripletexRubyClient::ResponseWrapperOrderLine](docs/ResponseWrapperOrderLine.md)
 - [TripletexRubyClient::ResponseWrapperOrderOffer](docs/ResponseWrapperOrderOffer.md)
 - [TripletexRubyClient::ResponseWrapperPageOptions](docs/ResponseWrapperPageOptions.md)
 - [TripletexRubyClient::ResponseWrapperPassenger](docs/ResponseWrapperPassenger.md)
 - [TripletexRubyClient::ResponseWrapperPayment](docs/ResponseWrapperPayment.md)
 - [TripletexRubyClient::ResponseWrapperPaymentType](docs/ResponseWrapperPaymentType.md)
 - [TripletexRubyClient::ResponseWrapperPaymentTypeOut](docs/ResponseWrapperPaymentTypeOut.md)
 - [TripletexRubyClient::ResponseWrapperPayslip](docs/ResponseWrapperPayslip.md)
 - [TripletexRubyClient::ResponseWrapperPayslipInternal](docs/ResponseWrapperPayslipInternal.md)
 - [TripletexRubyClient::ResponseWrapperPensionScheme](docs/ResponseWrapperPensionScheme.md)
 - [TripletexRubyClient::ResponseWrapperPerDiemCompensation](docs/ResponseWrapperPerDiemCompensation.md)
 - [TripletexRubyClient::ResponseWrapperPickupPoint](docs/ResponseWrapperPickupPoint.md)
 - [TripletexRubyClient::ResponseWrapperPosting](docs/ResponseWrapperPosting.md)
 - [TripletexRubyClient::ResponseWrapperProduct](docs/ResponseWrapperProduct.md)
 - [TripletexRubyClient::ResponseWrapperProductGroup](docs/ResponseWrapperProductGroup.md)
 - [TripletexRubyClient::ResponseWrapperProductGroupRelation](docs/ResponseWrapperProductGroupRelation.md)
 - [TripletexRubyClient::ResponseWrapperProductInventoryLocation](docs/ResponseWrapperProductInventoryLocation.md)
 - [TripletexRubyClient::ResponseWrapperProductLine](docs/ResponseWrapperProductLine.md)
 - [TripletexRubyClient::ResponseWrapperProductSettings](docs/ResponseWrapperProductSettings.md)
 - [TripletexRubyClient::ResponseWrapperProductUnit](docs/ResponseWrapperProductUnit.md)
 - [TripletexRubyClient::ResponseWrapperProductUnitMaster](docs/ResponseWrapperProductUnitMaster.md)
 - [TripletexRubyClient::ResponseWrapperProject](docs/ResponseWrapperProject.md)
 - [TripletexRubyClient::ResponseWrapperProjectAccess](docs/ResponseWrapperProjectAccess.md)
 - [TripletexRubyClient::ResponseWrapperProjectActivity](docs/ResponseWrapperProjectActivity.md)
 - [TripletexRubyClient::ResponseWrapperProjectBudgetStatus](docs/ResponseWrapperProjectBudgetStatus.md)
 - [TripletexRubyClient::ResponseWrapperProjectCategory](docs/ResponseWrapperProjectCategory.md)
 - [TripletexRubyClient::ResponseWrapperProjectControlForm](docs/ResponseWrapperProjectControlForm.md)
 - [TripletexRubyClient::ResponseWrapperProjectControlFormType](docs/ResponseWrapperProjectControlFormType.md)
 - [TripletexRubyClient::ResponseWrapperProjectHourlyRate](docs/ResponseWrapperProjectHourlyRate.md)
 - [TripletexRubyClient::ResponseWrapperProjectInvoiceDetails](docs/ResponseWrapperProjectInvoiceDetails.md)
 - [TripletexRubyClient::ResponseWrapperProjectOnboardingSummaryDTO](docs/ResponseWrapperProjectOnboardingSummaryDTO.md)
 - [TripletexRubyClient::ResponseWrapperProjectOrderLine](docs/ResponseWrapperProjectOrderLine.md)
 - [TripletexRubyClient::ResponseWrapperProjectParticipant](docs/ResponseWrapperProjectParticipant.md)
 - [TripletexRubyClient::ResponseWrapperProjectPeriodHourlyReport](docs/ResponseWrapperProjectPeriodHourlyReport.md)
 - [TripletexRubyClient::ResponseWrapperProjectPeriodInvoiced](docs/ResponseWrapperProjectPeriodInvoiced.md)
 - [TripletexRubyClient::ResponseWrapperProjectPeriodInvoicingReserve](docs/ResponseWrapperProjectPeriodInvoicingReserve.md)
 - [TripletexRubyClient::ResponseWrapperProjectPeriodOverallStatus](docs/ResponseWrapperProjectPeriodOverallStatus.md)
 - [TripletexRubyClient::ResponseWrapperProjectSettings](docs/ResponseWrapperProjectSettings.md)
 - [TripletexRubyClient::ResponseWrapperProjectSpecificRate](docs/ResponseWrapperProjectSpecificRate.md)
 - [TripletexRubyClient::ResponseWrapperProjectTemplate](docs/ResponseWrapperProjectTemplate.md)
 - [TripletexRubyClient::ResponseWrapperProspect](docs/ResponseWrapperProspect.md)
 - [TripletexRubyClient::ResponseWrapperPurchaseOrder](docs/ResponseWrapperPurchaseOrder.md)
 - [TripletexRubyClient::ResponseWrapperPurchaseOrderIncomingInvoiceRelation](docs/ResponseWrapperPurchaseOrderIncomingInvoiceRelation.md)
 - [TripletexRubyClient::ResponseWrapperPurchaseOrderline](docs/ResponseWrapperPurchaseOrderline.md)
 - [TripletexRubyClient::ResponseWrapperReelDomainDTO](docs/ResponseWrapperReelDomainDTO.md)
 - [TripletexRubyClient::ResponseWrapperReminder](docs/ResponseWrapperReminder.md)
 - [TripletexRubyClient::ResponseWrapperReport](docs/ResponseWrapperReport.md)
 - [TripletexRubyClient::ResponseWrapperReportAuthorization](docs/ResponseWrapperReportAuthorization.md)
 - [TripletexRubyClient::ResponseWrapperReportCell](docs/ResponseWrapperReportCell.md)
 - [TripletexRubyClient::ResponseWrapperReportGroup](docs/ResponseWrapperReportGroup.md)
 - [TripletexRubyClient::ResponseWrapperReportResultEnvelope](docs/ResponseWrapperReportResultEnvelope.md)
 - [TripletexRubyClient::ResponseWrapperResultBudget](docs/ResponseWrapperResultBudget.md)
 - [TripletexRubyClient::ResponseWrapperSalaryCompilation](docs/ResponseWrapperSalaryCompilation.md)
 - [TripletexRubyClient::ResponseWrapperSalarySettings](docs/ResponseWrapperSalarySettings.md)
 - [TripletexRubyClient::ResponseWrapperSalarySpecSupplementInternal](docs/ResponseWrapperSalarySpecSupplementInternal.md)
 - [TripletexRubyClient::ResponseWrapperSalarySpecification](docs/ResponseWrapperSalarySpecification.md)
 - [TripletexRubyClient::ResponseWrapperSalarySpecificationInternal](docs/ResponseWrapperSalarySpecificationInternal.md)
 - [TripletexRubyClient::ResponseWrapperSalaryTransaction](docs/ResponseWrapperSalaryTransaction.md)
 - [TripletexRubyClient::ResponseWrapperSalaryTransactionInternal](docs/ResponseWrapperSalaryTransactionInternal.md)
 - [TripletexRubyClient::ResponseWrapperSalaryType](docs/ResponseWrapperSalaryType.md)
 - [TripletexRubyClient::ResponseWrapperSalaryTypeInternal](docs/ResponseWrapperSalaryTypeInternal.md)
 - [TripletexRubyClient::ResponseWrapperSalesForceAccountInfo](docs/ResponseWrapperSalesForceAccountInfo.md)
 - [TripletexRubyClient::ResponseWrapperSalesForceEmployee](docs/ResponseWrapperSalesForceEmployee.md)
 - [TripletexRubyClient::ResponseWrapperSalesForceEmployeeRole](docs/ResponseWrapperSalesForceEmployeeRole.md)
 - [TripletexRubyClient::ResponseWrapperSalesForceOpportunity](docs/ResponseWrapperSalesForceOpportunity.md)
 - [TripletexRubyClient::ResponseWrapperSalesForceStats](docs/ResponseWrapperSalesForceStats.md)
 - [TripletexRubyClient::ResponseWrapperSalesModuleDTO](docs/ResponseWrapperSalesModuleDTO.md)
 - [TripletexRubyClient::ResponseWrapperSessionToken](docs/ResponseWrapperSessionToken.md)
 - [TripletexRubyClient::ResponseWrapperStandardTime](docs/ResponseWrapperStandardTime.md)
 - [TripletexRubyClient::ResponseWrapperStocktaking](docs/ResponseWrapperStocktaking.md)
 - [TripletexRubyClient::ResponseWrapperStorebrandPensionOnboarding](docs/ResponseWrapperStorebrandPensionOnboarding.md)
 - [TripletexRubyClient::ResponseWrapperStorebrandPensionOnboardingQualify](docs/ResponseWrapperStorebrandPensionOnboardingQualify.md)
 - [TripletexRubyClient::ResponseWrapperString](docs/ResponseWrapperString.md)
 - [TripletexRubyClient::ResponseWrapperSubscription](docs/ResponseWrapperSubscription.md)
 - [TripletexRubyClient::ResponseWrapperSupplier](docs/ResponseWrapperSupplier.md)
 - [TripletexRubyClient::ResponseWrapperSupplierInvoice](docs/ResponseWrapperSupplierInvoice.md)
 - [TripletexRubyClient::ResponseWrapperSupplierProduct](docs/ResponseWrapperSupplierProduct.md)
 - [TripletexRubyClient::ResponseWrapperSystemMessage](docs/ResponseWrapperSystemMessage.md)
 - [TripletexRubyClient::ResponseWrapperTemplate](docs/ResponseWrapperTemplate.md)
 - [TripletexRubyClient::ResponseWrapperTimeClock](docs/ResponseWrapperTimeClock.md)
 - [TripletexRubyClient::ResponseWrapperTimesheetEntry](docs/ResponseWrapperTimesheetEntry.md)
 - [TripletexRubyClient::ResponseWrapperTimesheetSalaryTypeSpecification](docs/ResponseWrapperTimesheetSalaryTypeSpecification.md)
 - [TripletexRubyClient::ResponseWrapperTimesheetSettings](docs/ResponseWrapperTimesheetSettings.md)
 - [TripletexRubyClient::ResponseWrapperTransportType](docs/ResponseWrapperTransportType.md)
 - [TripletexRubyClient::ResponseWrapperTravelCostCategory](docs/ResponseWrapperTravelCostCategory.md)
 - [TripletexRubyClient::ResponseWrapperTravelExpense](docs/ResponseWrapperTravelExpense.md)
 - [TripletexRubyClient::ResponseWrapperTravelExpenseRate](docs/ResponseWrapperTravelExpenseRate.md)
 - [TripletexRubyClient::ResponseWrapperTravelExpenseRateCategory](docs/ResponseWrapperTravelExpenseRateCategory.md)
 - [TripletexRubyClient::ResponseWrapperTravelExpenseRateCategoryGroup](docs/ResponseWrapperTravelExpenseRateCategoryGroup.md)
 - [TripletexRubyClient::ResponseWrapperTravelExpenseSettings](docs/ResponseWrapperTravelExpenseSettings.md)
 - [TripletexRubyClient::ResponseWrapperTravelExpenseZone](docs/ResponseWrapperTravelExpenseZone.md)
 - [TripletexRubyClient::ResponseWrapperTravelPaymentType](docs/ResponseWrapperTravelPaymentType.md)
 - [TripletexRubyClient::ResponseWrapperTripDTO](docs/ResponseWrapperTripDTO.md)
 - [TripletexRubyClient::ResponseWrapperTripletexAccountPricesReturnDTO](docs/ResponseWrapperTripletexAccountPricesReturnDTO.md)
 - [TripletexRubyClient::ResponseWrapperTripletexAccountReturn](docs/ResponseWrapperTripletexAccountReturn.md)
 - [TripletexRubyClient::ResponseWrapperTripletexCompanyModules](docs/ResponseWrapperTripletexCompanyModules.md)
 - [TripletexRubyClient::ResponseWrapperUnreadCountDTO](docs/ResponseWrapperUnreadCountDTO.md)
 - [TripletexRubyClient::ResponseWrapperUserTemplate](docs/ResponseWrapperUserTemplate.md)
 - [TripletexRubyClient::ResponseWrapperUserTemplateDefaultDTO](docs/ResponseWrapperUserTemplateDefaultDTO.md)
 - [TripletexRubyClient::ResponseWrapperVFCustomerResponseDTO](docs/ResponseWrapperVFCustomerResponseDTO.md)
 - [TripletexRubyClient::ResponseWrapperVatReturns2022](docs/ResponseWrapperVatReturns2022.md)
 - [TripletexRubyClient::ResponseWrapperVatReturns2022ValidateCreate](docs/ResponseWrapperVatReturns2022ValidateCreate.md)
 - [TripletexRubyClient::ResponseWrapperVatReturnsPaymentInfo](docs/ResponseWrapperVatReturnsPaymentInfo.md)
 - [TripletexRubyClient::ResponseWrapperVatReturnsValidationResult](docs/ResponseWrapperVatReturnsValidationResult.md)
 - [TripletexRubyClient::ResponseWrapperVatSpecificationLine](docs/ResponseWrapperVatSpecificationLine.md)
 - [TripletexRubyClient::ResponseWrapperVatType](docs/ResponseWrapperVatType.md)
 - [TripletexRubyClient::ResponseWrapperVoucher](docs/ResponseWrapperVoucher.md)
 - [TripletexRubyClient::ResponseWrapperVoucherApprovalListElement](docs/ResponseWrapperVoucherApprovalListElement.md)
 - [TripletexRubyClient::ResponseWrapperVoucherMessage](docs/ResponseWrapperVoucherMessage.md)
 - [TripletexRubyClient::ResponseWrapperVoucherOptions](docs/ResponseWrapperVoucherOptions.md)
 - [TripletexRubyClient::ResponseWrapperVoucherStatus](docs/ResponseWrapperVoucherStatus.md)
 - [TripletexRubyClient::ResponseWrapperVoucherType](docs/ResponseWrapperVoucherType.md)
 - [TripletexRubyClient::ResponseWrapperWeek](docs/ResponseWrapperWeek.md)
 - [TripletexRubyClient::ResponseWrapperZtlAccount](docs/ResponseWrapperZtlAccount.md)
 - [TripletexRubyClient::ResponseWrapperZtlConsent](docs/ResponseWrapperZtlConsent.md)
 - [TripletexRubyClient::ResponseWrapperZtlOnboarding](docs/ResponseWrapperZtlOnboarding.md)
 - [TripletexRubyClient::RestrictedEntitlementChangeDTO](docs/RestrictedEntitlementChangeDTO.md)
 - [TripletexRubyClient::ResultBudget](docs/ResultBudget.md)
 - [TripletexRubyClient::SalaryCompilation](docs/SalaryCompilation.md)
 - [TripletexRubyClient::SalaryCompilationLine](docs/SalaryCompilationLine.md)
 - [TripletexRubyClient::SalarySettings](docs/SalarySettings.md)
 - [TripletexRubyClient::SalarySpecSupplementInternal](docs/SalarySpecSupplementInternal.md)
 - [TripletexRubyClient::SalarySpecification](docs/SalarySpecification.md)
 - [TripletexRubyClient::SalarySpecificationInternal](docs/SalarySpecificationInternal.md)
 - [TripletexRubyClient::SalaryTransaction](docs/SalaryTransaction.md)
 - [TripletexRubyClient::SalaryTransactionInternal](docs/SalaryTransactionInternal.md)
 - [TripletexRubyClient::SalaryType](docs/SalaryType.md)
 - [TripletexRubyClient::SalaryTypeInternal](docs/SalaryTypeInternal.md)
 - [TripletexRubyClient::SalesForceAccountInfo](docs/SalesForceAccountInfo.md)
 - [TripletexRubyClient::SalesForceAddress](docs/SalesForceAddress.md)
 - [TripletexRubyClient::SalesForceCountry](docs/SalesForceCountry.md)
 - [TripletexRubyClient::SalesForceEmployee](docs/SalesForceEmployee.md)
 - [TripletexRubyClient::SalesForceEmployeeRole](docs/SalesForceEmployeeRole.md)
 - [TripletexRubyClient::SalesForceOpportunity](docs/SalesForceOpportunity.md)
 - [TripletexRubyClient::SalesForceStats](docs/SalesForceStats.md)
 - [TripletexRubyClient::SalesModuleDTO](docs/SalesModuleDTO.md)
 - [TripletexRubyClient::SearchCompletionDTO](docs/SearchCompletionDTO.md)
 - [TripletexRubyClient::SessionToken](docs/SessionToken.md)
 - [TripletexRubyClient::StandardTime](docs/StandardTime.md)
 - [TripletexRubyClient::Stock](docs/Stock.md)
 - [TripletexRubyClient::Stocktaking](docs/Stocktaking.md)
 - [TripletexRubyClient::StorebrandPensionOnboarding](docs/StorebrandPensionOnboarding.md)
 - [TripletexRubyClient::StorebrandPensionOnboardingQualify](docs/StorebrandPensionOnboardingQualify.md)
 - [TripletexRubyClient::Subscription](docs/Subscription.md)
 - [TripletexRubyClient::Supplier](docs/Supplier.md)
 - [TripletexRubyClient::SupplierBalance](docs/SupplierBalance.md)
 - [TripletexRubyClient::SupplierInvoice](docs/SupplierInvoice.md)
 - [TripletexRubyClient::SupplierProduct](docs/SupplierProduct.md)
 - [TripletexRubyClient::SystemMessage](docs/SystemMessage.md)
 - [TripletexRubyClient::SystemReportCategoryDTO](docs/SystemReportCategoryDTO.md)
 - [TripletexRubyClient::SystemReportDTO](docs/SystemReportDTO.md)
 - [TripletexRubyClient::Task](docs/Task.md)
 - [TripletexRubyClient::Template](docs/Template.md)
 - [TripletexRubyClient::TimeClock](docs/TimeClock.md)
 - [TripletexRubyClient::TimesheetEntry](docs/TimesheetEntry.md)
 - [TripletexRubyClient::TimesheetEntrySearchResponse](docs/TimesheetEntrySearchResponse.md)
 - [TripletexRubyClient::TimesheetSalaryTypeSpecification](docs/TimesheetSalaryTypeSpecification.md)
 - [TripletexRubyClient::TimesheetSettings](docs/TimesheetSettings.md)
 - [TripletexRubyClient::TlxNumber](docs/TlxNumber.md)
 - [TripletexRubyClient::TransportType](docs/TransportType.md)
 - [TripletexRubyClient::TravelCostCategory](docs/TravelCostCategory.md)
 - [TripletexRubyClient::TravelDetails](docs/TravelDetails.md)
 - [TripletexRubyClient::TravelExpense](docs/TravelExpense.md)
 - [TripletexRubyClient::TravelExpenseRate](docs/TravelExpenseRate.md)
 - [TripletexRubyClient::TravelExpenseRateCategory](docs/TravelExpenseRateCategory.md)
 - [TripletexRubyClient::TravelExpenseRateCategoryGroup](docs/TravelExpenseRateCategoryGroup.md)
 - [TripletexRubyClient::TravelExpenseSettings](docs/TravelExpenseSettings.md)
 - [TripletexRubyClient::TravelExpenseZone](docs/TravelExpenseZone.md)
 - [TripletexRubyClient::TravelPaymentType](docs/TravelPaymentType.md)
 - [TripletexRubyClient::TriggerDTO](docs/TriggerDTO.md)
 - [TripletexRubyClient::TripDTO](docs/TripDTO.md)
 - [TripletexRubyClient::TripletexAccount](docs/TripletexAccount.md)
 - [TripletexRubyClient::TripletexAccount2](docs/TripletexAccount2.md)
 - [TripletexRubyClient::TripletexAccountPricesReturnDTO](docs/TripletexAccountPricesReturnDTO.md)
 - [TripletexRubyClient::TripletexAccountReturn](docs/TripletexAccountReturn.md)
 - [TripletexRubyClient::TripletexCompanyModules](docs/TripletexCompanyModules.md)
 - [TripletexRubyClient::UnreadCountDTO](docs/UnreadCountDTO.md)
 - [TripletexRubyClient::UpsaleMetric](docs/UpsaleMetric.md)
 - [TripletexRubyClient::UserTemplate](docs/UserTemplate.md)
 - [TripletexRubyClient::UserTemplateDefaultDTO](docs/UserTemplateDefaultDTO.md)
 - [TripletexRubyClient::VFCustomerResponseDTO](docs/VFCustomerResponseDTO.md)
 - [TripletexRubyClient::VFProductOnboardingStatusDTO](docs/VFProductOnboardingStatusDTO.md)
 - [TripletexRubyClient::ValidationError](docs/ValidationError.md)
 - [TripletexRubyClient::ValidationReasonDTO](docs/ValidationReasonDTO.md)
 - [TripletexRubyClient::VatReturns2022](docs/VatReturns2022.md)
 - [TripletexRubyClient::VatReturns2022Creation](docs/VatReturns2022Creation.md)
 - [TripletexRubyClient::VatReturns2022ValidateCreate](docs/VatReturns2022ValidateCreate.md)
 - [TripletexRubyClient::VatReturnsComment](docs/VatReturnsComment.md)
 - [TripletexRubyClient::VatReturnsPaymentInfo](docs/VatReturnsPaymentInfo.md)
 - [TripletexRubyClient::VatReturnsValidationResult](docs/VatReturnsValidationResult.md)
 - [TripletexRubyClient::VatReturnsVatCodeCommentDTO](docs/VatReturnsVatCodeCommentDTO.md)
 - [TripletexRubyClient::VatSpecificationGroup](docs/VatSpecificationGroup.md)
 - [TripletexRubyClient::VatSpecificationLine](docs/VatSpecificationLine.md)
 - [TripletexRubyClient::VatTermPeriod](docs/VatTermPeriod.md)
 - [TripletexRubyClient::VatType](docs/VatType.md)
 - [TripletexRubyClient::VfFactoringOffer](docs/VfFactoringOffer.md)
 - [TripletexRubyClient::Voucher](docs/Voucher.md)
 - [TripletexRubyClient::VoucherApprovalListElement](docs/VoucherApprovalListElement.md)
 - [TripletexRubyClient::VoucherMessage](docs/VoucherMessage.md)
 - [TripletexRubyClient::VoucherOptions](docs/VoucherOptions.md)
 - [TripletexRubyClient::VoucherSearchResponse](docs/VoucherSearchResponse.md)
 - [TripletexRubyClient::VoucherStatus](docs/VoucherStatus.md)
 - [TripletexRubyClient::VoucherType](docs/VoucherType.md)
 - [TripletexRubyClient::WebHookWrapper](docs/WebHookWrapper.md)
 - [TripletexRubyClient::Week](docs/Week.md)
 - [TripletexRubyClient::WorkingHoursScheme](docs/WorkingHoursScheme.md)
 - [TripletexRubyClient::ZtlAccount](docs/ZtlAccount.md)
 - [TripletexRubyClient::ZtlConsent](docs/ZtlConsent.md)
 - [TripletexRubyClient::ZtlOnboarding](docs/ZtlOnboarding.md)


## Documentation for Authorization


### tokenAuthScheme

- **Type**: HTTP basic authentication

