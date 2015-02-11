class User < ActiveRecord::Base
  has_many :reservations
  has_many :restuarants, through: :reservations
end
