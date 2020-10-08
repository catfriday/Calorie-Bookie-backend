class User < ApplicationRecord
    has_secure_password

    has_many :daily_logs
    has_many :food_entries, through: :daily_logs 
    has_many :bets

    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :name, presence: true
    # validates :weight, allow_blank: true
    

    # def per_day(date)
    #     # date = [:month_day_comma_year] = "%B %e, %Y"
    #     # date.strftime("%m/%d/%Y") 
    #     self.daily_logs.select do |log|
    #         log.date == date
    #     end
    #  end

     def log_per_day(day_number)
        array = self.daily_logs.select do |log|
            log.day_number == day_number
        end
        array.first.food_items
     end

     def calories_per_day(day_number)
        array = self.daily_logs.select do |log|
            log.day_number == day_number
        end
        calories = array.first.food_items.map do |item|
            item.calories   
        end
        calories.sum
     end
    

end
