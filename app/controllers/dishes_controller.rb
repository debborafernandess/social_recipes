class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update]

  def index
    @dishes = Dish.order(:description)
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.create(dish_params)
    respond_with @dish
  end

  def show; end

  def edit; end

  def update
    @dish.update(dish_params)
    respond_with @dish
  end

  private

  def dish_params
    params.require(:dish).permit(:description)
  end

  def set_dish
    @dish = Dish.find(params[:id])
  end
end
