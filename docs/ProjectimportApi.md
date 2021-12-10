# TripletexRubyClient::ProjectimportApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**import_project_statement**](ProjectimportApi.md#import_project_statement) | **POST** /project/import | Upload project import file.


# **import_project_statement**
> ListResponseProject import_project_statement(file_format, file, opts)

Upload project import file.



### Example
```ruby
# load the gem
require 'tripletex_ruby_client'
# setup authorization
TripletexRubyClient.configure do |config|
  # Configure HTTP basic authorization: tokenAuthScheme
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = TripletexRubyClient::ProjectimportApi.new

file_format = 'file_format_example' # String | File format

file = File.new('/path/to/file.txt') # File | The project import file

opts = { 
  encoding: 'encoding_example', # String | Encoding
  delimiter: 'delimiter_example', # String | Delimiter
  ignore_first_row: true # BOOLEAN | Ignore first row
}

begin
  #Upload project import file.
  result = api_instance.import_project_statement(file_format, file, opts)
  p result
rescue TripletexRubyClient::ApiError => e
  puts "Exception when calling ProjectimportApi->import_project_statement: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file_format** | **String**| File format | 
 **file** | **File**| The project import file | 
 **encoding** | **String**| Encoding | [optional] 
 **delimiter** | **String**| Delimiter | [optional] 
 **ignore_first_row** | **BOOLEAN**| Ignore first row | [optional] 

### Return type

[**ListResponseProject**](ListResponseProject.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined



