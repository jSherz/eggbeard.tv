# Represents a Twitch user being in the channel
class Visit < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :start, presence: true

  def self.total_hours
    total_secs / 3600
  end

  def self.total_secs
    Visit.select(total_secs_query).order('').first.total_secs || 0
  end

  def self.total_secs_query
    Arel.sql('EXTRACT(EPOCH FROM SUM(visits.end - visits.start))').as('total_secs')
  end
end
