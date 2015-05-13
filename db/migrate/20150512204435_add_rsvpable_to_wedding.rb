class AddRsvpableToWedding < ActiveRecord::Migration
  def change
    add_column :weddings, :rsvpable, :boolean
  end
end
