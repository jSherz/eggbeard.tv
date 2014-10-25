require './bot/bot'

namespace :bot do
  task :start do
    Bot.new
  end
end
