class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user


  #Runs the over_capacity method, and potentially adds 
  #to @reservation.errors, blocking @reservation.save
  validate :has_availablility

  def has_availablility
    unless restaurant.available?(date, time, party_size)
      errors.add(:base, "The restaurant is not available at that time.")
    end
  end

end
