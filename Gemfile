# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1'
gem 'psych', '< 4'
gem 'net-smtp'
gem 'net-imap'
gem 'net-pop'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console.
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'rails-erd'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'administrate', github: 'excid3/administrate', branch: 'jumpstart'
gem 'bootstrap', '~> 4.5'
gem 'chartkick'
gem 'devise', '~> 4.7', '>= 4.7.0'
gem 'devise-bootstrapped', github: 'excid3/devise-bootstrapped', branch: 'bootstrap4'
gem 'devise_masquerade', '~> 1.2'
gem 'font-awesome-sass', '~> 5.13'
gem 'friendly_id', '~> 5.3'
gem 'groupdate'
gem 'image_processing'
gem 'mini_magick', '~> 4.10', '>= 4.10.1'
gem 'name_of_person', '~> 1.1'
gem 'omniauth-facebook', '~> 6.0'
gem 'omniauth-github', '~> 1.4'
gem 'omniauth-twitter', '~> 1.4'
gem 'pagy'
gem 'sidekiq', '~> 6.0', '>= 6.0.3'
gem 'sitemap_generator', '~> 6.1', '>= 6.1.2'
gem 'whenever', require: false
gem 'axlsx_rails'

