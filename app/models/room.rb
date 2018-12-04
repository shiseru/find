class Room < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :participant, class_name: 'User', foreign_key: 'participant_id'
  # belongs_to :item

  has_many :messages #一つの部屋に複数のメッセージがもてる

  # def is_authorized?(room_id, user_id)
  #   return (Room.find(room_id).owner_id == user_id) || (Room.find(room_id).participant_id == user_id)
  # end
end
