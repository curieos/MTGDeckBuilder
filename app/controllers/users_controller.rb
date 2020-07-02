# frozen_string_literal: true

class UsersController < ApplicationController
  get '/users' do
    erb :'/users/index'
  end
end
