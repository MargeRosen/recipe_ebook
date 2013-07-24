require 'spec_helper'

describe RecipesController do
  it "displays an error for a missing recipe" do
    get :show, :id => "not-here"
    response.should redirect_to(recipes_path)
    message = "The recipe you were looking for could not be found."
    flash[:alert].should == message
  end
end
