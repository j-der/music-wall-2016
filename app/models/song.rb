class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :artist, presence: true
  validates :username, presence: true

end
