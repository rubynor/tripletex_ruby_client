=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for TripletexRubyClient::LeaveOfAbsenceType
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'LeaveOfAbsenceType' do
  before do
    # run before each test
    @instance = TripletexRubyClient::LeaveOfAbsenceType.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of LeaveOfAbsenceType' do
    it 'should create an instance of LeaveOfAbsenceType' do
      expect(@instance).to be_instance_of(TripletexRubyClient::LeaveOfAbsenceType)
    end
  end
  describe 'test attribute "id"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "version"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "changes"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "url"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "leave_of_absence_type"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
      # validator = Petstore::EnumTest::EnumAttributeValidator.new('String', ["LEAVE_OF_ABSENCE", "FURLOUGH", "PARENTAL_BENEFITS", "MILITARY_SERVICE", "EDUCATIONAL", "COMPASSIONATE"])
      # validator.allowable_values.each do |value|
      #   expect { @instance.leave_of_absence_type = value }.not_to raise_error
      # end
    end
  end

  describe 'test attribute "name_no"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "code"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
