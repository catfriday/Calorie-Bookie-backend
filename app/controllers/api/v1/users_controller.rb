class Api::V1::UsersController < ApplicationController

    skip_before_action :authorized, only: [:create]
 
  def profile
    render json: current_user, status: :accepted
  end
 
  def create
    # byebug
    user = User.new(user_params)

    if user.valid?
      user.save
      render json: {user: user}, status: :created
    else
      render json: {error: "Failed to create a user"}, status: :not_acceptable
    end
  end

  private
  def user_params
    params.permit(:username, :password)
  end

end
