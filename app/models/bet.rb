class Bet < ApplicationRecord
    belongs_to :user




   def win_or_lose
        user = User.find_by(id: bet.user_id)
        if user.daily_logs.last = Date.today + 1 && user.logged >= 0.90
            return "you won"
        elsif user.daily_logs.last = Date.today + 1 && user.logged <= 0.90
            return "you lost"
        else return "still in the game"

    end
   end
end
