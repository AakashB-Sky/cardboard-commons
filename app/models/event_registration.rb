class EventRegistration < ApplicationRecord
  # direct associatons
  belongs_to :event, required: true, class_name: "Event", foreign_key: "event_id", counter_cache: :rsvps_count
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: :registrations_count
end
