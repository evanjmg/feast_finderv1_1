class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :location
      t.decimal :rating
      t.decimal :meal_size
      t.text :description
      t.string :image_file_name
      t.decimal :price
      t.string :cuisine

      t.timestamps
    end
  end
end
