require 'spec_helper'

feature 'Creating Recipes' do
  before do
    visit '/'
    click_link 'New recipe'
  end

  scenario "can create a recipe" do
    fill_in 'Title', :with => 'My favorite dish'
    click_button "Create Recipe"
    page.should have_content('Recipe has been created.')

    recipe = Recipe.find_by_title("My favorite dish")
    page.current_url.should == recipe_url(recipe)
    find("title").should have_content("Recipes - Ebook")
  end

  scenario "cannot create a recipe without a title" do
    click_button "Create Recipe"
    page.should have_content("Recipe has not been created.")
    page.should have_content("Title can't be blank")
  end
end
