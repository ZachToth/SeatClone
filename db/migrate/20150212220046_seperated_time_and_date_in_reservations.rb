class SeperatedTimeAndDateInReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :date, :date
    add_column :reservations, :time, :integer
    remove_column :reservations, :time_date
  end
end
