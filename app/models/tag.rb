class Tag < ApplicationRecord
  CATEGORIES = ["Sports", "Video games & e-sports", "Challenges", "Fact-check", "Cards & board games", "Other ;)"]

  validates :name, inclusion: CATEGORIES

end
