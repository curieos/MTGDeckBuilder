# frozen_string_literal: true

class Role < ActiveRecord::Base
  validates :name, presence: true
  has_and_belongs_to_many :user
end