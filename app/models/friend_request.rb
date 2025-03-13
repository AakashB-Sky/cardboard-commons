class FriendRequest < ApplicationRecord
  # direct associations
  belongs_to :sender, required: true, class_name: "User", foreign_key: "sender_id"
  belongs_to :recipient, required: true, class_name: "User", foreign_key: "recipient_id"
end
