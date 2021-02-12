class FavoritesController < ApplicationController
    def new
        favorite = Favorite.new
    end

    def create
        favorite = Favorite.new(favorite_params)
        # current_user.favorite.build(favorite_params)
        if favorite.save
            render json: favorite, except: [:created_at, :updated_at]
        else
            render json: {message: "Favorite Failed"}
        end
    end

    def index
        user_id = params[:user_id]
        user = User.find(user_id)
        favorites = user.favorites
        render json: favorites, include: [:deck]
    end

    def destroy
        fav_id = params[:id]
        favorite = Favorite.find(fav_id)
        favorite.destroy
    end


private
    def favorite_params
      params.require(:favorite).permit(:user_id, :deck_id)
    end
end
