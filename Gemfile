source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.4.0"

gem "bootsnap", require: false
gem "bulma-rails", "~> 0.9.3"
gem "devise"
gem "image_processing"
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.4"
gem "puma", "~> 5.6"
gem "rails", "~> 8.0.0"
gem "rubocop", "~> 1.25"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem 'will_paginate', '~> 4.0'
gem 'will_paginate-bootstrap'

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
