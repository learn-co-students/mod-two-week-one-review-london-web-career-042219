# frozen_string_literal: true

require 'pry'
class SeasController < ApplicationController
  before_action :set_sea, only: %i[show edit update destroy]

  def index
    @seas = Sea.all
  end

  def show; end

  def new; end

  def edit; end

  def create; end

  def update; end

  def destroy; end

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
