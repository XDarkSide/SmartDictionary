class CreateLinkedSets < ActiveRecord::Migration[7.0]
  def change
    create_table :linked_sets do |t|
      t.references :words_set, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
