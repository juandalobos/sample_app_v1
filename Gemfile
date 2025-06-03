source "https://rubygems.org"

gem "rails", "~> 8.0.2"
gem "puma", ">= 5.0"
gem "propshaft"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "importmap-rails"
gem "turbo-rails"
gem "will_paginate", "~> 3.3"
gem "faker", "~> 3.2"

group :development, :test do
  gem "sqlite3", ">= 2.1"
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

group :production do
  gem "pg"
end

gem "tzinfo-data", platforms: %i[windows jruby]