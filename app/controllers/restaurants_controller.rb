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
    @reservation = @restaurant.reservations.build

    @available_slots = @restaurant.opening_hour..@restaurant.closing_hour.map do |hour|
      @restaurant.is_available(date_time, party_size)
    end

  end
end