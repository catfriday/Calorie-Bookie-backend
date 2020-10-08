class FoodEntry < ApplicationRecord
    belongs_to :daily_log
    belongs_to :food_item
end
