require 'spec_helper'

describe Unit do
  before :each do
    @attr = {
      :product_id => 1
    }
  end

  it 'should create a valid instance with valid attributes' do
    Unit.new(@attr).should be_valid
  end

  describe 'properties' do
    it 'should respond to entered' do
      Unit.new(@attr).should respond_to :entered
    end

    it 'should respond to store_sku' do
      Unit.new(@attr).should respond_to :store_sku
    end
  end

  describe 'methods' do
    before :each do
      @unit = Unit.create! @attr
    end

    it 'should respond to pieces' do
      @unit.should respond_to :pieces
    end

    it 'should respond to enter' do
      @unit.should respond_to :enter
    end

    it 'should respond to entered?' do
      @unit.should respond_to :entered?
    end

    describe 'entered?' do
      it 'should be false by default' do
        @unit.entered?.should be_false
      end
    end
  end
end
