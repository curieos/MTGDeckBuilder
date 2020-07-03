# frozen_string_literal: true

class UserController < ApplicationController
  get '/user', auth: [:user] do
    erb :'/user/index'
  end

  get '/login' do
    erb :'/user/login'
  end

  post '/login' do
    redirect '/user'
  end
end
