class User < ApplicationRecord
    has_secure_password

    has_many :daily_logs
    has_many :food_entries, through: :daily_logs 
    has_many :bets

    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :name, presence: true
    # validates :weight, allow_blank: true
    
end
