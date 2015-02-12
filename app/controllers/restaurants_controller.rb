class RestaurantsController < ApplicationController
  before_filter :ensure_logged_in

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
  	@reservation = @restaurant.reservations.build
  end
end