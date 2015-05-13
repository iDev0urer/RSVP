class Rsvp < ActiveRecord::Base

  belongs_to :user
  belongs_to :reception

  attr_accessor :receptions

end
