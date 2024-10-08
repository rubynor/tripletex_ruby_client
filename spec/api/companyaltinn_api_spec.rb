=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'

# Unit tests for TripletexRubyClient::CompanyaltinnApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'CompanyaltinnApi' do
  before do
    # run before each test
    @instance = TripletexRubyClient::CompanyaltinnApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of CompanyaltinnApi' do
    it 'should create an instance of CompanyaltinnApi' do
      expect(@instance).to be_instance_of(TripletexRubyClient::CompanyaltinnApi)
    end
  end

  # unit tests for put
  # [BETA] Update AltInn id and password.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [AltinnCompanyModule] :body Partial object describing what should be updated
  # @return [ResponseWrapperAltinnCompanyModule]
  describe 'put test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for search
  # [BETA] Find Altinn id for login in company.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [String] :fields Fields filter pattern
  # @return [ResponseWrapperAltinnCompanyModule]
  describe 'search test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
