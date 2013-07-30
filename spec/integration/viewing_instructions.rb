require 'spec_helper'

feature "Viewing instruction" do
  before do
    visit "/"
  end

  scenario "Viewing instructions for a recipe"  do
    textmate_2 = Factory(:recipe, :ingredient => "Ingredients with measurement")
    Factory(:instruction,
            :ingredient => "Ingredients with measurement"
            :directions => "Complete these procedures"
            click_link instruction.title
            page.current_url.should == instruction_url(instruction)
  end
end
