class CreateItemsUnits < ActiveRecord::Migration
  def self.up
    create_table :items_units, :id => false do |t|
      t.references :item, :unit
    end

    add_index :items_units, [:item_id, :unit_id], :unique => true
  end
 
  def self.down
    drop_table :items_units
  end
end 
