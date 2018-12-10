class Room < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :participant, class_name: 'User', foreign_key: 'participant_id'
  # belongs_to :item

  has_many :messages #一つの部屋に複数のメッセージがもてる

  validates :owner_id, uniqueness: {
    scope: :participant_id,
    allow_nil: true,
  }

  def is_authorized?(user_id)
    return owner_id == user_id || participant_id == user_id
  end
end
