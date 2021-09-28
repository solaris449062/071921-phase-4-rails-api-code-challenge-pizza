class RestaurantsController < ApplicationController

    # GET /restaurants
    def index
        restaurants = Restaurant.all
        render json: restaurants
    end

    # GET /restaurants/:id
    def show
        restaurant = Restaurant.find_by(id: params[:id])
        if restaurant
            render json: restaurant, include: :pizzas
        else
            render json: {error: "Restaurant not found"}, status: :not_found
        end
    end

    # DELETE /restaurants/:id
    def destroy
        restaurant = Restaurant.find_by(id: params[:id])
        if restaurant
            restaurant.destroy
            head :no_content
        else
            render json: {error: "Restaurant not found"}, status: :not_found
        end
    end

end
