class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
    	t.integer :user_fee
    	t.integer :premium_user_fee
    	
    	t.timestamps
    end
  end
end
