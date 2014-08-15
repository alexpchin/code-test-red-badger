class World < ActiveRecord::Base
  has_many :robots

  validates :name, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }, allow_blank: false
  validates :name, presence: true
  validates :name, length: { minimum: 5, maximum: 30 }

  validates :x, numericality: {less_than_or_equal_to: 50, greater_than: 0}, presence: true
  validates :y, numericality: {less_than_or_equal_to: 50, greater_than: 0}, presence: true

end
