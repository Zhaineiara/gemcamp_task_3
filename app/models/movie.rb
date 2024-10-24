class Movie < ApplicationRecord
  before_save :generate_slug

  validates :title, presence: true
  validates :description, presence: true
  validates :date_released, presence: true
  validates :country_of_origin, presence: true
  validates :showing_start, presence: true
  validates :showing_end, presence: true, comparison: { greater_than: :showing_start }

  belongs_to :user
  has_and_belongs_to_many :genres
  has_many :reviews

  def generate_slug
    unique_slug = SecureRandom.alphanumeric(7)
    self.slug = unique_slug
  end
end
