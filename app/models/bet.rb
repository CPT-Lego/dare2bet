class Bet < ApplicationRecord
  belongs_to :tag

  validates :name, presence: true
  validates :stake, presence: true
  validates :location, presence: true
  validates :privacy, presence: true
  validates :status, inclusion: %w[pending active finished]
  validates :outcome, inclusion: %w[ongoing win loss tie]

end
