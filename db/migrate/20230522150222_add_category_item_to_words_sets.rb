class AddCategoryItemToWordsSets < ActiveRecord::Migration[7.0]
  def change
    add_reference :words_sets, :category_item, null: false, foreign_key: true
  end
end
