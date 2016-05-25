class RecipesController < ApplicationController

  before_action :set_recipe, only: [:show]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    respond_with @recipe
  end

  def show; end

  private

  def recipe_params
    params.require(:recipe)
          .permit(:name, :cuisine, :food_type, :food_preference, :serves,
                  :cook_time, :level, :ingredients, :directions, :photo)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
