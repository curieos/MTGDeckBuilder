# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'activerecord', require: 'active_record'
gem 'bcrypt'
gem 'json'
gem 'rake'
gem 'require_all'
gem 'sinatra'
gem 'sinatra-activerecord'
gem 'sysrandom'
gem 'thin'

group :production do
  gem 'pg'
  gem 'puma'
end

group :test, :development do
  gem 'capybara'
  gem 'pry'
  gem 'rack-test'
  gem 'rspec'
  gem 'sqlite3'
  gem 'tux'
end

ruby '2.6.1'
