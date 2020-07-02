# frozen_string_literal: true

require_relative './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise "Migrations are pending, run 'rake db:migrate'"
end

use Rack::MethodOverride
Dir[File.join(File.dirname(__FILE__), 'app/controllers', '*.rb')].collect do |file|
  File.basename(file).split('.')[0]
end.reject do |file|
  file == 'application_controller'
end.each do |file|
  string_class_name = file.split('_').collect(&:capitalize).join
  class_name = Object.const_get(string_class_name)
  use class_name
end
run ApplicationController
