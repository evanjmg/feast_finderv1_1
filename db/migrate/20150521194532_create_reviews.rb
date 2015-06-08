class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :email
      t.string :comment
      t.integer :meal_size
      t.decimal :price
      t.references :place, index: true

      t.timestamps
    end
  end
end
