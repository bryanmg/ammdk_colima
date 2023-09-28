source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem "bootsnap", require: false
gem "bulma-rails", "~> 0.9.3"
gem "devise"
gem "image_processing"
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.4"
gem "puma", "~> 5.6"
gem "rails", "~> 7.0.2"
gem "rubocop", "~> 1.56"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem 'will_paginate', '~> 4.0'
gem 'will_paginate-bootstrap'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem "debug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

group :production do
  gem "aws-sdk-s3", require: false
end
