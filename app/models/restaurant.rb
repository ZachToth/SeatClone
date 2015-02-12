class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations

  def new
  end

  def show
  end

  def create
  end

  def edit 
  end

  def destroy
  end

end
