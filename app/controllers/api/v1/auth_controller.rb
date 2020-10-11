class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:login]

# login
def login
    
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password]) #.authenticate method to check password using bcrypt gem
        render json: {user: user, email: user.email, id: user.id, name: user.name, token: encode_token({user_id: user.id})} #, status: 200
    else
        render json: {error: "invalid username or password"}
    end
end
end


