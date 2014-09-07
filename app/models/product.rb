class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  validates :description, :image_url, :title, presence: true
  validates :price, numericality: {greater_that_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
	with: %r{\.(gif|jpg|png)$}i,
	message: 'URL must be GIF, JPG or PNG.'
  }
end