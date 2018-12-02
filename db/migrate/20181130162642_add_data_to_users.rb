class AddDataToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_reference :users, :reservation, foreign_key: true
  	add_column :users, :name, :string
  	add_column :users, :surname, :string
  	add_column :users, :birthday, :date
  	add_column :users, :credit_card_number, :bigint
  	add_column :users, :cvv, :integer
  end
end
