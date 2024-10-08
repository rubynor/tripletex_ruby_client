=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'

# Unit tests for TripletexRubyClient::EventApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'EventApi' do
  before do
    # run before each test
    @instance = TripletexRubyClient::EventApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of EventApi' do
    it 'should create an instance of EventApi' do
      expect(@instance).to be_instance_of(TripletexRubyClient::EventApi)
    end
  end

  # unit tests for example
  # [BETA] Get example webhook payload
  # 
  # @param event_type Event type, from /event endpoint
  # @param [Hash] opts the optional parameters
  # @option opts [String] :fields Fields filter pattern
  # @return [ResponseWrapperEventInfoDTO]
  describe 'example test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get
  # [BETA] Get all (WebHook) event keys.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [String] :fields Fields filter pattern
  # @return [ResponseWrapperMapStringEventInfoDescription]
  describe 'get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
