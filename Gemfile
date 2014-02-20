source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.0'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
gem 'therubyrhino', platforms: :jruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Bootstrap for Rails
gem 'bootstrap-sass', '~> 3.1.1'

# Authentication
gem "devise", "~> 3.2.2"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'rspec-rails', '3.0.0.beta1'
  gem 'guard-rspec', '~> 4.2'
  gem "guard-cucumber", '~> 1.4'
  # os dependent efficient file polling
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  # show guard notifications on linux
  gem 'libnotify'
end

group :test do
  gem 'shoulda-matchers', '~> 2.5'
  gem 'factory_girl_rails', '~> 4.4'
  gem 'cucumber-rails', '~> 1.4', :require => false
  gem 'database_cleaner', '~> 1.2'
  gem 'capybara', '~> 2.2'
  #gem 'selenium-webdriver', '~> 2.39.0'
  gem "poltergeist", "~> 1.5.0"
  gem 'zeus', '~> 0.13.3'
end
