class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: :ture
  validates_uniqueness_of :cocktail, :scope => [:ingredient]
end
