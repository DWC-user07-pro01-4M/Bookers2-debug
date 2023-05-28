class UserRoom < ApplicationRecord
  # 応用課題Aで使用
  belongs_to :user
  belongs_to :room
end
