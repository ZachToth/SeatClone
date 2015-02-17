class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def search
    @restaurants = Restaurant.all

    query = "%#{params[:query].downcase}%"

    @results = [] 
    @results += @restaurants.where(["name like ?", query])
    @results += @restaurants.where(["cuisine like ?", query])
  end

  def show
  	@restaurant = Restaurant.find(params[:id])
  	# if current_user
      @reservation = @restaurant.reservations.build
  end
end