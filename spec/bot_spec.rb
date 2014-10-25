require 'bot_spec_helper'

RSpec.describe EggBot do
  context 'when a user joins' do
    before :each do
      @bot = Cinch::Bot.new
      @plugin = EggBot.new @bot

      # Fake data
      @username = 'fake_user'
      @join_message = mock_join_message(@username)
    end

    it 'creates a User if required' do
      users = User.where(:username, @username)
      expect(users.length).to eq(0)

      @plugin.user_joined(@join_message)

      expect(User.first.username).to eq(@username)
    end

    it "doesn't create a User if one exists" do
      User.create!(username: @username)

      # The user exists
      expect(User.first.username).to eq(@username)

      # The user joins the channel w/o throwing unique exception
      @plugin.user_joined(@join_message)
    end

    it 'creates a Visit if required' do

    end

    it "doesn't create a Visit when one exists" do

    end
  end
end
