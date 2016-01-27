class Upvote < ActiveRecord::Base
  belongs_to :song
  belongs_to :user

  validates :user_id, uniqueness: { scope: :song_id, message: "You can only upvote a song once." }

end
