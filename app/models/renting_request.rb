class RentingRequest < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :status, presence: true

  def pending?
    status == 'pending'
  end
end
