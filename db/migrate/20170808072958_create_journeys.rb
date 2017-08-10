class CreateJourneys < ActiveRecord::Migration[5.1]
  def change
    create_table :journeys do |t|
      t.references :bus, foreign_key: true
      t.datetime :departure_time
      t.datetime :arrival_time
      t.references :from #, foreign_key: true
      t.references :to #, foreign_key: true

      t.timestamps
    end
  end
end
