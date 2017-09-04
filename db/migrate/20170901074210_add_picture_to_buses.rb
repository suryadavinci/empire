class AddPictureToBuses < ActiveRecord::Migration[5.1]
  def change
    add_column :buses, :picture, :string
  end
end
