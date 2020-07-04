# frozen_string_literal: true

class CreateJoinUsersRoles < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :roles
  end
end
