class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|

      t.belongs_to :user
      t.belongs_to :reception

      t.integer :user_id
      t.integer :reception_id
      t.integer :party_size
      t.datetime :rsvp_date

      t.timestamps null: false
    end
  end
end
