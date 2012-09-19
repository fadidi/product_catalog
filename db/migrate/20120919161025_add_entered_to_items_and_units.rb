class AddEnteredToItemsAndUnits < ActiveRecord::Migration
  def change
    add_column :items, :entered, :datetime
    add_column :units, :entered, :datetime
  end
end
