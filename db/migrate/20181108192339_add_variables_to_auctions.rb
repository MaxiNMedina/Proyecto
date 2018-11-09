class AgregarDatosASubasta < ActiveRecord::Migration[5.2]
  def change
  	add_column :auctions, :dateStart, :time, :dateEnd, :time
  end
end
