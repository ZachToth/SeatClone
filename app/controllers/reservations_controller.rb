class ReservationsController < ApplicationController
before_filter :ensure_logged_in, :load_restaurant

  def create
    # bindings.pry
    unless over_capacity
      @reservation = @restaurant.reservations.build(reservation_params)
      @reservation.user = current_user

      if @reservation.save
        redirect_to restaurants_path, notice: "Reservation successfully made!"
      else
        render 'restaurants/show'
      end
    else
      redirect_to restaurant_path(@restaurant), notice: "Not enough seats available!"
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:time, :date, :party_size, :restaurant_id)
  end

  # Check to see if the restaurant would go over capacity with the current reservation
  def over_capacity
    date = params[:reservation][:date]
    time = params[:reservation][:time].to_i
    party_size = params[:reservation][:party_size].to_i
    reservations = @restaurant.reservations.where("date = ? AND time = ?", date, time)
    # bindings.pry
    seats_taken = 0
    reservations.each do |reservation|
      seats_taken += reservation.party_size.to_i
    end
    bindings.pry
    @restaurant.capacity < seats_taken + party_size
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
