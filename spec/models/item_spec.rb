require 'spec_helper'

describe Item do
  before :each do
    @attr = {
      :vendor_sku => 'SB1'
    }
  end

  it 'should create a valid instance with valid attributes' do
    Item.new(@attr).should be_valid
  end

  describe 'properties' do
    it 'should respond to entered' do
      Item.new(@attr).should respond_to :entered
    end

  end

  describe 'methods' do
    before :each do
      @item = Item.create! @attr
    end

    it 'should respond to enter' do
      @item.should respond_to :enter
    end

    it 'should respond to entered?' do
      @item.should respond_to :entered?
    end

    describe 'entered?' do
      it 'should be false by default' do
        @item.entered?.should be_false
      end
    end
  end

  describe 'scopes' do
    it 'should have a by_property scope' do
      Item.should respond_to :by_property
    end
  end
end
