class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_one_attached :photo
  has_many :bets, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :location, latitude: :latitude, longitude: :longitude
  after_validation :geocode, if: :will_save_change_to_location?

  def active_bets
    Bet.where("(user_id = :user OR opponent_id = :user) AND status = 1", user: self.id)
  end

  def past_bets
    Bet.where("(user_id = :user OR opponent_id = :user) AND status = 2", user: self.id)
  end

  def sent_pending_bets
    Bet.where("user_id = :user AND status = 0", user: self.id)
  end

  def received_pending_bets
    Bet.where("opponent_id = :user AND status = 0", user: self.id)
  end
end
