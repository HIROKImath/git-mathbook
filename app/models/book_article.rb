class BookArticle < ApplicationRecord
  belongs_to :user
  belongs_to :book
  attachment :article_image
end
