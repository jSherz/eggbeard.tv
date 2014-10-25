# Represents a Twitch user
class User < ActiveRecord::Base
  has_many :visits

  validates :username, presence: true
end
