class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.references :place, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
