require 'spec_helper'

describe Item do
  before :each do
    @attr = {
    }
  end

  describe 'scopes' do
    it 'should have a by_property scope' do
      Item.new(@attr).should respond_to :by_property
    end
  end
end
