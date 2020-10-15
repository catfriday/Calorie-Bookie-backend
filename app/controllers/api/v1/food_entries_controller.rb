class Api::V1::FoodEntriesController < ApplicationController

    def index
        food_entries = FoodEntry.all
        render json: food_entry
    end

    def show 
        food_entry = FoodEntry.find_by(params[:id])
        render json: food_entry
    end

    def create 
        food_entry = FoodEntry.new(daily_log_id: params[:daily_log_id], food_item_id: params[:food_item_id])
        food_entry.save
        render json: food_entry
    end

   def delete
        daily_log = DailyLog.find_by(id: params[:daily_log_id])
        food_entry = FoodEntry.find_by(food_item_id: params[:food_item_id], daily_log_id: params[:daily_log_id])
        food_entry.destroy
        render json: daily_log, except: [:created_at, :updated_at], include: [:food_items => {except: [:created_at, :updated_at]}], methods: [:calories]
    end
   
end
