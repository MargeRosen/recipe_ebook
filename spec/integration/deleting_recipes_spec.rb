require 'spec_helper'

feature "Deleting recipe" do
  scenario "Deleting a recipe" do
    Factory(:recipe, :title => "My favorite dish")
    visit "/"
    click_link "My favorite dish"
    click_link "Delete Recipe"
    page.should have_content("Recipe has been deleted.")

    visit "/"
    page.should_not have_content("My favorite dish")
  end
end
