class Api::V1::DailyLogsController < ApplicationController

    def index
        daily_logs = DailyLog.all
        render json: daily_logs, only: [:id, :user_id, :date, :day_number]
    end

    def show
        daily_log = DailyLog.find_by(id: params[:id])
        render json: daily_log, except: [:created_at, :updated_at], include: [:food_items => {except: [:created_at, :updated_at]}]

        # [:food_items => {except: [:created_at, :updated_at]}]
    end

    def update
        daily_log = DailyLog.find_by(id: params[:id])
        # byebug
        daily_log.update(daily_log_params)
        render json: daily_log, except: [:created_at, :updated_at], include: [:food_items => {except: [:created_at, :updated_at]}]
    end

    def food_entry
       daily_log = DailyLog.find_by_or_create_by(user_id: params[:user_id], date: params[:date], day_number: params[:day_number])
       daily_log.food_items << FoodItem.find_or_create_by(category: params[:category], food_name: params[:food_name], calories: params[:calories], serving_qty: params[:serving_qty], serving_unit: params[:serving_unit])
       render json: daily_log, except: [:created_at, :updated_at], include: [:food_items]
       #^^^^might need to go in seperate controller
    end

    private

    def daily_log_params
        params.require(daily_log).permit(:user_id, :date, :day_number)
    end

end


# day.food_items << FoodItem.find_by(id: 3)
# day.food_items << FoodItem.find_or_create_by(category: 'breakfast', food_name: 'grits', calories: 100, serving_qty: 2, serving_unit: 'oz')
# render json: user, only: [:id, :username], include:[:movies], methods: [:posted_movies, :watchlist]