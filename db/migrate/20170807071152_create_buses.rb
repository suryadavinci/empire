class CreateBuses < ActiveRecord::Migration[5.1]
  def change
    create_table :buses do |t|
      t.string :name
      t.integer :max_seats

      t.timestamps
    end
  end
end
