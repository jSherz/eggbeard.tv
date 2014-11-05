require 'rails_helper'

RSpec.describe StatsController, type: :controller do
  describe 'GET #index' do
    before :each do
      @user = User.create!(username: 'test_user')

      get :index
    end

    it 'can be accessed' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the stats template' do
      expect(response).to render_template('stats/index')
    end

    it 'gets the correct first visit' do
      expect(assigns(:first_visit)).to eq(earliest_visit)
    end

    it 'calculates the right total visit time' do
      create_visit([2014, 10, 10, 10, 0, 0], [2014, 10, 10, 10, 30, 0], @user)
      create_visit([2014, 10, 10, 9, 0, 0], [2014, 10, 10, 9, 30, 0], @user)
      create_visit([2014, 10, 11, 12, 0, 0], [2014, 10, 11, 14, 0, 0], @user)

      get :index

      expect(assigns(:total_hours_watched)).to eq(3)
    end
  end
end
