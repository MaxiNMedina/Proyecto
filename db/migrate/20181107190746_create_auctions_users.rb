class CreateAuctionsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions_users do |t|
      t.references :user, foreign_key: true
      t.references :auction, foreign_key: true

      t.timestamps
    end
  end
end
