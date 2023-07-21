class Book < ApplicationRecord

  belongs_to :user
  has_many :book_articles, dependent: :destroy
  has_many :book_images, dependent: :destroy

  attachment :book_image

  validates :title, presence: true

end
