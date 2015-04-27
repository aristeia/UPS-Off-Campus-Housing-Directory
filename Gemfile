source 'https://rubygems.org'

gem 'rails', '3.2.18'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'json'

# image uploads
gem 'carrierwave'

# for authorization
gem 'omniauth'
gem 'rack-saml', '>= 0.1.1'
gem 'omniauth-shibboleth'

group :production do
	gem 'pg'
end

# image resizing
# sudo apt-get install imagemagick libmagickcore-dev imagemagick-common libmagickwand-dev libmagickcore5
gem 'rmagick'

group :test, :development do
	gem 'sqlite3'
	gem 'cucumber-rails', :require => false
	gem 'cucumber-rails-training-wheels' # some pre-fabbed step definitions
	gem 'database_cleaner' # to clear Cucumber's test database between runs
	gem 'capybara' # lets Cucumber pretend to be a web browser
	gem 'launchy' # a useful debugging aid for user stories
	gem 'rspec-rails'
	gem 'guard-rspec'
	gem 'factory_girl_rails'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'email_validator'

# admin interface
gem 'rails_admin'

# geocoder for maps
gem 'geocoder'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'


gem "devise"
