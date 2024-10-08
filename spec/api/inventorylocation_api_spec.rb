=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'

# Unit tests for TripletexRubyClient::InventorylocationApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'InventorylocationApi' do
  before do
    # run before each test
    @instance = TripletexRubyClient::InventorylocationApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of InventorylocationApi' do
    it 'should create an instance of InventorylocationApi' do
      expect(@instance).to be_instance_of(TripletexRubyClient::InventorylocationApi)
    end
  end

  # unit tests for delete
  # [BETA] Delete inventory location. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_by_ids
  # [BETA] Delete inventory location. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
  # 
  # @param ids ID of the elements
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_by_ids test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get
  # Get inventory location by ID. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [String] :fields Fields filter pattern
  # @return [ResponseWrapperInventoryLocation]
  describe 'get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post
  # [BETA] Create new inventory location. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [InventoryLocation] :body JSON representing the new object to be created. Should not have ID and version set.
  # @return [ResponseWrapperInventoryLocation]
  describe 'post test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_list
  # [BETA] Add multiple inventory locations. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Array<InventoryLocation>] :body JSON representing a list of new object to be created. Should not have ID and version set.
  # @return [ListResponseInventoryLocation]
  describe 'post_list test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for put
  # [BETA] Update inventory location. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [InventoryLocation] :body Partial object describing what should be updated
  # @return [ResponseWrapperInventoryLocation]
  describe 'put test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for put_list
  # [BETA] Update multiple inventory locations. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Array<InventoryLocation>] :body JSON representing updates to object. Should have ID and version set.
  # @return [ListResponseInventoryLocation]
  describe 'put_list test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for search
  # [BETA] Find inventory locations by inventory ID. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [String] :warehouse_id List of IDs
  # @option opts [BOOLEAN] :is_inactive Equals
  # @option opts [String] :name Containing
  # @option opts [Integer] :from From index
  # @option opts [Integer] :count Number of elements to return
  # @option opts [String] :sorting Sorting pattern
  # @option opts [String] :fields Fields filter pattern
  # @return [ListResponseInventoryLocation]
  describe 'search test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
