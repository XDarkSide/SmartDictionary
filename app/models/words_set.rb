class WordsSet < ApplicationRecord
    belongs_to:Category

    attribute :setName, :string
    attribute :description, :string
    attribute :capacity, :integer

end