class FlatsController < ApplicationController

  def index
    @flats = Flat.all
  end

  def show

  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
    redirect_to flats_path(@flat), notice: "The Flat was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

end
