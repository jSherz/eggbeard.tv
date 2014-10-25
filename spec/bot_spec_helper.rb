require 'rails_helper'
require './bot/bot'
require 'cinch'

def mock_join_message(username)
  user = instance_double(Cinch::User)
  allow(user).to receive(:nick).and_return(username)

  message = instance_double(Cinch::Message)
  allow(message).to receive(:user).and_return(user)

  message
end
