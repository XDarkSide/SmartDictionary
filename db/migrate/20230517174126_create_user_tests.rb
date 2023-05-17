class CreateUserTests < ActiveRecord::Migration[7.0]
  def change
    create_table :user_tests do |t|

      t.references :Test, foreign_key: true
      t.references :User, foreign_key: true
      t.timestamps
    end
  end
end
