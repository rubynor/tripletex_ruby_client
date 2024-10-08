=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'

# Unit tests for TripletexRubyClient::ActivityApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'ActivityApi' do
  before do
    # run before each test
    @instance = TripletexRubyClient::ActivityApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ActivityApi' do
    it 'should create an instance of ActivityApi' do
      expect(@instance).to be_instance_of(TripletexRubyClient::ActivityApi)
    end
  end

  # unit tests for get
  # Find activity by ID.
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [String] :fields Fields filter pattern
  # @return [ResponseWrapperActivity]
  describe 'get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_for_time_sheet
  # Find applicable time sheet activities for an employee on a specific day.
  # 
  # @param project_id Project ID
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :employee_id Employee ID. Defaults to ID of token owner.
  # @option opts [String] :date yyyy-MM-dd. Defaults to today.
  # @option opts [Integer] :from From index
  # @option opts [Integer] :count Number of elements to return
  # @option opts [String] :sorting Sorting pattern
  # @option opts [String] :fields Fields filter pattern
  # @return [ListResponseActivity]
  describe 'get_for_time_sheet test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post
  # Add activity.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Activity] :body JSON representing the new object to be created. Should not have ID and version set.
  # @return [ResponseWrapperActivity]
  describe 'post test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_list
  # Add multiple activities.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Array<Activity>] :body JSON representing a list of new object to be created. Should not have ID and version set.
  # @return [ListResponseActivity]
  describe 'post_list test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for search
  # Find activities corresponding with sent data.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [String] :id List of IDs
  # @option opts [String] :name Containing
  # @option opts [String] :number Equals
  # @option opts [String] :description Containing
  # @option opts [BOOLEAN] :is_project_activity Equals
  # @option opts [BOOLEAN] :is_general Equals
  # @option opts [BOOLEAN] :is_chargeable Equals
  # @option opts [BOOLEAN] :is_task Equals
  # @option opts [BOOLEAN] :is_inactive Equals
  # @option opts [Integer] :from From index
  # @option opts [Integer] :count Number of elements to return
  # @option opts [String] :sorting Sorting pattern
  # @option opts [String] :fields Fields filter pattern
  # @return [ListResponseActivity]
  describe 'search test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
