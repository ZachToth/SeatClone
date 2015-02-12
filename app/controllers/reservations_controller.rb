class ReservationsController < ApplicationController
before_filter :ensure_logged_in

  def create
      @reservation = @restaurant.reservation.build(reservation_params)
      @reservation.user = current_user

      if @reservation.save
        redirect_to restaurants_path
      else
        redirect_to restaurants_path
      end
  end

  def reservation_params
    reservation_params.require(:reservation).permit(:time, :date, :party_size)
  end
end
