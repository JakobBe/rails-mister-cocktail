class DosesController < ApplicationController

  before_action :set_cocktail

  def new
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    @ingredients = Ingredient.all
    @dose = Dose.new(description: dose_params[:description])
    @dose.cocktail = @cocktail
    @dose.ingredient = Ingredient.find(dose_params[:ingredient].to_i)

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end


  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
