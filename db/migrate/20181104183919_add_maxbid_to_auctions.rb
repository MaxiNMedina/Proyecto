class AddMaxbidToAuctions < ActiveRecord::Migration[5.2]
  def change
    add_column :auctions, :residence, :reference
    add_column :auctions, :maxbid, :integer
  end
end
