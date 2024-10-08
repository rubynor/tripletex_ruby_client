=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'

# Unit tests for TripletexRubyClient::TravelExpenseperDiemCompensationApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'TravelExpenseperDiemCompensationApi' do
  before do
    # run before each test
    @instance = TripletexRubyClient::TravelExpenseperDiemCompensationApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of TravelExpenseperDiemCompensationApi' do
    it 'should create an instance of TravelExpenseperDiemCompensationApi' do
      expect(@instance).to be_instance_of(TripletexRubyClient::TravelExpenseperDiemCompensationApi)
    end
  end

  # unit tests for delete
  # [BETA] Delete per diem compensation.
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
  # [BETA] Get per diem compensation by ID.
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [String] :fields Fields filter pattern
  # @return [ResponseWrapperPerDiemCompensation]
  describe 'get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post
  # [BETA] Create per diem compensation.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [PerDiemCompensation] :body JSON representing the new object to be created. Should not have ID and version set.
  # @return [ResponseWrapperPerDiemCompensation]
  describe 'post test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for put
  # [BETA] Update per diem compensation.
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [PerDiemCompensation] :body Partial object describing what should be updated
  # @return [ResponseWrapperPerDiemCompensation]
  describe 'put test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for search
  # [BETA] Find per diem compensations corresponding with sent data.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [String] :travel_expense_id Equals
  # @option opts [String] :rate_type_id Equals
  # @option opts [String] :rate_category_id Equals
  # @option opts [String] :overnight_accommodation Equals
  # @option opts [Integer] :count_from From and including
  # @option opts [Integer] :count_to To and excluding
  # @option opts [String] :rate_from From and including
  # @option opts [String] :rate_to To and excluding
  # @option opts [String] :amount_from From and including
  # @option opts [String] :amount_to To and excluding
  # @option opts [String] :location Containing
  # @option opts [String] :address Containing
  # @option opts [BOOLEAN] :is_deduction_for_breakfast Equals
  # @option opts [BOOLEAN] :is_lunch_deduction Equals
  # @option opts [BOOLEAN] :is_dinner_deduction Equals
  # @option opts [Integer] :from From index
  # @option opts [Integer] :count Number of elements to return
  # @option opts [String] :sorting Sorting pattern
  # @option opts [String] :fields Fields filter pattern
  # @return [ListResponsePerDiemCompensation]
  describe 'search test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
