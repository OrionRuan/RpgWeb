class StaticController < ApplicationController
    def home
        render json: {status: "Está funcionando"}
    end
end