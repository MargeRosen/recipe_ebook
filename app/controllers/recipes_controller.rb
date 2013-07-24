class RecipesController < ApplicationController
  def index

  end

  def new
    @recipe = Recipe.new
  end

  def create

    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "Recipe has been created."
      redirect_to @recipe
    else
      flash[:alert] = "Recipe has not been created."
      render :action => "new"
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

private
  # rails 4 of whitelisting params.  Instead of att_accessible on the Model
  def recipe_params
    params.require(:recipe).permit(:title, :description, :preptime, :servings)
  end
end
