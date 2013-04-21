source "http://railskits.com/gems/#{ENV["RAILSKIT_ID"]}"
source "http://rubygems.org"

ruby "1.9.3"

gem "rails", "~>3.2"
gem "pg"
gem "unicorn", "~> 4.0"

gem "figaro", "~> 0.6"
gem "jquery-rails"

gem "rails3_acts_as_paranoid"
gem "ssl_requirement"

gem "saas-kit"
gem "devise-encryptable"
gem "dynamic_form"

group :development do
  gem "foreman", "~> 0.53", require: false

  # Errors
  gem "better_errors", "~> 0.0"
  gem "binding_of_caller", "~> 0.7"

  # Logging
  gem "email_spy", "~> 1.0"
  gem "better_logging", "~> 1.0"

  # Continous Testing
  gem "guard", "~> 1.4", require: false
  gem "guard-rspec", "~> 2.1"
  gem "guard-spork", "~> 1.2"
  gem "rb-fsevent", "~> 0.9", require: false
  gem "terminal-notifier-guard", "~> 1.5"

  # Debuggers
  gem "letters", "~> 0.3"
  gem "pry", "~> 0.9"
  gem "pry-rails", "~> 0.1"
  gem "pry-remote", "~> 0.1"
  gem "pry-plus", "~> 1.0"
end

group :test, :development do
  gem "mocha"
  gem "rspec-rails", "~> 2.11"
  gem "webrat"
  gem "factory_girl_rails"
  gem "faker"
end

group :test do
  gem "capybara", "~> 2.0"
  # gem "spork-rails", "~> 3.2"
  gem "poltergeist", "~> 1.1"
  gem "simplecov", "~> 0.7", require: false
  gem "database_cleaner", "~> 0.8"
end

group :assets do
  gem "coffee-rails", "~> 3.2.1"
  gem "sass-rails",   "~> 3.2.3"

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem "therubyracer"

  gem "uglifier", ">= 1.0.3"
end
