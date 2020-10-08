class Api::V1::FoodItemsController < ApplicationController

    before_action :find_user, only: [:show]

    def index
        food_items = FoodItem.all
        render json: food_items, except: [:created_at, :updated_at]
    end

    def show
        render json: @food_item, except: [:created_at, :updated_at]
    end

    # def update
    #     food_item = FoodItem.find_by(id: params[:id])
    #     # byebug
    #     food_item.update(food_item_params)
    #     render json:  food_item, except: [:created_at, :updated_at]
    # end

    # def create
    #     food_item = FoodItem.new(food_item_params)
    #     if movie.save
    #         render json: movie, except: [:created_at, :updated_at]
    #     else
    #         render json: 'User Not Saved'
    #     end
    # end

    # def destroy
    #     @movie.destroy
    #     render json: 'Movie Destroyed'
    # end


    # private

    def find_user
        @food_item = FoodItem.find_by(id: params[:id])
    end

    # def movie_params
    #     params.require(:movie).permit(:user_id, :title, :genre, :review, :image, :video_link, :movie_info, :likes, :dislikes)
    # end
    
    
end
