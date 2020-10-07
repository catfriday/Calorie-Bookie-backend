class CreateFoodItems < ActiveRecord::Migration[6.0]
  def change
    create_table :food_items do |t|
      t.string :category
      t.string :food_name
      t.integer :calories
      t.integer :serving_qty
      t.string :serving_unit
      t.timestamps
    end
  end
end
