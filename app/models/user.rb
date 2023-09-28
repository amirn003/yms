class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :yachts
  has_many :bookings
  has_and_belongs_to_many :crews

  validates :email, uniqueness: true
  validates :email, presence: true
end
