class FoodItem < ApplicationRecord
    has_many :food_entries
    has_many :daily_logs, through: :food_entries 
end
