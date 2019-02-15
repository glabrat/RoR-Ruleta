class RoulettesController < ApplicationController
    def index
    end

    def show
        @roulette = Roulette.find(params[:id])
    end
end
