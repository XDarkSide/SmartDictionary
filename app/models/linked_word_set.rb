class LinkedWordSet < ApplicationRecord
    belongs_to :word
    belongs_to :words_sets, class_name: 'WordsSet'
  end
  