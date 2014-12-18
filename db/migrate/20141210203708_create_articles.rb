class CreateArticles < ActiveRecord::Migration
  def change
    create_table :article_items do |t|
      t.text :title
      t.text :description
      t.string :pic_url
      t.string :url
      t.integer :news_message_id

      t.timestamps
    end
  end
end
