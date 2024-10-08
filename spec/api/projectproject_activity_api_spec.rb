=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'

# Unit tests for TripletexRubyClient::ProjectprojectActivityApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'ProjectprojectActivityApi' do
  before do
    # run before each test
    @instance = TripletexRubyClient::ProjectprojectActivityApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ProjectprojectActivityApi' do
    it 'should create an instance of ProjectprojectActivityApi' do
      expect(@instance).to be_instance_of(TripletexRubyClient::ProjectprojectActivityApi)
    end
  end

  # unit tests for delete
  # Delete project activity
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
  # Delete project activities
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
  # Find project activity by id
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [String] :fields Fields filter pattern
  # @return [ResponseWrapperProjectActivity]
  describe 'get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post
  # Add project activity.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [ProjectActivity] :body JSON representing the new object to be created. Should not have ID and version set.
  # @return [ResponseWrapperProjectActivity]
  describe 'post test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
