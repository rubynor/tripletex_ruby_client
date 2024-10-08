=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'

# Unit tests for TripletexRubyClient::SalarytransactionApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'SalarytransactionApi' do
  before do
    # run before each test
    @instance = TripletexRubyClient::SalarytransactionApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of SalarytransactionApi' do
    it 'should create an instance of SalarytransactionApi' do
      expect(@instance).to be_instance_of(TripletexRubyClient::SalarytransactionApi)
    end
  end

  # unit tests for delete
  # [BETA] Delete salary transaction by ID.
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get
  # [BETA] Find salary transaction by ID.
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [String] :fields Fields filter pattern
  # @return [ResponseWrapperSalaryTransaction]
  describe 'get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post
  # [BETA] Create a new salary transaction.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [SalaryTransaction] :body JSON representing the new object to be created. Should not have ID and version set.
  # @option opts [BOOLEAN] :generate_tax_deduction Generate tax deduction
  # @return [ResponseWrapperSalaryTransaction]
  describe 'post test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
