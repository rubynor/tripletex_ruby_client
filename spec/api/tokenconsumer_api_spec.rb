=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'

# Unit tests for TripletexRubyClient::TokenconsumerApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'TokenconsumerApi' do
  before do
    # run before each test
    @instance = TripletexRubyClient::TokenconsumerApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of TokenconsumerApi' do
    it 'should create an instance of TokenconsumerApi' do
      expect(@instance).to be_instance_of(TripletexRubyClient::TokenconsumerApi)
    end
  end

  # unit tests for get_by_token
  # Get consumer token by token string.
  # 
  # @param token Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [String] :fields Fields filter pattern
  # @return [ResponseWrapperConsumerToken]
  describe 'get_by_token test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
