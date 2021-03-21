source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

gem 'rollbar'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'rspec', '~> 3.10'
  gem 'rspec-rails', '~> 5.0.1'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem "better_errors"
  gem "binding_of_caller"
end

gem "tailwindcss-rails", "~> 0.3.3"
gem "redis", "~> 4.0"
