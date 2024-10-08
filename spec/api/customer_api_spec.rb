=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'

# Unit tests for TripletexRubyClient::CustomerApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'CustomerApi' do
  before do
    # run before each test
    @instance = TripletexRubyClient::CustomerApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of CustomerApi' do
    it 'should create an instance of CustomerApi' do
      expect(@instance).to be_instance_of(TripletexRubyClient::CustomerApi)
    end
  end

  # unit tests for delete
  # [BETA] Delete customer by ID
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
  # Get customer by ID.
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [String] :fields Fields filter pattern
  # @return [ResponseWrapperCustomer]
  describe 'get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post
  # Create customer. Related customer addresses may also be created.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Customer] :body JSON representing the new object to be created. Should not have ID and version set.
  # @return [ResponseWrapperCustomer]
  describe 'post test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_list
  # [BETA] Create multiple customers. Related supplier addresses may also be created.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Array<Customer>] :body JSON representing a list of new object to be created. Should not have ID and version set.
  # @return [ListResponseCustomer]
  describe 'post_list test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for put
  # Update customer. 
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [Customer] :body Partial object describing what should be updated
  # @return [ResponseWrapperCustomer]
  describe 'put test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for put_list
  # [BETA] Update multiple customers. Addresses can also be updated.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Array<Customer>] :body JSON representing updates to object. Should have ID and version set.
  # @return [ListResponseCustomer]
  describe 'put_list test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for search
  # Find customers corresponding with sent data.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [String] :id List of IDs
  # @option opts [String] :customer_account_number List of IDs
  # @option opts [String] :organization_number Equals
  # @option opts [String] :email Equals
  # @option opts [String] :invoice_email Equals
  # @option opts [BOOLEAN] :is_inactive Equals
  # @option opts [String] :account_manager_id List of IDs
  # @option opts [String] :changed_since Only return elements that have changed since this date and time
  # @option opts [Integer] :from From index
  # @option opts [Integer] :count Number of elements to return
  # @option opts [String] :sorting Sorting pattern
  # @option opts [String] :fields Fields filter pattern
  # @return [ListResponseCustomer]
  describe 'search test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
