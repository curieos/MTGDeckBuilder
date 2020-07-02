# frozen_string_literal: true

require 'json'

card_file = File.read('cards/default-cards-20200702050437.json')
cards_list = JSON.parse(card_file)

cards_list.each do |card|
  image_uri = card[:image_uris][:png] if card[:image_uris]
  Card.where(scryfall_id: card[:id]).first_or_create(name: card[:name], image_uri: image_uri) if image_uri
end
