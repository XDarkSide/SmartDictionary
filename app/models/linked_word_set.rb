class LinkedWordSet < ApplicationRecord
    belongs_to :word
    belongs_to :WordsSet
end
