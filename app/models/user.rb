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

    #  def log_per_day(day_number)
    #     array = self.daily_logs.select do |log|
    #         log.day_number == day_number
    #     end
    #     array.first.food_items
    #  end

    #  def calories_per_day(day_number)
    #     array = self.daily_logs.select do |log|
    #         log.day_number == day_number
    #     end
    #     calories = array.first.food_items.map do |item|
    #         item.calories   
    #     end
    #     calories.sum
    #  end
    

    def thirty 
        now = Date.today
        end_date = Date.today + 30
        dates = (now...end_date).to_a
        create_log(dates)     
    end

     def create_log(array)
        i = 0 
        array.each {|date| DailyLog.create(user_id: self.id, date: date, day_number: "day #{i += 1}")}
        # array.each do |date|
        #     DailyLog.create(user_id: self.id, date: date, day_number: "day #{i}")
        #     i ++ 
        # end
     end

    
    #  5.times { |i| puts i }
end
