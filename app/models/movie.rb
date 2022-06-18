class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  belongs_to :user
  has_many :reviews
  has_one_attached :image
end
