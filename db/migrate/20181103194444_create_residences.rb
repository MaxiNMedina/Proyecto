class CreateResidences < ActiveRecord::Migration[5.2]
  def change
    create_table :residences do |t|
      t.string :name
      t.string :dir
      t.text :desc
      t.boolean :available

      t.timestamps
    end
  end
end
