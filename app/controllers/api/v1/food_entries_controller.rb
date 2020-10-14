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
        
        food_entry = FoodEntry.find_by(food_item_id: params[:food_item_id], daily_log_id: params[:daily_log_id])
        food_entry.destroy
        render json: "FoodEntry Has been Destroyed"
    end
   
end
