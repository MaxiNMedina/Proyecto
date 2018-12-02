class HotsalesController < ApplicationController
  before_action :set_hotsale, only: [:show, :edit, :update, :destroy]

  # GET /hotsales
  # GET /hotsales.json
  def index
    @hotsales = Hotsale.all
  end

  # GET /hotsales/1
  # GET /hotsales/1.json
  def show
  end

  # GET /hotsales/new
  def new
    @hotsale = Hotsale.new
  end

  # GET /hotsales/1/edit
  def edit
  end

  # POST /hotsales
  # POST /hotsales.json
  def create
    @hotsale = Hotsale.new(hotsale_params)

    respond_to do |format|
      if @hotsale.save
        format.html { redirect_to @hotsale, notice: 'Hotsale was successfully created.' }
        format.json { render :show, status: :created, location: @hotsale }
      else
        format.html { render :new }
        format.json { render json: @hotsale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotsales/1
  # PATCH/PUT /hotsales/1.json
  def update
    respond_to do |format|
      if @hotsale.update(hotsale_params)
        format.html { redirect_to @hotsale, notice: 'Hotsale was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotsale }
      else
        format.html { render :edit }
        format.json { render json: @hotsale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotsales/1
  # DELETE /hotsales/1.json
  def destroy
    @hotsale.destroy
    flash[:notice] = "Hotsale Terminada!"
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotsale
      @hotsale = Hotsale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotsale_params
      params.fetch(:hotsale, {})
    end
end