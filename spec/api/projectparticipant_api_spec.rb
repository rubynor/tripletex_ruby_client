=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'

# Unit tests for TripletexRubyClient::ProjectparticipantApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'ProjectparticipantApi' do
  before do
    # run before each test
    @instance = TripletexRubyClient::ProjectparticipantApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ProjectparticipantApi' do
    it 'should create an instance of ProjectparticipantApi' do
      expect(@instance).to be_instance_of(TripletexRubyClient::ProjectparticipantApi)
    end
  end

  # unit tests for delete_by_ids
  # [BETA] Delete project participants.
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
  # [BETA] Find project participant by ID.
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [String] :fields Fields filter pattern
  # @return [ResponseWrapperProjectParticipant]
  describe 'get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post
  # [BETA] Add new project participant.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [ProjectParticipant] :body JSON representing the new object to be created. Should not have ID and version set.
  # @return [ResponseWrapperProjectParticipant]
  describe 'post test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_list
  # [BETA] Add new project participant. Multiple project participants can be sent in the same request.
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Array<ProjectParticipant>] :body JSON representing a list of new object to be created. Should not have ID and version set.
  # @return [ListResponseProjectParticipant]
  describe 'post_list test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for put
  # [BETA] Update project participant.
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [ProjectParticipant] :body Partial object describing what should be updated
  # @return [ResponseWrapperProjectParticipant]
  describe 'put test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
