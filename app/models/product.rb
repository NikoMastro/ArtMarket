class Product < ApplicationRecord
  belongs_to :user
  has_many :renting_requests, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
