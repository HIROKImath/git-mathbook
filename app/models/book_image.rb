class BookImage < ApplicationRecord

  attachment :book_image_main
  attachment :book_image_sub1
  attachment :book_image_sub2
  attachment :book_image_sub3

  belongs_to :book
end
