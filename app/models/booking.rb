class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :yacht
  has_one :income, dependent: :destroy
end
