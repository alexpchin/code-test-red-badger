source 'https://rubygems.org'
ruby '2.1.1'

gem 'haml-rails'
gem 'rails', '4.1.4'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'compass', '0.12.6'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jbuilder', '~> 2.0'
gem 'high_voltage', '~> 2.2.1'
gem 'rails_admin'

group :doc do
  gem 'sdoc', '~> 0.4.0'
end

group :production do
  gem 'rails_12factor'
  gem 'sprockets_better_errors'
end

group :test, :development do
  gem 'brakeman', :require => false
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 2.14.2'
end

group :test do
  gem 'minitest'
  gem 'spring'
  gem 'database_cleaner'
  gem 'shoulda'
  gem 'shoulda-matchers', '~> 2.5.0', require: false
  gem 'capybara'
  gem 'mocha'
end