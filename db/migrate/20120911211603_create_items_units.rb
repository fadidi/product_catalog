class CreateItemsUnits < ActiveRecord::Migration
  def self.up
    create_table :items_units, :id => false do |t|
      t.references :item, :unit
    end
  end
 
  def self.down
    drop_table :items_units
  end
end 
