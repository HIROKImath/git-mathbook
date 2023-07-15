class CreateBookImages < ActiveRecord::Migration[5.2]
  def change
    create_table :book_images do |t|
      t.string :book_image_main_id  # 「refile」による画像保存用
      t.string :book_image_sub1_id
      t.string :book_image_sub2_id
      t.string :book_image_sub3_id
      t.timestamps
    end
  end
end
