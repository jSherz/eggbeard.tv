# Represents a Twitch user
class User < ActiveRecord::Base
  has_many :visits

  validates :username, presence: true
  validates_uniqueness_of :username

  def active_visit
    visits.where(end: nil).first || Visit.create!(user: self, start: DateTime.now)
  end
end
