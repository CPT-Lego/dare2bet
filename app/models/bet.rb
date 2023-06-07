class Bet < ApplicationRecord
  belongs_to :tag

  has_many :bet_members, dependent: :destroy
  has_many :users, through: :bet_members, dependent: :destroy

  validates :name, presence: true
  validates :stake, presence: true
  validates :location, presence: true
  validates :privacy, presence: true
  validates :status, inclusion: %w[pending active finished]
  validates :outcome, inclusion: %w[ongoing win loss tie]

end
