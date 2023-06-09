class BetMember < ApplicationRecord
  before_validation :set_default

  belongs_to :user
  belongs_to :bet

  validates :outcome, inclusion: %w[win loss tie undecided]

  def set_default
    outcome = "undecided"
  end

end
