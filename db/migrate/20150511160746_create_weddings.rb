class CreateWeddings < ActiveRecord::Migration
  def change
    create_table :weddings do |t|
      t.string :brides_name
      t.string :grooms_name

      t.timestamps null: false
    end
  end
end
