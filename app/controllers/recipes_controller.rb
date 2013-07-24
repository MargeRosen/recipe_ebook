class RecipesController < ApplicationController
  before_filter :find_recipe, :only => [:show,:edit,
                                       :update, :destroy]
  def index
    @recipes = Recipe.all
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

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params) #anytime writing to db need (recipe_params)
      flash[:notice] = "Recipe has been updated."
      redirect_to @recipe
    else
      flash[:alert] = "Recipe has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "Recipe has been deleted."
    redirect_to recipes_path
  end

private
  def find_recipe
    @recipe = Recipe.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The recipe you were looking" +
                    " for could not be found."
    redirect_to recipes_path
end

private
  # rails 4 of whitelisting params.  Instead of att_accessible on the Model
  def recipe_params
    params.require(:recipe).permit(:title, :description, :preptime, :servings)
  end
end
