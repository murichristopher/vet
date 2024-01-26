#!/bin/bash
set -e

rm -f /myapp/tmp/pids/server.pid
bundle exec rails assets:precompile

exec "$@"