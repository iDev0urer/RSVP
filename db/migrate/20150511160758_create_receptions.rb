class CreateReceptions < ActiveRecord::Migration
  def change
    create_table :receptions do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :wedding_id

      t.timestamps null: false
    end
  end
end
