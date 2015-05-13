class AddForeignKeyToReceptionsWeddingId < ActiveRecord::Migration
  def change
    add_foreign_key :receptions, :weddings
  end
end
