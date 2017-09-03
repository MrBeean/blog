class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :post
      t.boolean :visible, default: false

      t.timestamps null: false
    end
  end
end
