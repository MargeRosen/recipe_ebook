require 'spec_helper'

feature "Creating Instructions" do
  before do
    recipe = Factory(:recipe, :title => "My favorite dish")
    visit '/'
    click_link "My favorite dish"
    click_link "New Instruction"
  end

  scenario "Creating an Instruction" do
    fill_in "Ingredient", :with => "Ingredient with measurement"
    fill_in "Directions", :with => "Directions with procedures"
    click_button "Create Instruction"
    page.should have_content("Instructions have been created.")
  end

  scenario "Creating an Instruction without valid attributes fails" do
    click_button "Create Instruction"
    page.should have_content("Instructions have not been created.")
    page.should have_content("Ingredient can't be blank")
    page.should have_content("Directions can't be blank")
  end
end
