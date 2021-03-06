# frozen_string_literal: true

class UserController < ApplicationController
  get '/user', auth: ['user'] do
    @user = current_user

    erb :'/user/index'
  end

  get '/user/edit', auth: ['user'] do
    @user = current_user

    erb :'/user/edit'
  end

  patch '/user', auth: ['user'] do
    user = current_user
    user.update(username: params[:username])
    if params[:new_password]
      user.update(password: params[:new_password]) if user&.authenticate(params[:current_password])
    end

    redirect '/user'
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

  delete '/user/decks/:id', auth: ['user'] do
    deck = current_user.decks.find(params[:id])
    deck.destroy

    redirect '/user/decks'
  end

  get '/user/decks/:id/edit', auth: ['user'] do
    @deck = current_user.decks.find(params[:id])

    erb :'/user/decks/edit'
  end

  get '/user/decks/:id/add', auth: ['user'] do
    ungrouped_cards = []
    ungrouped_cards = Card.where('name ilike ?', "%#{params[:card_name]}%") if settings.environment == :production
    ungrouped_cards = Card.where('name like ?', "%#{params[:card_name]}%") if settings.environment == :development
    @cards = []
    ungrouped_cards.each do |card|
      @cards << card unless @cards.find { |c| c.name == card.name }
    end

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
