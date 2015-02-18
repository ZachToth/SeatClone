class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations

  def available?(date, time, party_size)
    # Select reservations on the same date and time
    existing_reservations = reservations.where(date: date, time: time)

    seats_taken = existing_reservations.inject(0) do |sum, res| 
      sum + res.party_size.to_i
    end

    capacity > seats_taken + party_size.to_i
  end

end
