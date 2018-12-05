class AddAvailabilityIdToAuction < ActiveRecord::Migration[5.2]
  def change
  	add_reference :auctions, :availability, foreign_key: true
  end
end
