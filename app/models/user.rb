require 'digest/sha1'
class User < ActiveRecord::Base
  attr_accessible :name, :email, :password
  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  validate :password_non_blank
  has_many :comments
  has_many :posts
  has_one :profile

def self.authenticate(name, password)
  user = self.find_by_name(name)
  if user
    expected_password = encrypted_password(password, user.key)
    if user.hashed_password != expected_password
      user = nil
    end
  end
  user
end

  # 'password' is a virtual attribute
def password
   @password
end

def password=(pwd)
  @password = pwd
  return if pwd.blank?
  create_new_key
  self.hashed_password = User.encrypted_password(self.password, self.key)
end

  private

def password_non_blank
  errors.add(:password, "Missing password") if hashed_password.blank?
end

def create_new_key
  self.key = self.object_id.to_s + rand.to_s
end

def self.encrypted_password(password, key)
  string_to_hash = password + "wibble" + key
  Digest::SHA1.hexdigest(string_to_hash)
end

end
