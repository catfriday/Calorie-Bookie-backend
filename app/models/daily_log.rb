class DailyLog < ApplicationRecord

    belongs_to :user
    has_many :food_entries
    has_many :food_items, through: :food_entries

    validates :day_number, presence: true
end
