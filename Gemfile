# coding: utf-8
source 'http://ruby.taobao.org/'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0.beta1'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Custom Gems

# Server
# gem 'thin'
gem "puma"

# Form
gem 'simple_form', github: 'plataformatec/simple_form'

# Dynamic nested forms
gem "cocoon"

# Views
gem "haml-rails"

# Paginator
gem 'kaminari'

# Upload
gem 'carrierwave'
# gem 'carrierwave-upyun', '0.1.5'
gem 'mini_magick', require: false

# Authentication
# https://github.com/plataformatec/devise/wiki/How-Tos
gem 'devise'
# gem 'devise-encryptable'
gem 'rolify', github: 'EppO/rolify'

# Standardized Multi-Provider Authentication
gem "omniauth"
gem "omniauth-github"
gem "omniauth-baidu", github: 'liwei78/omniauth-baidu'

# session
gem 'activerecord-session_store', github: 'rails/activerecord-session_store'

# Permission
# https://github.com/ryanb/cancan
gem "cancan"

# Encrpyt the ID
# https://github.com/pencil/encrypted_id
# gem 'encrypted_id'

# Hide and restore records without actually deleting records.
gem 'paranoia', '~> 2.0'

# State Machines
# https://github.com/aasm/aasm
gem 'aasm'

# Settings solution
# gem "settingslogic"

# Exporting CSV
# https://github.com/gtd/csv_builder
# gem "csv_builder"

# Online Payment Platform
# gem 'activemerchant'
# gem 'activemerchant_patch_for_china'

# A flexible configuration system
# gem 'configurate'

# API
# gem 'grape'

# gem 'newrelic_rpm'

group :development, :test do
  gem 'spring'
  gem 'html2haml'
  gem "rspec-rails", ">= 2.12.2"
  gem "factory_girl_rails", ">= 4.2.0"
  # gem 'api_taster', '0.6.0'
  gem "quiet_assets", "~> 1.0.2"
  gem 'pry'
  gem "minitest"
end


group :test do
  gem "database_cleaner", ">= 0.9.1"
  gem "email_spec", ">= 1.4.0"
  gem "cucumber-rails", ">= 1.3.0", :require => false
  gem "launchy", ">= 2.1.2"
  gem "capybara", ">= 2.0.2"
  gem 'shoulda-matchers'
end
