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

    def daily_goal_reached
        user = self.user 
        if self.calories == 0
            return "no entry"

        elsif user.calories <= self.calories
            return "no"
            

        elsif user.calories > self.calories
            return "yes"
         end
    end

    
end

# 30.days.from_now

# start_date = Date.parse('date start')
# end_date = Date.parse('date end')
# (start..endd).to_a
# Date.today() + 30