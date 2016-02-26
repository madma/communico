class CreateArticlesUsers < ActiveRecord::Migration
  def change
    create_table :articles_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :article, index: true, foreign_key: true
    end
  end
end
