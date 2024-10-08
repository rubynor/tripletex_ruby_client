=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'

# Unit tests for TripletexRubyClient::DivisionApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'DivisionApi' do
  before do
    # run before each test
    @instance = TripletexRubyClient::DivisionApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of DivisionApi' do
    it 'should create an instance of DivisionApi' do
      expect(@instance).to be_instance_of(TripletexRubyClient::DivisionApi)
    end
  end

  # unit tests for post
  # [BETA] Create division.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Division] :body JSON representing the new object to be created. Should not have ID and version set.
  # @return [ResponseWrapperDivision]
  describe 'post test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_list
  # [BETA] Create divisions.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Array<Division>] :body JSON representing a list of new object to be created. Should not have ID and version set.
  # @return [ListResponseDivision]
  describe 'post_list test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for put
  # [BETA] Update division information.
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [Division] :body Partial object describing what should be updated
  # @return [ResponseWrapperDivision]
  describe 'put test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for put_list
  # [BETA] Update multiple divisions.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Array<Division>] :body JSON representing updates to object. Should have ID and version set.
  # @return [ListResponseDivision]
  describe 'put_list test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for search
  # [BETA] Get divisions.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :from From index
  # @option opts [Integer] :count Number of elements to return
  # @option opts [String] :sorting Sorting pattern
  # @option opts [String] :fields Fields filter pattern
  # @return [ListResponseDivision]
  describe 'search test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
