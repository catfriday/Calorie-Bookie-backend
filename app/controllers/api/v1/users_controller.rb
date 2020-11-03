class Api::V1::UsersController < ApplicationController

    # skip_before_action :authorized, only: [:create]
 
  def profile
    render json: current_user, status: :accepted
  end
 
  def create
    #  byebug
    user = User.new(user_params)
    
    if user.valid?
      user.save
      render json: { bet: user.bets, monthly_progress: user.logged, daily_logs: user.daily_logs, email: user.email, id: user.id, name: user.name, weight: user.weight, bank: user.bank, image: user.image, city: user.city, calories: user.calories, 
            token: encode_token({user_id: user.id})} #, status: 200
    else
      render json: {error: "Failed to create a user"}, status: :not_acceptable
    end
  end

  def index
    users = User.all
    
    render json: users, except: [:created_at, :updated_at], include: [:daily_logs =>{except: [:created_at, :updated_at], include: [:food_items => {except: [:created_at, :updated_at]}], methods: [:calories, :daily_goal_reached]}]
  end

  def show 
    user = User.find_by(id: params[:id])
    render json: user,  methods:[:logged, :todays_calories], except: [:created_at, :updated_at], include: [:bets=>{except: [:created_at, :updated_at], methods: [:win_or_lose, :days_left] }, :daily_logs =>{except: [:created_at, :updated_at], include: [:food_items => {except: [:created_at, :updated_at]}], methods: [:calories, :daily_goal_reached]}]

    # render json: teachers, include: [:students => {include: [:student_assignments => {include: [:assignment]}]}]
  end

  def update
    
    user = User.find_by(id: params[:id])
    user.update(user_params)
    render json: user, except: [:created_at, :updated_at], include: [:daily_logs =>{except: [:created_at, :updated_at], include: [:food_items => {except: [:created_at, :updated_at]}]}]
end

  def daily_calories_goal
    user = User.find_by(id: params[:id])
    user.calories_goal(calories: params[:calories])
  end

  def show_daily_calories_goal

  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :weight, :bank, :image, :city, :calories)
  end

end
