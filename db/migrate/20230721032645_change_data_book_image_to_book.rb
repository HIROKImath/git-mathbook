class ChangeDataBookImageToBook < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :book_image_id, :string
  end
end
