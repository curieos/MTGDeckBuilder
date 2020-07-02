# frozen_string_literal: true

class Deck < ActiveRecord::Base
  validates :name, presence: true
end
