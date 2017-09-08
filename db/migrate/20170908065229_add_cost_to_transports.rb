class AddCostToTransports < ActiveRecord::Migration[5.1]
  def change
    add_column :transports, :cost, :integer
  end
end
