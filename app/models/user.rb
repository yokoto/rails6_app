# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 100 },
                    uniqueness: { case_sensitive: false }, email: true
end
