class InstructionsController < ApplicationController
  before_filter :find_recipe
  before_filter :find_instruction, :only => [:show, :edit, :update, :destroy]

  def new
    @instruction = @recipe.instructions.build
  end

  def edit
    @instruction = Instruction.find(params[:id])
  end

  def create
    @instruction = @recipe.instructions.build(instruction_params)
    if @instruction.save
      flash[:notice] = "Instructions have been created."
      redirect_to [@recipe, @instruction]
    else
      flash[:alert] = "Instructions have not been created."
      render :action => "new"
    end
  end

  def show
    @instruction = Instruction.find(params[:id])
  end


  def update
    if @instruction.update_attributes(params[:instruction]) #anytime writing to db need (instruction_params)
      flash[:notice] = "Instructions have been updated."
      redirect_to [@recipe, @instruction]
    else
      flash[:alert] = "Instructions have not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @instruction = Instruction.find(params[:id])
    @instruction.destroy
    flash[:notice] = "Instruction have been deleted."
    redirect_to instruction_path
  end

  private
  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def find_instruction
    @instruction = @recipe.instructions.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The instructions you were looking for could not be found."
    redirect_to recipes_path
  end

  def instruction_params
    params.require(:instruction).permit( :ingredient, :directions)
  end
end
