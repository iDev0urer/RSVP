class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :slug, unique: true
      t.text :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.boolean :saved, default: false
      t.actable

      t.timestamps null: false
    end
  end
end
