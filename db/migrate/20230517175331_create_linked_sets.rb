class CreateLinkedSets < ActiveRecord::Migration[7.0]
  def change
    create_table :linked_sets do |t|

      t.references :WordsSet, foreign_key: true
      t.references :User, foreign_key: true
      t.timestamps
    end
  end
end
