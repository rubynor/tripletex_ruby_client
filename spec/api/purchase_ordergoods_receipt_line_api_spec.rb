=begin
#Tripletex API



OpenAPI spec version: 2.69.5

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.24

=end

require 'spec_helper'
require 'json'

# Unit tests for TripletexRubyClient::PurchaseOrdergoodsReceiptLineApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'PurchaseOrdergoodsReceiptLineApi' do
  before do
    # run before each test
    @instance = TripletexRubyClient::PurchaseOrdergoodsReceiptLineApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of PurchaseOrdergoodsReceiptLineApi' do
    it 'should create an instance of PurchaseOrdergoodsReceiptLineApi' do
      expect(@instance).to be_instance_of(TripletexRubyClient::PurchaseOrdergoodsReceiptLineApi)
    end
  end

  # unit tests for delete
  # [BETA] Delete goods receipt line by ID. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_list
  # [BETA] Delete goods receipt lines by ID. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Array<GoodsReceiptLine>] :body JSON representing objects to delete. Should have ID and version set.
  # @return [nil]
  describe 'delete_list test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get
  # [BETA] Get goods receipt line by purchase order line ID. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
  # 
  # @param id Element ID
  # @param [Hash] opts the optional parameters
  # @option opts [String] :fields Fields filter pattern
  # @return [ResponseWrapperGoodsReceiptLine]
  describe 'get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post
  # [BETA] Register new goods receipt; new product on an existing purchase order. When registration of several goods receipt, use /list for better performance. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [GoodsReceiptLine] :body JSON representing the new object to be created. Should not have ID and version set.
  # @return [ResponseWrapperGoodsReceiptLine]
  describe 'post test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_list
  # [BETA] Register multiple new goods receipt on an existing purchase order. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Array<GoodsReceiptLine>] :body JSON representing a list of new object to be created. Should not have ID and version set.
  # @return [ListResponseGoodsReceiptLine]
  describe 'post_list test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for put
  # [BETA] Update a goods receipt line on a goods receipt. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
  # 
  # @param id Goods receipt Line ID
  # @param [Hash] opts the optional parameters
  # @option opts [GoodsReceiptLine] :body Partial object describing what should be updated
  # @return [ResponseWrapperGoodsReceiptLine]
  describe 'put test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for put_list
  # [BETA] Update goods receipt lines on a goods receipt. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
  # 
  # @param [Hash] opts the optional parameters
  # @option opts [Array<GoodsReceiptLine>] :body JSON representing updates to object. Should have ID and version set.
  # @return [ListResponseGoodsReceiptLine]
  describe 'put_list test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for search
  # [BETA] Find goods receipt lines for purchase order. Only available for users that have activated the Logistics Plus Beta-program in &#39;Our customer account&#39;
  # 
  # @param purchase_order_id Equals
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :from From index
  # @option opts [Integer] :count Number of elements to return
  # @option opts [String] :sorting Sorting pattern
  # @option opts [String] :fields Fields filter pattern
  # @return [ListResponseGoodsReceiptLine]
  describe 'search test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
