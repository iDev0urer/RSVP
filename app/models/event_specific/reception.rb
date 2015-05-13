class Reception < ActiveRecord::Base

  validates_presence_of :address
  geocoded_by :address
  after_validation :geocode

  belongs_to :wedding
  has_many :rsvps
  has_many :users, through: :rsvps

end
