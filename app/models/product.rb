class Product < ApplicationRecord
  belongs_to :user
  has_many :renting_requests, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  # for search bar
  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
  against: [ :title, :description ],
  using: {
    tsearch: { prefix: true }
  }
end
