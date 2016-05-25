class CuisinesController < ApplicationController
  before_action :set_cuisine, only: [:show, :edit, :update]

  def index
    @cuisines = Cuisine.order(:description)
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.create(cuisine_params)
    respond_with @cuisine
  end

  def show; end

  def edit; end

  def update
    @cuisine.update(cuisine_params)
    respond_with @cuisine
  end

  private

  def set_cuisine
    @cuisine = Cuisine.find(params[:id])
  end

  def cuisine_params
    params.require(:cuisine).permit(:description)
  end
end
