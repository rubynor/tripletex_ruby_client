=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for TripletexRubyClient::MessageBodyWorkers
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'MessageBodyWorkers' do
  before do
    # run before each test
    @instance = TripletexRubyClient::MessageBodyWorkers.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of MessageBodyWorkers' do
    it 'should create an instance of MessageBodyWorkers' do
      expect(@instance).to be_instance_of(TripletexRubyClient::MessageBodyWorkers)
    end
  end
end
