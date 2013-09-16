class Instruction < ActiveRecord::Base
  belongs_to :recipe
  validates :title, :presence => true
  validates :description, :presence => true
end
