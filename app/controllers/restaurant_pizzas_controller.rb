class RestaurantPizzasController < ApplicationController

    # POST /restaurant_pizzas
    def create
        restaurant_pizzas = RestaurantPizza.create(params.permit(:price, :pizza_id, :restaurant_id))
        if restaurant_pizzas.valid?
            render json: restaurant_pizzas.pizza, status: :created
        else
            render json: {"errors": ["validation errors"]}, status: :unprocessable_entity
        end
    end

end
