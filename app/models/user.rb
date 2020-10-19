class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  has_many :favorites, dependent: :destroy
  has_many :favorite_stores, through: :favorites, source: :store
  has_many :reviews, dependent: :destroy
  has_many :review_stores, through: :reviews, source: :store
end
