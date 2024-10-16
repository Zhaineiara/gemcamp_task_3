class Review < ApplicationRecord
  validates :rating, presence: true
  validates :comment, presence: true

  belongs_to :user
  belongs_to :movie
end
