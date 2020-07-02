# frozen_string_literal: true

class User < ActiveRecord::Base
  validates :username, presence: true
  has_secure_password
  has_many :decks
end
