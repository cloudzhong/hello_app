class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :micropost, index: true
      t.text :content
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :microposts
    add_foreign_key :comments, :users
  end
end
