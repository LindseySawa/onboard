class AddCountry < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :country, :string
  end
end
