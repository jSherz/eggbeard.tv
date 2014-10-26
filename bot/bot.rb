require 'cinch'

# IRC bot to record user visits & say hello to subscribers
class EggBot
  include Cinch::Plugin

  listen_to :connect, method: :connect
  listen_to :join, method: :user_joined
  listen_to :part, method: :user_parted

  def connect
    puts 'Connected to channel!'
    # Evaluate state of every user in channel
    # Say hello
  end

  def user_joined(m)
    user = user_for_message(m)
    user.active_visit # Create a visit if required
    # Lookup nick to see if sub
    # If sub, say hello
  end

  def user_parted(m)
    user = user_for_message(m)

    user.end_active_visit
  end

  private

  def user_for_message(message)
    User.where(username: message.user.nick).first_or_create
  end
end
