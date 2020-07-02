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
  end

  get '/' do
    erb :index
  end
end
