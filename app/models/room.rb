class Room < ApplicationRecord
  # 応用課題Aで使用
  has_many :user_rooms
  has_many :chats
end
