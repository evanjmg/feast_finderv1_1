class CreateCuisinizations < ActiveRecord::Migration
  def change
    create_table :cuisinizations do |t|
      t.references :place, index: true
      t.references :cuisine, index: true

      t.timestamps
    end
  end
end
