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

    # def thirty(user_id)
    #     now = Date.today
    #     end_date = Date.today + 30
    #     dates = (now...end_date).to_a
    #     i = 1  
    #     dates.each do |date|
            
    #         self.create(user_id: user_id, date: date, day_number: "day #{i}")
    #         i ++ 

    #     end

    # end

end

# 30.days.from_now

# start_date = Date.parse('date start')
# end_date = Date.parse('date end')
# (start..endd).to_a
# Date.today() + 30