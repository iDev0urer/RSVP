class Wedding < ActiveRecord::Base

  acts_as :event
  validates_presence_of :brides_name, :grooms_name

  has_many :receptions

end
