class CreateBusRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :bus_routes do |t|
      t.integer :from_id
      t.integer :to_id
      t.references :bus, foreign_key: true

      t.timestamps
    end
  end
end
