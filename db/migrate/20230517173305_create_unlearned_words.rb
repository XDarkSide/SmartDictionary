class CreateUnlearnedWords < ActiveRecord::Migration[7.0]
  def change
    create_table :unlearned_words do |t|
      t.references :word, foreign_key: true
      t.references :statistics, foreign_key: true
      t.timestamps
    end
  end
end
