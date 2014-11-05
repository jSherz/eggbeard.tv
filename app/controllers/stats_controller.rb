# Pages that display viewer stats
class StatsController < ApplicationController
  def index
    @first_visit = Visit.order(start: :desc).first
    @total_hours_watched = Visit.total_hours # To hours
    @total_users = User.count
    @total_visits = Visit.count
  end
end
