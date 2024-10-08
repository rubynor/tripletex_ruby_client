=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'

# Unit tests for TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'ProjecthourlyRatesprojectSpecificRatesApi' do
  before do
    # run before each test
    @instance = TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ProjecthourlyRatesprojectSpecificRatesApi' do
    it 'should create an instance of ProjecthourlyRatesprojectSpecificRatesApi' do
      expect(@instance).to be_instance_of(TripletexRubyClient::ProjecthourlyRatesprojectSpecificRatesApi)
    end
  end

  # unit tests for delete
  # Delete project specific rate 
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
  # Delete project specific rates.
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
  # Find project specific rate by ID.
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [String] :fields Fields filter pattern
  # @return [ResponseWrapperProjectSpecificRate]
  describe 'get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post
  # Create new project specific rate. 
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [ProjectSpecificRate] :body JSON representing the new object to be created. Should not have ID and version set.
  # @return [ResponseWrapperProjectSpecificRate]
  describe 'post test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_list
  # Create multiple new project specific rates.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Array<ProjectSpecificRate>] :body JSON representing a list of new object to be created. Should not have ID and version set.
  # @return [ListResponseProjectSpecificRate]
  describe 'post_list test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for put
  # Update a project specific rate.
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [ProjectSpecificRate] :body Partial object describing what should be updated
  # @return [ResponseWrapperProjectSpecificRate]
  describe 'put test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for put_list
  # Update multiple project specific rates.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Array<ProjectSpecificRate>] :body JSON representing updates to object. Should have ID and version set.
  # @return [ListResponseProjectSpecificRate]
  describe 'put_list test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for search
  # Find project specific rates corresponding with sent data.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [String] :id List of IDs
  # @option opts [String] :project_hourly_rate_id List of IDs
  # @option opts [String] :employee_id List of IDs
  # @option opts [String] :activity_id List of IDs
  # @option opts [Integer] :from From index
  # @option opts [Integer] :count Number of elements to return
  # @option opts [String] :sorting Sorting pattern
  # @option opts [String] :fields Fields filter pattern
  # @return [ListResponseProjectSpecificRate]
  describe 'search test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
