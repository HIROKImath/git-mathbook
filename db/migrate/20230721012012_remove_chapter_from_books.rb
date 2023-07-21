class RemoveChapterFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :page, :integer
    remove_column :books, :chapter, :integer
    remove_column :books, :section, :integer

    remove_column :books, :body_question, :text
    remove_column :books, :body_answer, :text

    remove_column :books, :topic_main_id, :integer
    remove_column :books, :topic_sub_id, :integer
    remove_column :books, :chapter, :integer

    rename_column :book_articles, :book_image_id, :article_image_id
  end
end
