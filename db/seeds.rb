# frozen_string_literal: true

require 'json'

puts 'Creating roles...'
user_role = Role.where(name: 'user').first_or_create
admin_role = Role.where(name: 'admin').first_or_create

puts 'Creating Admin User...'
admin = User.where(username: 'admin').first_or_create(password: 'password1234')
admin.roles << user_role
admin.roles << admin_role
admin.save

# puts 'Adding cards...'
# puts 'Parsing file...'
# card_file = File.read('cards/default-cards.json')
# cards_list = JSON.parse(card_file)

# puts 'Creating rows...'
# cards_list.each do |card|
#   image_uri = card['image_uris']['png'] if card['image_uris']
#   Card.where(scryfall_id: card['id']).first_or_create(name: card['name'], image_uri: image_uri) if image_uri
# end

puts 'Done'
