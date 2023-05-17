class CreateStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :statistics do |t|
      t.integer :result
      t.integer :maxResult

      t.timestamps
    end
  end
end
