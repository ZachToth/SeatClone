class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def results
  end

  def show
  	@restaurant = Restaurant.find(params[:id])
  	@reservation = @restaurant.reservations.build
  end
end