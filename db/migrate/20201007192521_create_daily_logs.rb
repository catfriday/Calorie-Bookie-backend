class CreateDailyLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_logs do |t|
      t.integer :user_id
      t.date :date
      t.string :day_number
      t.timestamps
    end
  end
end
