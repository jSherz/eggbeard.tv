require 'bot_spec_helper'

RSpec.describe EggBot do
  before :each do
    @bot = Cinch::Bot.new
    @plugin = EggBot.new @bot

    # Fake data
    @username = 'fake_user'
    @empty_message = mock_empty_message(@username)
  end

  context 'existing user' do
    before :each do
      @user = User.create!(username: @username)

      expect(User.first.username).to eq(@username)
    end

    context 'when a user joins' do
      it "doesn't create a User if one exists" do
        # Check no username taken exception thrown
        expect { @plugin.user_joined(@empty_message) }.to_not raise_error
      end

      it 'creates a Visit if required' do
        expect(Visit.where(user: @user)).to be_empty

        @plugin.user_joined(@empty_message)

        expect(Visit.where(user: @user)).to_not be_empty
      end

      it "doesn't create a Visit when one exists" do
        visit = Visit.create!(user: @user, start: DateTime.now)

        # Check we've created an active visit
        expect(@user.active_visit).to_not be_nil
        expect(@user.active_visit.end).to be_nil

        @plugin.user_joined(@empty_message)

        # Still the same last visit
        expect(@user.active_visit).to eq(visit)
      end
    end

    context 'when a user leaves' do
      it 'uses the existing User if present' do
        # The user exists
        expect(User.first.username).to eq(@username)

        # The user leaves the channel w/o throwing unique exception
        @plugin.user_parted(@empty_message)
      end

      it 'creates a Visit record if required' do
        # The user exists
        expect(User.first.username).to eq(@username)

        @plugin.user_parted(@empty_message)

        # It now has a closed visit
        expect(@user.visits.last.end).to_not be_nil

        # No active visits
        expect(@user.visits.where(end: nil).length).to eq(0)
      end
    end
  end

  context 'new user' do
    context 'when a user joins' do
      it 'creates a User if required' do
        users = User.where(:username, @username)
        expect(users.length).to eq(0)

        @plugin.user_joined(@empty_message)

        expect(User.first.username).to eq(@username)
      end
    end

    context 'when a user leaves' do
      it 'creates the User if required' do
        users = User.where(:username, @username)
        expect(users.length).to eq(0)

        @plugin.user_parted(@empty_message)

        expect(User.first.username).to eq(@username)
      end
    end
  end
end
