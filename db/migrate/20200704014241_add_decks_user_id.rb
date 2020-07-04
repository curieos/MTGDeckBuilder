# frozen_string_literal: true

class AddDecksUserId < ActiveRecord::Migration[6.0]
  def change
    add_column :decks, :user_id, :integer
  end
end
