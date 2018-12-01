class Room < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :participant, class_name: 'User', foreign_key: 'participant_id'

  has_many :messages #一つの部屋に複数のメッセージがもてる
end
