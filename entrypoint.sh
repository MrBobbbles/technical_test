#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f tmp/pids/server.pid

# Run database migrations
echo "Running database migrations..."
rails db:migrate

# Execute the container's main process (CMD)
exec "$@"