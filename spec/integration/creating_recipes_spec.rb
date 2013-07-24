require 'spec_helper'

feature 'Creating Recipes' do
  before do
    visit '/'
    click_link 'New recipe'
  end

  scenario "can create a recipe" do
    fill_in 'Title', :with => 'My favorite dish'
    fill_in 'Meal Type', :with => 'Dinner'
    fill_in 'Prep Time', :with => "10 minutes"
    fill_in 'Servings', :with => "4"
    click_button "Create Recipe"
    page.should have_content('Recipe has been created.')

    recipe = Recipe.find_by_title("My favorite dish")
    page.current_url.should == recipe_url(recipe)
    title = "My favorite dish - Recipes - Ebook"
    find("title").should have_content(title)
  end

  scenario "cannot create a recipe without a title" do
    click_button "Create Recipe"
    page.should have_content("Recipe has not been created.")
    page.should have_content("Title can't be blank")
  end
end
