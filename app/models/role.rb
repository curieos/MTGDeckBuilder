# frozen_string_literal: true

class Role < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :user
end
