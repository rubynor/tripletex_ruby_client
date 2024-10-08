=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'

# Unit tests for TripletexRubyClient::LedgervoucherTypeApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'LedgervoucherTypeApi' do
  before do
    # run before each test
    @instance = TripletexRubyClient::LedgervoucherTypeApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of LedgervoucherTypeApi' do
    it 'should create an instance of LedgervoucherTypeApi' do
      expect(@instance).to be_instance_of(TripletexRubyClient::LedgervoucherTypeApi)
    end
  end

  # unit tests for get
  # Get voucher type by ID.
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [String] :fields Fields filter pattern
  # @return [ResponseWrapperVoucherType]
  describe 'get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for search
  # Find voucher types corresponding with sent data.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [String] :name Containing
  # @option opts [Integer] :from From index
  # @option opts [Integer] :count Number of elements to return
  # @option opts [String] :sorting Sorting pattern
  # @option opts [String] :fields Fields filter pattern
  # @return [ListResponseVoucherType]
  describe 'search test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
