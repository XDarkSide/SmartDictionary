class UnlearnedWord < ApplicationRecord
    belongs_to :word
    belongs_to :statistics
end
