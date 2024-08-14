class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :renting_requests
  has_many :products
  has_many :renting_requests_as_owner, through: :products, source: :renting_requests
  has_many :reviews

  # validates :name, presence: true
  # validates :address, presence: true
  # validates :password, presence: true
  # validates :email_address, presence: true
end
