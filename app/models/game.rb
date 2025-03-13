class Game < ApplicationRecord
  has_many  :events, class_name: "Event", foreign_key: "game_id", dependent: :destroy
end
