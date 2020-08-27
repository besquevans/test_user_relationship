class Follow < ApplicationRecord
  validate :do_not_follow_self
  belongs_to :follower, foreign_key: "follower_id", class_name: "User"
  belongs_to :following, foreign_key: "following_id", class_name: "User"


  private

  def do_not_follow_self
    if self.follower_id == self.following_id
      errors.add(:follower, "can't follow self")
    end
  end
end
