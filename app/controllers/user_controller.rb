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

  get '/logout' do
    session.clear

    redirect '/login'
  end

  get '/user/decks', auth: ['user'] do
    @decks = current_user.decks

    erb :'/user/decks/index'
  end

  post '/user/decks', auth: ['user'] do
    deck = Deck.create(params[:deck])
    deck.user = current_user
    deck.save

    redirect '/user/decks'
  end

  get '/user/decks/new', auth: ['user'] do
    erb :'/user/decks/new'
  end
end
