class Api::V1::DailyLogsController < ApplicationController

    def food_entry
       daily_log = DailyLog.find_by_or_create_by(user_id: params[:user_id], date: params[:date], day_number: params[:day_number])
       daily_log.food_items << FoodItem.find_or_create_by(category: params[:category], food_name: params[:food_name], calories: params[:calories], serving_qty: params[:serving_qty], serving_unit: params[:serving_unit])
       #^^^^might need to go in seperate controller
    end
end


# day.food_items << FoodItem.find_by(id: 3)
# day.food_items << FoodItem.find_or_create_by(category: 'breakfast', food_name: 'grits', calories: 100, serving_qty: 2, serving_unit: 'oz')