class Bet < ApplicationRecord
    belongs_to :user

   def win_or_lose
        user = User.find_by(id: self.user_id)
        if user.entries_percentage >= 0.90 && user.daily_logs.last.date == Date.yesterday && user.logged >= 0.90
            return "You won!"

        elsif user.daily_logs.last.date == Date.yesterday && user.logged < 0.90
            return "You lost!"

        elsif user.entries_percentage < 0.90 && user.daily_logs.last.date == Date.yesterday && user.logged >= 0.90
               return "Sorry, not enough entries made durring your 30 day log to win. You forfieted the game"
        else return "Still in the game!"
    end
   end

   def reserve
    self.amount * 0.20
   end

   def days_left
        user = User.find_by(id: self.user_id)
        last_date = user.daily_logs.last.date
        days = (last_date - Date.today).to_i
        if days < 0
            return 0
        else
            return days 
        end
   end
end
