class MainController < ApplicationController
  def index
    @residence = Residence.all
  end
end
