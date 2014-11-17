base_path = '/home/eggbeard/site/'
log_path = base_path + 'log/unicorn.log'

working_directory base_path + 'current/'

pid base_path + 'pids/unicorn.pid'

stderr_path log_path
stdout_path log_path

listen '/tmp/unicorn.eggbeard.sock'

worker_processes 4

timeout 30

