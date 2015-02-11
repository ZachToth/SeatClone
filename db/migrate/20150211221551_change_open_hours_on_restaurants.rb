class ChangeOpenHoursOnRestaurants < ActiveRecord::Migration
  def change
  	change_column :restaurants, :openhours, :string
  end
end
