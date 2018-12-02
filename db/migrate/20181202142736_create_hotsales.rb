class CreateHotsales < ActiveRecord::Migration[5.2]
  def change
    create_table :hotsales do |t|
      t.references :residence, foreign_key: true
      t.references :availability, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
