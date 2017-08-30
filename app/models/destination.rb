class Destination < ApplicationRecord
  searchkick word_middle: [:name]
  validates :name, uniqueness: true, length: {maximum: 50}


  def search_data
    {
      name: name,
      code: code
    }
  end
end
