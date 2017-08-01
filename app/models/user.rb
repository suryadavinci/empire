class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE = /\A[\d]+/
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :phone, presence: true, length: {maximum: 10},
            format: {with: VALID_PHONE}, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
end
