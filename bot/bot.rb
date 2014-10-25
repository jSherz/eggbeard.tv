require 'irc/base'

# IRC bot to record user visits & say hello to subscribers
class EggBot < IRC::Bot
  host Figaro.env.irc_host
  port Figaro.env.irc_port.to_i
  nick Figaro.env.irc_nick
  channel Figaro.env.irc_channel

  on :join do
    # Lookup nick to see if sub
    # If sub, say hello
    # If user record doesn't exist, create one
    # Start visit record if not found
    say "Hi #{nick}"
  end

  on :leave do
    # If user record doesn't exist, create one
    # If visit record not found, create one
    # Close visit record
    say "Bye #{nick}"
  end

  start!
end
