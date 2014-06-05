#!/bin/sh
set -e
# Example init script, this can be used with nginx, too,
# since nginx and unicorn accept the same signals

# Feel free to change any of the following variables for your app:
# Remember -E production flag for production & sudo -c "$CMD" - user so it's not run as root!
TIMEOUT=${TIMEOUT-60}
APP_ROOT=/vagrant
PID=$APP_ROOT/tmp/pids/unicorn.pid
CMD="$APP_ROOT/bin/unicorn -D -c $APP_ROOT/config/unicorn.rb -E production"
action="$1"
set -u
