class AddBookIdToBookImages < ActiveRecord::Migration[5.2]
  def change
    add_column :book_images, :book_id, :integer
  end
end
