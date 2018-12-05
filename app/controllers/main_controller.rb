class MainController < ApplicationController
  def index
    @residences = Residence.all
    @hotsales = Hotsale.all
  end
end
