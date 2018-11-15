class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :userName , :string
  end 
end
