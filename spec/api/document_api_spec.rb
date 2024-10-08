=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'

# Unit tests for TripletexRubyClient::DocumentApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'DocumentApi' do
  before do
    # run before each test
    @instance = TripletexRubyClient::DocumentApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of DocumentApi' do
    it 'should create an instance of DocumentApi' do
      expect(@instance).to be_instance_of(TripletexRubyClient::DocumentApi)
    end
  end

  # unit tests for download_content
  # [BETA] Get content of document given by ID.
  # 
  # @param id ID of document to download content from.
  # @param [Hash] opts the optional parameters
  # @return [String]
  describe 'download_content test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get
  # [BETA] Get document by ID.
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [String] :fields Fields filter pattern
  # @return [ResponseWrapperDocument]
  describe 'get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
