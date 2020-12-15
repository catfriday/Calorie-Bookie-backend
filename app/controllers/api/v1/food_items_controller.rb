class Api::V1::FoodItemsController < ApplicationController

    before_action :find_user, only: [:show]

    def index
        food_items = FoodItem.all
        render json: food_items, except: [:created_at, :updated_at]
    end

    def show
        render json: @food_item, except: [:created_at, :updated_at]
    end

    def find_user
        @food_item = FoodItem.find_by(id: params[:id])
    end

    
    
    
end
