class ApplicationController < ActionController::Base
    require 'roulettegame'
    protect_from_forgery

    def index
        flash.notice = 'No se encontró la página'
        redirect_to root_path
    end
end
