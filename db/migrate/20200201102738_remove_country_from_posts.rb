class RemoveCountryFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :country_id, :string
  end
end
