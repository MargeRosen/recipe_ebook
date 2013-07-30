class Recipe < ActiveRecord::Base

  validates :title, :presence => true

  has_many :instructions
end
