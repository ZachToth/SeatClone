class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :user_id
      t.string :restaurant_id
      t.string :time_date
      t.string :party_size

      t.timestamps null: false
    end
  end
end
