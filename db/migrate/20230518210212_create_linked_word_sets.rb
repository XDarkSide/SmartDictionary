class CreateLinkedWordSets < ActiveRecord::Migration[7.0]
  def change
    create_table :linked_word_sets do |t|

      t.references :word, foreign_key: true
      t.references :WordsSet, foreign_key: true
      t.timestamps
    end
  end
end
