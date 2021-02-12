class GiftsController < ApplicationController
    def index
        gifts = Gift.all
        render json: gifts, except: [:created_at, :updated_at]
    end

    def show
        gift = Gift.find_by(id: params[:id])
        if gift
            render json: gifts, except: [:created_at, :updated_at]
        else
            render json: {message: "Gift not found."}
        end
    end
end
