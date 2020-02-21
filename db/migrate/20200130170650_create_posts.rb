class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text         :image, null: false
      t.string       :country, null: false
      t.string       :city
      t.string       :how
      t.text         :discription, null: false
      t.timestamps null: true
    end
  end
end
