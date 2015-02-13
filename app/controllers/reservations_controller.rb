class ReservationsController < ApplicationController
before_filter :ensure_logged_in, :load_restaurant

  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to restaurants_path, notice: "Reservation successfully made!"
    else
      render 'restaurants/show'
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:time, :date, :party_size, :restaurant_id)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
