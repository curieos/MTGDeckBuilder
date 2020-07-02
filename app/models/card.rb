# frozen_string_literal: true

class Card < ActiveRecord::Base
  validates :name, presence: true
  validates :scryfall_id, presence: true
  has_and_belongs_to_many :decks
end
