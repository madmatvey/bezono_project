source 'https://rubygems.org'
ruby '2.2.4'
gem 'rails', '< 5.1'
gem 'puma'
gem 'sass-rails', '>= 5.0.6'
gem 'uglifier', '>= 1.3.0'
gem 'execjs'
# gem 'therubyracer', :platforms => :ruby
gem 'mini_racer', platforms: :ruby
gem 'coffee-rails'#, '~> 4.1.0'
gem 'coffee-script-source', '1.10.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'#, '~> 2.0'
gem 'react_webpack_rails'
gem 'jquery-dadata-rails', git: 'https://github.com/gordienko/jquery-dadata-rails.git'
gem 'datetimepicker-rails', git: 'https://github.com/zpaulovics/datetimepicker-rails.git', branch: 'master', submodules: true
gem 'momentjs-rails', '~> 2.9', git: 'https://github.com/derekprior/momentjs-rails.git'
gem 'aasm'
gem 'aasm_history'
gem 'enum_help'
gem 'wicked'
gem 'user_notif'

gem 'ahprocess'



# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'


gem 'react_on_rails', '~> 6'
# react-rails isn't compatible yet with latest Sprockets.
# https://github.com/reactjs/react-rails/pull/322
# gem 'react-rails' #, git: 'https://github.com/vipulnsward/react-rails', branch: 'sprockets-3-compat'
# # Add support to use es6 based on top of babel, instead of using coffeescript
# # gem 'sprockets-es6'
gem 'sprockets-coffee-jsx'
# DEPRECATED gem 'sprockets-coffee-react', git: 'https://github.com/raelgc/sprockets-coffee-react'
#Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.2'

group :development, :test do
  gem 'byebug'
end
group :development do
  gem 'web-console', '~> 2.0'
  gem 'meta_request'
  gem 'spring'
  gem 'rails-erd'
end
gem 'bootstrap-sass'
gem 'font-awesome-sass', '~> 4.6.2'
gem 'devise', git: 'https://github.com/plataformatec/devise.git'
gem 'psych'
gem 'haml-rails'
gem 'high_voltage'
gem 'pundit', :git => 'https://github.com/elabs/pundit.git'
gem 'simple_form'
group :development do
  # gem 'quiet_assets'
  gem 'better_errors'
  gem 'html2haml'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
end
group :development, :test do
  gem 'factory_girl_rails', :require => false
  gem 'faker'
  gem 'rspec-rails'
  gem 'sqlite3'
end

gem 'pg'
group :production do

  gem 'rails_12factor'
  gem 'unicorn'
end
group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'codeclimate-test-reporter', require: nil
end
