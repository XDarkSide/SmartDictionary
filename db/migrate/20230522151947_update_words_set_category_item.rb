class UpdateWordsSetCategoryItem < ActiveRecord::Migration[7.0]
  def change
    def change
      remove_reference :words_sets, :category
      add_reference :words_sets, :category_item, foreign_key: true
    end
  end
end
