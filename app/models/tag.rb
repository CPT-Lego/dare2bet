class Tag < ApplicationRecord
  validates :name, inclusion: %w[gaming sport challenge fact-check chance other]

end
