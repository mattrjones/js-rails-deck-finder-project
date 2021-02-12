class DecksController < ApplicationController
    def index
        decks = Deck.all
        render json: decks, except: [:created_at, :updated_at]
    end

    def show
        deck = Deck.find_by(id: params[:id])
        if deck
            render json: decks, except: [:created_at, :updated_at]
        else
            render json: {message: "Deck not found."}
        end
    end
end
