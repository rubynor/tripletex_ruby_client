=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'

# Unit tests for TripletexRubyClient::EmployeecategoryApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'EmployeecategoryApi' do
  before do
    # run before each test
    @instance = TripletexRubyClient::EmployeecategoryApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of EmployeecategoryApi' do
    it 'should create an instance of EmployeecategoryApi' do
      expect(@instance).to be_instance_of(TripletexRubyClient::EmployeecategoryApi)
    end
  end

  # unit tests for delete
  # [BETA] Delete employee category by ID
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
  # [BETA] Delete multiple employee categories
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
  # [BETA] Get employee category by ID.
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [String] :fields Fields filter pattern
  # @return [ResponseWrapperEmployeeCategory]
  describe 'get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post
  # [BETA] Create a new employee category.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [EmployeeCategory] :body JSON representing the new object to be created. Should not have ID and version set.
  # @return [ResponseWrapperEmployeeCategory]
  describe 'post test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_list
  # [BETA] Create new employee categories.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Array<EmployeeCategory>] :body JSON representing a list of new object to be created. Should not have ID and version set.
  # @return [ListResponseEmployeeCategory]
  describe 'post_list test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for put
  # [BETA] Update employee category information.
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [EmployeeCategory] :body Partial object describing what should be updated
  # @return [ResponseWrapperEmployeeCategory]
  describe 'put test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for put_list
  # [BETA] Update multiple employee categories.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Array<EmployeeCategory>] :body JSON representing updates to object. Should have ID and version set.
  # @return [ListResponseEmployeeCategory]
  describe 'put_list test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for search
  # [BETA] Find employee category corresponding with sent data.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [String] :id List of IDs
  # @option opts [String] :name Containing
  # @option opts [String] :number List of IDs
  # @option opts [Integer] :from From index
  # @option opts [Integer] :count Number of elements to return
  # @option opts [String] :sorting Sorting pattern
  # @option opts [String] :fields Fields filter pattern
  # @return [ListResponseEmployeeCategory]
  describe 'search test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
