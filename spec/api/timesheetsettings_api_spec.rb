=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'

# Unit tests for TripletexRubyClient::TimesheetsettingsApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'TimesheetsettingsApi' do
  before do
    # run before each test
    @instance = TripletexRubyClient::TimesheetsettingsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of TimesheetsettingsApi' do
    it 'should create an instance of TimesheetsettingsApi' do
      expect(@instance).to be_instance_of(TripletexRubyClient::TimesheetsettingsApi)
    end
  end

  # unit tests for get
  # [BETA] Get timesheet settings of logged in company.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [String] :fields Fields filter pattern
  # @return [ResponseWrapperTimesheetSettings]
  describe 'get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
