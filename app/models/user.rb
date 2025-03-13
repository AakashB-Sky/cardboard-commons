class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # direct associations
  has_many  :hosted_events, class_name: "Event", foreign_key: "host_id", dependent: :destroy
  has_many  :friendships_as_user, class_name: "Friendship", foreign_key: "user_id", dependent: :destroy
  has_many  :friendships_as_friend, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy
  has_many  :event_join_requests, class_name: "EventJoinRequest", foreign_key: "guest_id", dependent: :destroy
  has_many  :event_invitations, class_name: "EventInvitation", foreign_key: "guest_id", dependent: :destroy
  has_many  :registrations, class_name: "EventRegistration", foreign_key: "user_id", dependent: :destroy
  has_many  :friend_requests_sent, class_name: "FriendRequest", foreign_key: "sender_id", dependent: :destroy
  has_many  :friend_requests_received, class_name: "FriendRequest", foreign_key: "recipient_id", dependent: :destroy

  # indirect associations
  has_many :friends, through: :friendships_as_user, source: :friend
  has_many :friends_inverse, through: :friendships_as_friend, source: :user
  has_many :events_attended, through: :registrations, source: :event
end
