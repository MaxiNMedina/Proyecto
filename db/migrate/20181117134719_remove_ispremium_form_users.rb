class RemoveIspremiumFormUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :isPremium, :boolean
  end
end
