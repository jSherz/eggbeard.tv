set :rbenv_ruby, '2.1.0'

server 'dedi', user: 'eggbeard', roles: %(web app db)

# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
set :ssh_options,
    keys: %w(/home/james/.ssh/id_rsa),
    forward_agent: false,
    auth_methods: %w(publickey),
    port: 208_08
