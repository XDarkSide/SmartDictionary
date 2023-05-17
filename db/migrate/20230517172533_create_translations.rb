class CreateTranslations < ActiveRecord::Migration[7.0]
  def change
    create_table :translations do |t|

      t.string :translation
      t.references :language, foreign_key: true
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
