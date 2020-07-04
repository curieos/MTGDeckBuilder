# frozen_string_literal: true

class DecksController < ApplicationController
  get '/decks' do
    @decks = Deck.all

    erb :'/decks/index'
  end
end
