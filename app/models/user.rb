# Represents a Twitch user
class User < ActiveRecord::Base
  has_many :visits

  validates :username, presence: true
  validates_uniqueness_of :username

  def active_visit
    visits.where(end: nil).first || Visit.create!(user: self, start: DateTime.now)
  end

  def end_active_visit(end_datetime = DateTime.now)
    # Get first nil or highest end date
    visit = active_visit
    visit.end = end_datetime
    visit.save
  end
end
