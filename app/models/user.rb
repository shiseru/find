class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owner_rooms, class_name: 'Room', foreign_key: 'owner_id'
  has_many :participant_rooms, class_name: 'Room', foreign_key: 'participant_id'
end
