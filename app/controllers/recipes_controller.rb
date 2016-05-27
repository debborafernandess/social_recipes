class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]

  def index
    @recipes = Recipe.includes(:cuisine).all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    respond_with @recipe
  end

  def show; end

  def edit; end

  def update
    @recipe.update(recipe_params)
    respond_with @recipe
  end

  private

  def recipe_params
    params.require(:recipe)
          .permit(:name, :cuisine_id, :dish_id, :food_preference, :serves,
                  :cook_time, :level, :ingredients, :directions, :photo)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
