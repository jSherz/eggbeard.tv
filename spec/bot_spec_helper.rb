require 'rails_helper'
require './bot/bot'
require 'cinch'

# Mock a cinch user with only a nickname
def mock_user(username)
  user = instance_double(Cinch::User)
  allow(user).to receive(:nick).and_return(username)

  user
end

# Mock a cinch message with a user but no content
def mock_empty_message(username)
  message = instance_double(Cinch::Message)
  allow(message).to receive(:user).and_return(mock_user(username))

  message
end
