# frozen_string_literal: true

class UserController < ApplicationController
  get '/user', auth: ['user'] do
    @user = current_user

    erb :'/user/index'
  end

  get '/login' do
    erb :'/user/login'
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    session[:user_id] = user.id if user&.authenticate(params[:password])

    redirect '/user'
  end

  post '/logout' do
    session.clear

    redirect '/login'
  end
end
