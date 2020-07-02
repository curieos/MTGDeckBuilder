# frozen_string_literal: true

class DecksController < ApplicationController
  get '/decks' do
    erb :'/decks/index'
  end
end
