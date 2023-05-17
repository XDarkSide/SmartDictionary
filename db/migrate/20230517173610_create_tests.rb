class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.references :statistics, foreign_key: true
      t.time :startTime
      t.time :endTime
      
      t.timestamps
    end
  end
end
