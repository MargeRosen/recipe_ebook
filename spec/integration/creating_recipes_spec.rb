require 'spec_helper'

feature 'Creating Recipes' do
  scenario "can create a recipe" do
    visit '/'
    click_link 'New recipe'
    fill_in 'Title', :with => 'My favorite dish'
    fill_in 'Meal Type', :with => 'Dinner'
    fill_in 'Prep Time', :with => "10 minutes"
    fill_in 'Servings', :with => "4"
    click_button "Create recipe"
    page.should have_content('Recipe has been created.')
    recipe = Recipe.find_by_name("My favorite dish")
    page.current_url.should == recipe_url(recipe)
    title = "My Favorite Dish - Recipes ebook"
    find("title").should have_content(title)
  end
end
