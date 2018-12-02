class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :dir
      t.string :desc
      t.string :country
      t.string :province
      t.string :locality

      t.timestamps
    end
  end
end
