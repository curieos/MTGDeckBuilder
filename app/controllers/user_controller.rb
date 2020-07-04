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

    redirect "/user/decks/#{deck.id}"
  end

  get '/user/decks/new', auth: ['user'] do
    erb :'/user/decks/new'
  end

  get '/user/decks/:id', auth: ['user'] do
    @deck = current_user.decks.find(params[:id])

    erb :'/user/decks/show'
  end

  get '/user/decks/:id/edit', auth: ['user'] do
    @deck = current_user.decks.find(params[:id])

    erb :'/user/decks/edit'
  end

  get '/user/decks/:id/add', auth: ['user'] do
    @cards = Card.where('name like ?', "%#{params[:card_name]}%").group(:name)

    erb :'/user/decks/add'
  end

  post '/user/decks/:id/add', auth: ['user'] do
    deck = current_user.decks.find(params[:id])
    deck.cards << Card.find(params[:card_id])
    deck.save

    redirect "/user/decks/#{params[:id]}/edit"
  end

  delete '/user/decks/:id/:card_id', auth: ['user'] do
    deck = current_user.decks.find(params[:id])
    card = deck.cards.find(params[:card_id])
    deck.cards.delete(card)
    deck.save

    redirect "/user/decks/#{params[:id]}/edit"
  end
end
