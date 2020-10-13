class Api::V1::DailyLogsController < ApplicationController

    def index
        daily_logs = DailyLog.all
        render json: daily_logs, only: [:id, :user_id, :date, :day_number], methods: [:calories]
    end

    def show
        daily_log = DailyLog.find_by(id: params[:id])
        render json: daily_log, except: [:created_at, :updated_at], include: [:food_items => {except: [:created_at, :updated_at]}], methods: [:calories]

        # [:food_items => {except: [:created_at, :updated_at]}]
    end

    def create_thirty 
        user = User.find_by(id: params[:id])
        user.thirty
        # daily_log = DailyLog.find_or_create_by(daily_log_params)
        # daily_log.save
        render json: user.daily_logs, except: [:created_at, :updated_at], include: [:food_items => {except: [:created_at, :updated_at]}], methods: [:calories]
    end

    def create 
        # user = User.find_by(id: params[:id])
        # user.thirty
        daily_log = DailyLog.find_by(daily_log_params)
        daily_log.save
        render json: user.daily_logs, except: [:created_at, :updated_at], include: [:food_items => {except: [:created_at, :updated_at]}], methods: [:calories]
    end

    def update
        daily_log = DailyLog.find_by(id: params[:id])
        daily_log.update(daily_log_params)
        render json: daily_log, except: [:created_at, :updated_at], include: [:food_items => {except: [:created_at, :updated_at]}], methods: [:calories]
    end

    def enter_food
       daily_log = DailyLog.find_by(id: params[:id])
       daily_log.food_items << FoodItem.find_or_create_by(category: params[:category], food_name: params[:food_name], calories: params[:calories], serving_qty: params[:serving_qty], serving_unit: params[:serving_unit])
       render json: daily_log, except: [:created_at, :updated_at], include: [:food_items] , methods: [:calories]
       #^^^^might need to go in seperate controller 
    end

    def destroy
        daily_log = DailyLog.find_by(id: params[:id])
        daily_log.destroy
        render json: "FoodEntry Has been Destroyed"
    end
       

    private

    def daily_log_params
        params.require(:daily_log).permit(:user_id, :date, :day_number)
    end

end


# day.food_items << FoodItem.find_by(id: 3)
# day.food_items << FoodItem.find_or_create_by(category: 'breakfast', food_name: 'grits', calories: 100, serving_qty: 2, serving_unit: 'oz')
# render json: user, only: [:id, :username], include:[:movies], methods: [:posted_movies, :watchlist]

