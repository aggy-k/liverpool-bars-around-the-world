source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.5"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "turbo_boost-elements" #, "~> VERSION"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "redis", "~> 4.0"

gem "geocoder"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

gem 'devise' #, github: 'heartcombo/devise', branch: 'ca-omniauth-2'
gem 'cancancan'
# gem 'jwt'

# Use Sass to process CSS
gem "sassc-rails"
gem "slim-rails"
gem "kaminari" # for pagination
# gem "gretel" # for breadcrumbs
gem "pretender" # to simulate login as another account
gem 'counter_culture', '~> 3.2'
# gem "pg_search"
gem "active_record_extended"
gem "acts-as-taggable-on", "~> 9.0"
# gem "acts_as_list"
gem "font-awesome-sass", "~> 6.1"


gem "view_component"

gem "blazer"
gem "ahoy_matey"
gem "table_print"
gem 'smarter_csv'
gem 'activerecord-import'
gem 'timezone', '~> 1.0'

gem "rails_admin"

gem "cloudinary"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  gem "faker"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
