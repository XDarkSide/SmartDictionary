class LinkedSet < ApplicationRecord
    belongs_to :words_set, class_name: 'WordsSet'
    belongs_to :user, class_name: 'User'
  end