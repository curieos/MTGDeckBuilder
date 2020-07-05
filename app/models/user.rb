# frozen_string_literal: true

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
  has_and_belongs_to_many :roles
  has_many :decks

  def in_role?(role)
    in_role = false
    roles&.each do |current_role|
      in_role = true if current_role.name == role
    end
    in_role
  end
end
