class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def search
    @restaurants = Restaurant.all

    query = "%#{params[:query].downcase}%"
    location = "%#{params[:location].downcase}%"

    @results = [] 
    @results += @restaurants.where(["name like ?", query])
    @results += @restaurants.where(["cuisine like ?", query])

    if location
      location_results = []
      location_results += @restaurants.where(["location like ?", location])
      query_results = @results
      @results = location_results & query_results
    end
  end

  def show
  	@restaurant = Restaurant.find(params[:id])
  	if current_user
      @reservation = @restaurant.reservations.build
    end
  end
end