# README
A Ruby on Rails application for photo galleries

Prerequisites

Ruby (version specified in .ruby-version or Gemfile)

Git

Docker (for containerized setup)

Ubuntu WSL (for Windows users doing manual setup)

# Setup Options
Option 1: Manual Setup (Windows with WSL)

Clone the repository

git clone https://github.com/MrBobbbles/technical_test.git

cd technical_test

Install dependencies

Install Ruby (if not already installed)

bundle install

Start the server

bin/rails server -p 3000

Access the application

Open your web browser

Navigate to http://localhost:3000


Option 2: Docker Setup (Recommended)

open WSL ubuntu window (tested with 24.04.1)

enable docker for that WSL

Clone and build

git clone https://github.com/MrBobbbles/technical_test.git

cd technical_test

docker build -t technical_test .

Note: Build process takes approximately 5-10 minutes

Run the container

docker run -p 3000:3000 technical_test

Access the application

Open your web browser

Navigate to http://localhost:3000


# Testing

note I could not get end to end test to work with docker

# Unit Tests

Manual Setup:

bashbin/rails test

Docker:
docker run --rm technical_test bundle exec rails test

# End-to-End Tests

Manual Setup:

Install Chromium 

sudo snap install chromium

Run system tests

bin/rails test:system

# Contact
Please contact TJ Hornsey at tj.hornsey@gmail.com
