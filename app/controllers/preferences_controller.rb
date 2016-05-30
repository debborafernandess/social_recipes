class PreferencesController < ApplicationController
  before_action :set_preference, only: [:show, :edit, :update]

  def index
    @preferences = Preference.order(:description)
  end

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.create(preference_params)
    respond_with @preference
  end

  def show; end

  def edit; end

  def update
    @preference.update(preference_params)
    respond_with @preference
  end

  private

  def set_preference
    @preference = Preference.find(params[:id])
  end

  def preference_params
    params.require(:preference).permit(:description)
  end
end
