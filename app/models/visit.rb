# Represents a Twitch user being in the channel
class Visit < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :start, presence: true
end
