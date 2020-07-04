# frozen_string_literal: true

class DecksController < ApplicationController
  get '/decks' do
    @decks = Deck.all

    erb :'/decks/index'
  end

  get '/decks/:id' do
    @deck = Deck.find(params[:id])

    erb :'/decks/show'
  end
end
