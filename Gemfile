source "https://rubygems.org"

# Core Rails
gem "rails"
gem "sqlite3"
gem "puma"
gem "importmap-rails"
gem "jbuilder"
gem "bcrypt"

# frontend
gem "turbo-rails"
gem "stimulus-rails"

# Asset pipeline & styling
gem "propshaft"
gem "tailwindcss-ruby"
gem "tailwindcss-rails"

# Rails infrastructure & caching
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false

# Platform-specific
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
