source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '6.0.3.1'

gem 'active_hash'
gem 'bcrypt'
gem 'bootsnap', require: false
gem 'haml-rails'
gem 'jbuilder'
gem 'kaminari'
gem 'meta-tags'
gem 'mysql2'
gem 'puma'
gem 'rails-i18n'
gem 'sass-rails'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rspec_junit_formatter'
end

group :development do
  gem 'listen'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
