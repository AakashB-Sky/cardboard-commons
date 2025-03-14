class EventRegistration < ApplicationRecord
  # validation to ensure user can't register for same event multiple times
  validates(:user_id, uniqueness: { scope: :event_id })
  # direct associatons
  belongs_to :event, required: true, class_name: "Event", foreign_key: "event_id", counter_cache: :rsvps_count
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: :registrations_count
end
