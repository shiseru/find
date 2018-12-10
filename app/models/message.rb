class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :content, {presence: true, length: {maximum: 200}}
end
