class Book < ApplicationRecord

  belongs_to :user
  has_many :book_images, dependent: :destroy
end
