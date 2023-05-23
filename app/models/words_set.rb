class WordsSet < ApplicationRecord
    belongs_to :category_item
  
    attribute :setName, :string
    attribute :description, :string
    attribute :capacity, :integer
  end
  