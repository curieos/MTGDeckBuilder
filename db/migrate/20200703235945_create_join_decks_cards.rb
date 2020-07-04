# frozen_string_literal: true

class CreateJoinDecksCards < ActiveRecord::Migration[6.0]
  def change
    create_join_table :decks, :cards
  end
end
