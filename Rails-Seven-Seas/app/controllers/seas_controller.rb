class SeasController < ApplicationController
  # define your controller actions here
  before_action :set_sea, only: %i[show edit destroy]

  def new
    @sea = Sea.new
  end

  def index
    @seas = Sea.all # form_for
  end

  def edit
    #    binding.pry
  end

  def show; end

  def create; end

  def update; end

  def destroy
    @sea.destroy
  end

  private

  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!

  def set_sea
    @sea = Sea.find(params[:id])
  end

  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end
end
