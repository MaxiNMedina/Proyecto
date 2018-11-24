class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.references :residence, foreign_key: true
      t.integer :year
      t.integer :week
      t.boolean :is_available

      t.timestamps
    end
  end
end
