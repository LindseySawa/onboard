class AddCountryToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :country, :string, null: false
  end
end
