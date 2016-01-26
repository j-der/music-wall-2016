class User < ActiveRecord::Base

  has_many :songs
  has_many :upvotes

  # has_secure_password
# create a new column called password_digest
  validates :username, presence: true
  validates :password, presence: true

end
