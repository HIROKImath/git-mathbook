class CreateBookArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :book_articles do |t|
      t.integer:user_id
      t.integer:book_id

      t.string :title, null: false
      t.text :body

      t.integer:page, null: false
      t.integer:chapter
      t.integer:section
      t.string:book_image_id

      t.integer:topic_main_id
      t.integer:topic_sub_id

      t.timestamps null: false

      t.timestamps
    end
  end
end
