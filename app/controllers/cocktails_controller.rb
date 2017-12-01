class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def index
    @img = ["Gin", "Happy", "Mojito", "Spritz", "Strawberry", "SuperGin", "Vodka", "Whiskey"]
    @cocktails = Cocktail.all
  end

  def show
    @img = ["Gin", "Happy", "Mojito", "Spritz", "Strawberry", "SuperGin", "Vodka", "Whiskey"]
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def destroy
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

end
