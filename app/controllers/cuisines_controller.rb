class CuisinesController < ApplicationController
  before_action :set_cuisine, only: [:show]

  def index
    @cuisines = Cuisine.all
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.create(cuisine_params)
    respond_with @cuisine
  end

  def show; end

  private

  def set_cuisine
    @cuisine = Cuisine.find(params[:id])
  end

  def cuisine_params
    params.require(:cuisine).permit(:description)
  end
end
