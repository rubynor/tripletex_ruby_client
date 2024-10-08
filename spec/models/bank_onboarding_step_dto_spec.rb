=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for TripletexRubyClient::BankOnboardingStepDTO
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'BankOnboardingStepDTO' do
  before do
    # run before each test
    @instance = TripletexRubyClient::BankOnboardingStepDTO.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of BankOnboardingStepDTO' do
    it 'should create an instance of BankOnboardingStepDTO' do
      expect(@instance).to be_instance_of(TripletexRubyClient::BankOnboardingStepDTO)
    end
  end
  describe 'test attribute "id"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "state"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
      # validator = Petstore::EnumTest::EnumAttributeValidator.new('String', ["INCOMPLETE", "COMPLETED", "PROCESSING"])
      # validator.allowable_values.each do |value|
      #   expect { @instance.state = value }.not_to raise_error
      # end
    end
  end

  describe 'test attribute "accessible"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
