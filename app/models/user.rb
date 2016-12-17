class User < ApplicationRecord
  has_secure_password
  has_many :lists
  validates :password, confirmation: true,
                       length: { in: 6..20 }
  validates :user_name, exclusion: { in: %w(admin superuser) },
                      presence: true,
                      uniqueness: true,
                      length: { in: 4..20 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },
                      presence: true,
                      uniqueness: true
end
