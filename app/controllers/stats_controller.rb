# Pages that display viewer stats
class StatsController < ApplicationController
  def index
    @first_visit = get_cached('first_visit', proc { Visit.order(start: :desc).first })
    @total_hours_watched = get_cached('total_hours_watched', proc { Visit.total_hours })
    @total_users = get_cached('total_users', proc { User.count })
    @total_visits = get_cached('total_visits', proc { Visit.count })
  end

  private

  # Get a value & cache the result
  def get_cached(cache_key, proc, expiry_time = 5.minute)
    @data = Rails.cache.fetch(cache_key) || proc.call
    @data && Rails.cache.write(cache_key, @data, expires_in: expiry_time)

    @data
  end
end
