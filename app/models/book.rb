class Book < ApplicationRecord

  belongs_to :user
  has_many :book_images, dependent: :destroy

  validates :title, presence: true
  validates :body_answer, presence: true, length: { maximum: 200}
end
