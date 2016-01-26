class User < ActiveRecord::Base

  has_many :songs

  validates :username, presence: true
  validates :password, presence: true

end
