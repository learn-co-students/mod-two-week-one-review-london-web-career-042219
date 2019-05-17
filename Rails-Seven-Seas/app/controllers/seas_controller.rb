class SeasController < ApplicationController
  #define your controller actions here
  before_action :set_sea, only: [:show, :edit, :update, :destroy]
  
  def index
    @seas = Sea.all
  end

  def show
    # @seas = Sea.find(params[:id])
  end

  def new
    @sea = Sea.new
  end

  def create
    @sea = Sea.new(sea_params)

    respond_to do |format|
      if @sea.save
        format.html { redirect_to @sea, notice: "Sea was successfully created."}
        format.json { render :show, status: :created, location: @sea}
      else
        format.html {render :new}
        format.json { render json: @sea.erros, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sea.update(sea_params)
        format.html { redirect_to @sea, notice: "Sea was successfully updated."}
        format.json { render :show, status: :ok, location: @sea}
      else
        format.html {render :edit}
        format.json { render json: @sea.erros, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sea.destroy
    respond_to do |format|
      format.html { redirect_to seas_url, notice: "Sea was successfully destroyed."}
      format.json { head :no_content}
    end
  end

  def edit
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
