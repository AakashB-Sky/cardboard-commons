class EventInvitation < ApplicationRecord
  # direct associations
  belongs_to :event, required: true, class_name: "Event", foreign_key: "event_id"
  belongs_to :guest, required: true, class_name: "User", foreign_key: "guest_id"
end
