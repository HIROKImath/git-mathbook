class RenameBookImagezColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :book_imagez_id, :book_image_id
  end
end
