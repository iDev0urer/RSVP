class Event < ActiveRecord::Base

  actable
  validates_presence_of :name, :slug, :address
  geocoded_by :address
  after_validation :geocode

  belongs_to :user

end
