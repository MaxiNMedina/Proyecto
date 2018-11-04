class AddMaxbidToAuctions < ActiveRecord::Migration[5.2]
  def change
    add_reference :auctions, :residence, foreign_key: true
    add_column :auctions, :maxbid, :integer
  end
end
