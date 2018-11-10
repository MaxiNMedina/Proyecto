class AddVariablesToResidences < ActiveRecord::Migration[5.2]
  def change
  	add_column :residences, :image_url, :string
  end
end
