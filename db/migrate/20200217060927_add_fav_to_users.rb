class AddFavToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fav_country, :string, null: false
    add_column :users, :fav_spot, :string
    add_column :users, :introduction, :text, null: false
    add_column :users, :sns_hp, :text

  end
end
