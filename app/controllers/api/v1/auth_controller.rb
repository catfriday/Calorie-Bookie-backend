class Api::V1::AuthController < ApplicationController
    # skip_before_action :authorized, only: [:login]

# login
def login
    
    user = User.find_by(email: params[:email])
    # token = encode_token({user_id: user.id})
    if user && user.authenticate(params[:password]) #.authenticate method to check password using bcrypt gem
        # render json: user, except: [:created_at, :updated_at], include: [:daily_logs =>{except: [:created_at, :updated_at], include: [:food_items => {except: [:created_at, :updated_at]}], methods: [:calories]}]#, status: 200

        render json: { todays_calories: user.todays_calories, logged: user.logged, bet: user.bets, monthly_progress: user.logged, daily_logs: user.daily_logs, email: user.email, id: user.id, name: user.name, weight: user.weight, bank: user.bank, image: user.image, city: user.city, calories: user.calories, 
            token: encode_token({user_id: user.id})} #, status: 200

    else
        render json: {error: "invalid username or password"}
    end
end
end

# render json: user, except: [:created_at, :updated_at], include: [:daily_logs =>{except: [:created_at, :updated_at], include: [:food_items => {except: [:created_at, :updated_at]}], methods: [:calories]}], email: user.email, id: user.id, name: user.name, weight: user.weight, bank: user.bank, image: user.image, city: user.city, 
#             token: encode_token({user_id: user.id}) #, status: 200


# render json: {user: user, email: user.email, id: user.id, name: user.name, weight: user.weight, bank: user.bank, image: user.image, city: user.city, 
#             token: encode_token({user_id: user.id})} #, status: 200