class BetMember < ApplicationRecord
  belongs_to :user
  belongs_to :bet

  validates :outcome, inclusion: %w[win loss tie]
  
end
