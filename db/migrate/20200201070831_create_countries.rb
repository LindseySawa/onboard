class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.references :area, foreign_key: true
      t.string :name
    end
  end
end
