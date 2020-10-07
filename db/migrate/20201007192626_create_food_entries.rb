class CreateFoodEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :food_entries do |t|
      t.integer :daily_log_id
      t.integer :food_item_id
      t.timestamps
    end
  end
end
