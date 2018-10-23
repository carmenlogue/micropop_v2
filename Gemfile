source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bootstrap', '>= 4.1.2'
gem 'carrierwave'
gem 'devise'
gem 'dotenv-rails'
gem 'jquery-rails'
gem 'kaminari'
gem 'material-sass', '4.1.1'
gem 'mini_magick'
gem 'mini_racer'
gem 'select2-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'guard-rails', require: false
  gem 'guard-rspec', require: false
  gem 'guard-rubocop', require: false
  gem 'rspec-rails', '~> 3.7'
  gem 'rubocop', '~> 0.57.0', require: false
  gem 'pry-rails'
  gem 'shoulda-matchers'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
