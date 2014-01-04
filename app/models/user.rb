require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  attr_accessor :password, :password_confirmation

  has_many :rides
  has_and_belongs_to_many :parties
  # has_many :items, class_name: "Item", inverse_of: :attendee

  before_save :hash_password
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true

  def authenticate(password)
    self.hashed_password ==
    BCrypt::Engine.hash_secret(password, self.salt)
  end

  private

  def hash_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password =
      BCrypt::Engine.hash_secret(password, self.salt)
      password = password_confirmation = nil
    end
  end

end
