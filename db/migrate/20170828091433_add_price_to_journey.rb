class AddPriceToJourney < ActiveRecord::Migration[5.1]
  def change
    add_column :journeys, :cost, :integer
  end
end
