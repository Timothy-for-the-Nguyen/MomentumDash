source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

if Gem::Version.new(Bundler::VERSION) > Gem::Version.new('1.18.1')
  abort "Bundler version 1.18.1 is required"
end

ruby '2.5.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6', '>= 5.1.6.1'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use jQuery for dynamic pages
gem 'jquery-rails'

# Use Bootstrap for CSS styling
gem 'bootstrap'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  # adds database for development and testing
  gem 'sqlite3'
  # adds model and integration testing gems
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'factory_bot_rails'
  gem 'shoulda'
  gem 'shoulda-matchers'
  
  gem 'rack-test', '>=1.1.0'
  gem 'rack_session_access', '>=0.1.1'

  gem 'launchy', '>=2.4.3'
  gem 'rerun', '>=0.10.0'
  
  gem 'database_cleaner'
  
  gem 'rubocop', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'cucumber-rails-training-wheels'
  
  gem 'simplecov'
  gem 'simplecov-console'
  
  gem 'rails-controller-testing'
end

group :production do
  # Use postgress as the database for Active Record
  gem 'pg' , ' >= 1.1.3' # for Heroku deployment
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
