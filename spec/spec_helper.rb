require 'spork'
# require 'spork/ext/ruby-debug'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  unless ENV['DRB']
    require 'simplecov'
    SimpleCov.start 'rails' do
      coverage_dir 'tmp/coverage'
    end
  end
  require_relative '../config/environment'
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/poltergeist'
end

Spork.each_run do
  if ENV['DRB']
    require 'simplecov'
    SimpleCov.start 'rails' do
      coverage_dir 'tmp/coverage'
    end
  end
  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec", "support", "**", "*.rb")].each &method(:require)
end

