#ruby '2.4.9'
#ruby '2.3.1'
#ruby '2.3.2'
#ruby '2.3.3'
#ruby '2.3.4'
#ruby '2.3.8'
#ruby '2.4.2'
#ruby '2.4.9'
#ruby '2.5.0'
#ruby '2.5.7'
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
#gem 'rails', '4.2.5.1'
#gem 'rails', '~> 4.2.10'
gem 'rails', '~> 6.0.1'

#gem 'will_paginate', '3.0.7'
gem 'will_paginate'

#gem 'bootstrap-will_paginate', '0.0.10'
gem 'bootstrap-will_paginate'

# Use postgresql as the database for Active Record
#gem 'pg', '~> 0.15'
gem 'pg', '>= 0.18', '< 2.0'

gem 'bootstrap-sass', '~> 3.3.6'
gem 'devise'
gem 'devise-bootstrapped', '~> 0.1.1'
gem 'redcarpet'

# Use Puma as the app server
gem 'puma', '~> 4.1'

gem 'newrelic_rpm'
gem 'delayed_job_active_record'
gem 'aws-sdk'

#gem 'sunspot_rails'

# Use SCSS for stylesheets
#gem 'sass-rails', '~> 5.0'
gem 'sass-rails', '>= 6'

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
#gem 'webpacker', '~> 4.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
#gem 'coffee-rails', '~> 4.1.0'
gem 'coffee-rails'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
#gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 2.0'
gem 'jbuilder', '~> 2.7'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# bundle exec rake doc:rails generates the API under doc/api.
	#gem 'sdoc', '~> 0.4.0', group: :doc

# for in-place editing of edits
gem 'best_in_place'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  #gem 'web-console', '~> 2.0'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  #gem 'sunspot_solr'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  #gem 'capybara', '>= 2.15'
  #gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  #gem 'webdrivers'
end

group :production do
  #gem 'pg', '~> 0.15'
  #gem 'rails_12factor'
end
