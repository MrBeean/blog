class AddMainimgToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :mainimg, :string
  end
end
