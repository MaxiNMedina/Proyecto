class AddCreditCardDatesToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :card_expiry_date, :date
  end
end
