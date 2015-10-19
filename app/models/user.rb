class User < ActiveRecord::Base
  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  validates_presence_of :email, :full_name, :location, :password
  validates_confirmation_of :password
  validates_length_of :bio, minumum: 20, allow_blank: false
  validates_format_of :email, with: EMAIL_REGEXP

  has_secure_password

  before_create do |user|
    user.confirmation_token = SecureRandom.urlsafe_base64
  end

  def confirm!
    return if confirmed?

    self.confirmed_at = Time.current
    self.confirmation_token = ''
  end

  def confirmed?
    confirmed_at.present?
  end
end
