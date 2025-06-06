FROM ruby:3.4.4

# Install dependencies: nodejs, sqlite3 client libraries
RUN apt-get update -qq && apt-get install -y \
  nodejs \
  sqlite3 \
  libsqlite3-dev \
  libvips42 \
  chromium

WORKDIR /app

# Copy Gemfiles and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the entire app code
COPY . .

# Copy the entrypoint script and make it executable
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Expose port 3000
EXPOSE 3000

# Use the entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]

# Default command runs your rails server via thrust, binding to all interfaces
CMD ["./bin/thrust", "./bin/rails", "server", "-b", "0.0.0.0"]
