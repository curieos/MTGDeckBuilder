# frozen_string_literal: true

class Card < ActiveRecord::Base
  validates :name, presence: true
  validates :scryfall_id, presence: true
end
