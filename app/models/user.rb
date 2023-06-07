class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bet_members
  has_many :bets, through: :bet_members

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
