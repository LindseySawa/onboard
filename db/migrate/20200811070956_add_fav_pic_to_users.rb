class AddFavPicToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fav_pic, :string, null: false
    add_column :users, :fav_cam, :string, null: false
  end
end
