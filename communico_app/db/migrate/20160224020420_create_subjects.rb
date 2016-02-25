class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string     :name
      t.boolean    :auto_generated
      t.references :article, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
