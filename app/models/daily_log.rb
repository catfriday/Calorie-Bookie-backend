class DailyLog < ApplicationRecord

    belongs_to :user
    has_many :food_entries
    has_many :food_items, through: :food_entries

    validates :day_number, presence: true

    def calories
      total =  self.food_items.map do |item|
            item.calories
        end
        total.sum
    end
end
