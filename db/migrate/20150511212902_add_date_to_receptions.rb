class AddDateToReceptions < ActiveRecord::Migration
  def change
    add_column :receptions, :start_time, :datetime
    add_column :receptions, :end_time, :datetime
  end
end
