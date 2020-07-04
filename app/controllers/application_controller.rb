# frozen_string_literal: true

require 'sysrandom/securerandom'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, (proc { File.join(root, '../views/') })
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
    use Rack::Session::Pool, expire_after: 2_592_000 # seconds
    use Rack::Protection::RemoteToken
    use Rack::Protection::SessionHijacking
    set(:auth) do |*roles|
      condition do
        redirect '/login', 303 unless logged_in? && roles.any? { |role| current_user.in_role? role }
      end
    end
  end

  get '/' do
    erb :index
  end

  get '/login' do
    erb :'/login'
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    session[:user_id] = user.id if user&.authenticate(params[:password])

    redirect '/user'
  end

  get '/logout' do
    session.clear

    redirect '/login'
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end
