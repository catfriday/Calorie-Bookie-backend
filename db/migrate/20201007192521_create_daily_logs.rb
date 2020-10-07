class CreateDailyLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_logs do |t|
      t.date :date
      t.string :day_number
      t.integer :user_id
      t.timestamps
    end
  end
end
