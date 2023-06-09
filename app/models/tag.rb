class Tag < ApplicationRecord

  validates :name, inclusion: %w[GAMING SPORT CHALLENGE FACT-CHECK CHANCE OTHER]


end
