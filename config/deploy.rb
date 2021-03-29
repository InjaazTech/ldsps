set :application, 'xxxx'

set :repo_url, 'git@github.com:zhazeem/xxxx.git'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false

set :pty, true

set :needed_dirs, %w(
  log tmp config tmp/pids tmp/sockets
)

set :linked_dirs, %w(
  log tmp
)

set :ssh_options, forward_agent: true