class Friendship < ApplicationRecord
  # direct associations
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: :friendships_as_user_count
  belongs_to :friend, required: true, class_name: "User", foreign_key: "friend_id", counter_cache: :friendships_as_friend_count
end
