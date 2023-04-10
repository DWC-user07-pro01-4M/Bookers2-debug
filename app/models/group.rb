class Group < ApplicationRecord
  # 応用課題７C８C９Cで使用
  has_many :group_users
  has_many :users, through: :group_users
  validates :name, presence: true
  validates :introduction, presence: true
  attachment :image, destroy: false
end
