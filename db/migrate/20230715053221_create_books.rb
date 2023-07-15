class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|

      t.integer:user_id
      t.string :title, null: false
      t.text :body_question
      t.text :body_answer
      t.string :author, null: false
      t.integer:page, null: false
      t.integer:chapter
      t.integer:section
      t.integer:book_image

      # 分野テーブル
      t.integer:branch_id
      t.integer:isbn
      t.integer:topic_main_id
      t.integer:topic_sub_id

      t.timestamps null: false
    end
  end
end
