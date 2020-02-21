class RemoveCountryIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :country, :reference
  end
end
