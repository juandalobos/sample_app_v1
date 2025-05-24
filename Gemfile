source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.2"

# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"

# Use sqlite3 as the database for Active Record
gem "sqlite3", ">= 2.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Use Active Model has_secure_password
gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[windows jruby]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Deploy this application anywhere as a Docker container
gem "kamal", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma
gem "thruster", require: false

# Importmap for JS asset handling in modern Rails apps
gem "importmap-rails"  # ✅ necesario para usar Turbo con Importmap
gem "turbo-rails"      # ✅ para soporte de Turbo (links con method: :delete)

# gem "image_processing", "~> 1.2" # Si usaras Active Storage

group :development, :test do
  # Debugging tools
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"

  # Static analysis for security vulnerabilities
  gem "brakeman", require: false

  # Ruby style guide
  gem "rubocop-rails-omakase", require: false
end

group :development do
  # Interactive console on error pages
  gem "web-console"
end

group :test do
  # System testing setup
  gem "capybara"
  gem "selenium-webdriver"

  # Assert template support for controller tests
  gem "rails-controller-testing"
end