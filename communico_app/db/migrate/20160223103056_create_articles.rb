class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.string :link
      t.string :text
      t.datetime :published_on
      t.string :thumbnail_img
      t.string :section

      t.timestamps null: false
    end
  end
end
