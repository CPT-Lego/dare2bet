class Tag < ApplicationRecord
  validates :name, inclusion: %w[gaming sport challenges fact-check chance other]
  
end
