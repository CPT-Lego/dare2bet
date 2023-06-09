class Tag < ApplicationRecord

  validates :name, inclusion: %w[Gaming Sport Challenge Fact-check Chance Other]


end
