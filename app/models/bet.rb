class Bet < ApplicationRecord
  belongs_to :tag, optional: true
  belongs_to :user
  belongs_to :opponent, class_name: "User"
  belongs_to :winner, class_name: "User", optional: true

  validates :name, presence: true, length: { maximum: 16 }
  
  # validates :stake, presence: true
  # validates :location, presence: true
  # validates :privacy, presence: true

  enum :status, {
    pending: 0,
    active: 1,
    finished: 2
  }

  geocoded_by :location, latitude: :latitude, longitude: :longitude
  after_validation :geocode, if: :will_save_change_to_location?
end
