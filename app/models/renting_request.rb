class RentingRequest < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :status, presence: true
end
