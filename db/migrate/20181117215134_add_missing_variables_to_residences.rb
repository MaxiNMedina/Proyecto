class AddMissingVariablesToResidences < ActiveRecord::Migration[5.2]
  def change
  	add_column :residences, :country, :string
  	add_column :residences, :province, :string
  	add_column :residences, :locality, :string
  end
end
