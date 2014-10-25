require 'cinch'

# IRC bot to record user visits & say hello to subscribers
class EggBot
  include Cinch::Plugin

  listen_to :connect, method: :connect
  listen_to :join, method: :user_joined
  listen_to :part, method: :user_left

  def connect
    puts 'Connected to channel!'
    # Evaluate state of every user in channel
    # Say hello
  end

  def user_joined(m)
    user = User.where(username: m.user.nick).first_or_create

    unless user.active_visit
      Visit.create!(user: user, start: DateTime.now)
    end

    # Lookup nick to see if sub
    # If sub, say hello
  end

  def user_left(m)
    puts m
    # If user record doesn't exist, create one
    # If visit record not found, create one
    # Close visit record
    # see m.channel? for if user is leaving server / network
  end
end
