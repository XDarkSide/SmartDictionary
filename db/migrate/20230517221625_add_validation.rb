class AddValidation < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :firstName, :string, null: false, limit: 20
    change_column :users, :lastName, :string, null: false, limit: 20
    change_column :users, :birthday, :datetime, null: false
  end
end
