class AddNameToTransports < ActiveRecord::Migration[5.1]
  def change
    add_column :transports, :name, :string
  end
end
