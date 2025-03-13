class Event < ApplicationRecord
  # direct associations
  has_many  :event_join_requests, class_name: "EventJoinRequest", foreign_key: "event_id", dependent: :destroy
  has_many  :event_invitations, class_name: "EventInvitation", foreign_key: "event_id", dependent: :destroy
  has_many  :rsvps, class_name: "EventRegistration", foreign_key: "event_id", dependent: :destroy
  belongs_to :host, required: true, class_name: "User", foreign_key: "host_id", counter_cache: :hosted_events_count
  belongs_to :game, required: true, class_name: "Game", foreign_key: "game_id", counter_cache: true

  # indirect associations
  has_many :attendees, through: :rsvps, source: :user
end
