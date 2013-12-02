source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '3.2.15'

gem 'jquery-rails'
gem 'bootstrap-sass', '>= 3.0.0.0'
gem 'cancan'
gem 'devise'
gem 'figaro'
gem 'pg'
gem 'rolify'
gem 'simple_form'
gem 'slim'
gem 'omniauth'
# gem 'simple_contact'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'powder'
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'meta_request'
  gem 'xray-rails'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-pow'
  gem 'guard-minitest'
  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'ruby_gntp'
  gem 'haml-rails'
  gem 'haml2slim'
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
end

group :development, :test do
  gem 'pry-rails'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem "letter_opener"
  gem "email_spec"
  gem 'minitest-matchers'
  gem 'thin'
end

group :test do
  gem "minitest-rails", github: 'blowmage/minitest-rails'
  gem 'minitest-rails-capybara'
  gem 'minitest-colorize'
end

group :production do
  gem 'unicorn'
end
