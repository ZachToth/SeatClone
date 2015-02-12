class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true
  
  has_many :reservations
  has_many :restaurants, through: :reservations
end
