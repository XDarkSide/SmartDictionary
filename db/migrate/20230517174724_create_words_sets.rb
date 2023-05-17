class CreateWordsSets < ActiveRecord::Migration[7.0]
  def change
    create_table :words_sets do |t|

      t.references :Category, foreign_key: true
      t.string :setName
      t.string :description
      t.integer :capacity

      t.timestamps
    end
  end
end