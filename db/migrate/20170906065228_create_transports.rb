class CreateTransports < ActiveRecord::Migration[5.1]
  def change
    create_table :transports do |t|
      t.references :bus
      t.references :from
      t.references :to
      t.date :start_date
      t.date :end_date
      t.time :departure_time
      t.time :arrival_time
      t.integer :recurrence

      t.timestamps
    end
  end
end
