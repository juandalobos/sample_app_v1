source "https://rubygems.org"

# Rails
gem "rails", "~> 8.0.2"

# Asset pipeline
gem "propshaft"

# Database adapters
group :development do
  gem "sqlite3", ">= 2.1"
end

group :production do
  gem "pg" # PostgreSQL para Heroku
end

# Web server
gem "puma", ">= 5.0"

# Password hashing
gem "bcrypt", "~> 3.1.7"

# Timezone support on Windows
gem "tzinfo-data", platforms: %i[windows jruby]

# Cache/queue adapters
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Performance
gem "bootsnap", require: false

# Docker support
gem "kamal", require: false

# HTTP enhancements for Puma
gem "thruster", require: false

# JavaScript (Importmap + Turbo)
gem "importmap-rails"
gem "turbo-rails"

# Pagination
gem "will_paginate", "~> 3.3"

# Fake data
gem "faker", "~> 3.2"

# DEV & TEST
group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "rails-controller-testing"
end