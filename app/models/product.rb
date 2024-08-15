class Product < ApplicationRecord
  belongs_to :user
  has_many :renting_requests, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  has_one_attached :photo
end
