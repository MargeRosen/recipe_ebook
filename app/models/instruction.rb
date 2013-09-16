class Instruction < ActiveRecord::Base
  belongs_to :recipe
  validates :ingredient, :presence => true
  validates :directions, :presence => true
end
