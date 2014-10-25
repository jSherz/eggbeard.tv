# Represents a Twitch user
class User < ActiveRecord::Base
  has_many :visits

  validates :username, presence: true
  validates_uniqueness_of :username
end
