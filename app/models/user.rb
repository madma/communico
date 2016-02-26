class User < ActiveRecord::Base
  has_secure_password
  # Verify that an email exists and that it is unique in the db
  validates :email, presence: true, uniqueness: true
  # TODO: validate password length, etc.

  has_many :subjects, as: :taggable
  has_and_belongs_to_many :articles
end
