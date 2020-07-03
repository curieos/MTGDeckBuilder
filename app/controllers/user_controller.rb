# frozen_string_literal: true

class UserController < ApplicationController
  get '/user' do
    erb :'/user/index'
  end
end
