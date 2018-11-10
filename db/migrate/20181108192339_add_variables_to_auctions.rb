class AddVariablesToAuctions < ActiveRecord::Migration[5.2]
  def change
  	add_column :auctions, :dateStart, :time
  	add_column :auctions, :dateEnd, :time
  end
end
