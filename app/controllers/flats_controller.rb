class FlatsController < ApplicationController

  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    params['query'].nil? ? @flats = Flat.all : @flats = Flat.where("name LIKE '%#{params['query']}%'")
    @query = params['query']
    @total = Flat.all.length
    @search_msg = ""
    unless @query.nil?
      @search_msg = "You searched for #{@query}. We found #{@flats.length} flats out of #{@total}"
    end
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @flat.update(flat_params)
        format.html { redirect_to @flat, notice: 'Flat was successfully updated.' }
        format.json { render :show, status: :ok, location: @flat }
      else
        format.html { render :edit }
        format.json { render json: @flat.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @flat.destroy
    respond_to do |format|
      format.html { redirect_to flats_url, notice: 'Flat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def search
  #   @flats = Flat.where("name LIKE '%#{params[query]}%'")
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_flat
    @flat = Flat.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
