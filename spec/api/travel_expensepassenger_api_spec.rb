=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'

# Unit tests for TripletexRubyClient::TravelExpensepassengerApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'TravelExpensepassengerApi' do
  before do
    # run before each test
    @instance = TripletexRubyClient::TravelExpensepassengerApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of TravelExpensepassengerApi' do
    it 'should create an instance of TravelExpensepassengerApi' do
      expect(@instance).to be_instance_of(TripletexRubyClient::TravelExpensepassengerApi)
    end
  end

  # unit tests for delete
  # [BETA] Delete passenger.
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
  # [BETA] Get passenger by ID.
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [String] :fields Fields filter pattern
  # @return [ResponseWrapperPassenger]
  describe 'get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post
  # [BETA] Create passenger.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Passenger] :body JSON representing the new object to be created. Should not have ID and version set.
  # @return [ResponseWrapperPassenger]
  describe 'post test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for put
  # [BETA] Update passenger.
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [Passenger] :body Partial object describing what should be updated
  # @return [ResponseWrapperPassenger]
  describe 'put test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for search
  # [BETA] Find passengers corresponding with sent data.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [String] :mileage_allowance Equals
  # @option opts [String] :name Containing
  # @option opts [Integer] :from From index
  # @option opts [Integer] :count Number of elements to return
  # @option opts [String] :sorting Sorting pattern
  # @option opts [String] :fields Fields filter pattern
  # @return [ListResponsePassenger]
  describe 'search test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
