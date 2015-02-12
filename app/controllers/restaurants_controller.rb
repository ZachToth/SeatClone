class RestaurantsController < ApplicationController
  before_filter :ensure_logged_in

  def index
    @restaurants = Restaurant.all
  end

  def results
    @restaurants = Restaurant.all
  end

  def show
  	@restaurant = Restaurant.find(params[:id])
  	@reservation = @restaurant.reservations.build
  end
end