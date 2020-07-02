# frozen_string_literal: true

workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['SINATRA_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']        || 3000
environment ENV['SINATRA_ENV'] || 'development'

on_worker_boot do
  ActiveRecord::Base.establish_connection
end
