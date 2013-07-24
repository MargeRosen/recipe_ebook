require 'spec_helper'

feature "Editing Recipes" do
  before do
    Factory(:recipe, :title => "My favorite dish")
    visit "/"
    click_link "My favorite dish"
    click_link "Edit Recipe"
  end

  scenario "Updating a Recipe" do
    fill_in "Title", :with => "My favorite dish?"
    click_button "Update Recipe"
    page.should have_content("Recipe has been updated.")
  end

  scenario "Updating a recipe with invalid attributes is bad" do
    fill_in "Title", :with => ""
    click_button "Update Recipe"
    page.should have_content("Recipe has not been updated.")
  end
end
