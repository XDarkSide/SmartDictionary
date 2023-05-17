class AddForeignKeyAndColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :birthday, :datetime

    add_foreign_key :users, :roles, column: :role_id
  end
end
