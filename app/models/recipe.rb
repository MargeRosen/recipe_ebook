class Recipe < ActiveRecord::Base

validates :title, :presence => true
#validates :description, :presence => true
#validates :preptime, :presence => true
#validates :servings, :presence => true
end
