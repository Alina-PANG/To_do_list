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

  before_create { generate_token(:auth_token) }

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now

    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
