class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_recipe, only: [:show, :edit, :update]
  before_action :verify_owner, only: [:edit, :update]

  def index
    @recipes = Recipe.includes(:cuisine).all
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.create(recipe_params)
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
          .permit(:name, :cuisine_id, :dish_id, :preference_id, :serves,
                  :cook_time, :level, :ingredients, :directions, :photo)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def verify_owner
    redirect_to root_path unless current_user.eql?(@recipe.user)
  end
end
