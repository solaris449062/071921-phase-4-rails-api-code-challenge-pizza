class PizzasController < ApplicationController

    # GET /pizzas
    def index
        pizzas = Pizza.all
        render json: pizzas
    end

end
