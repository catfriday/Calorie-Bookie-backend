class Api::V1::BetsController < ApplicationController

    def index
        bets = Bet.all
        render json: bets, except: [:created_at, :updated_at], methods: [:win_or_lose, :reserve, :days_left]
    end

    def show
        bet = Bet.find_by(id: params[:id])
        render json: bet, except: [:created_at, :updated_at], methods: [:win_or_lose, :reserve, :days_left]
    end

    def create
        user = User.find_by(id: params[:user_id])
        bet = Bet.new(user_id: params[:user_id], amount: params[:amount])
        if bet.save
            render json: user.bets, except: [:created_at, :updated_at], methods: [:win_or_lose, :reserve, :days_left]
        else
             render json: 'User Not Saved'
        end
    end

end
