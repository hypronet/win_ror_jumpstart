source 'http://rubygems.org'

gem 'heroku'
gem 'rails', '3.2.5'

group :development, :test do
  gem 'sqlite3'
end

gem 'active_scaffold', '3.2.7'
gem 'devise'
gem 'cancan'
gem "eventmachine", "~> 1.0.0.beta.4.1"
gem "rack", "~> 1.4.1"
gem "daemon", "~> 1.1.0"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :production do
  gem 'thin'
  gem 'pg'
end