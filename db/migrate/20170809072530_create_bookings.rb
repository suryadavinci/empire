class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :journey, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :seats_count

      t.timestamps
    end
  end
end
