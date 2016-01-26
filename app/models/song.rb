class Song < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true
  validates :artist, presence: true
  # validates :username, presence: true

end
