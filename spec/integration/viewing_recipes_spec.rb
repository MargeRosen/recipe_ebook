require 'spec_helper'

feature "Viewing recipes" do
  scenario "Listing all recipes" do
    recipe = Factory.create(:recipe, :title => "My favorite dish")
    visit '/'
    click_link 'My favorite dish'
    page.current_url.should == recipe_url(recipe)
  end
end
