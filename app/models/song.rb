class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :artist, presence: true
  validates :author, presence: true

end
