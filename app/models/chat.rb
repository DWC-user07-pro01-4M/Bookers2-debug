class Chat < ApplicationRecord
  # 応用課題Aで使用
  belongs_to :user
  belongs_to :room
  validates :message, presence: true, length: { maximum: 140 }
end
