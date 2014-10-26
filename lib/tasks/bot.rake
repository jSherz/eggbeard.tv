require './bot/bot'

namespace :bot do
  task :start do
    bot = Cinch::Bot.new do
      configure do |c|
        c.server = Figaro.env.irc_host
        c.port = Figaro.env.irc_port
        c.nick = Figaro.env.irc_nick
        c.password = Figaro.env.irc_password
        c.channels = [Figaro.env.irc_channel]
        c.plugins.plugins = [EggBot]
      end
    end

    bot.start
  end
end
