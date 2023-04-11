class Group < ApplicationRecord
  # 応用課題７C８C９Cで使用
  # 私の記述
#   has_many :group_users
#   has_many :users, through: :group_users
#   validates :name, presence: true
#   validates :introduction, presence: true
#   has_one_attached :image
#   def get_image
#     (image.attached?) ? image : 'no_image.jpg'
#   end
# end

# 模範回答
  has_one_attached :image
  belongs_to :owner, class_name: 'User'
  has_many :group_users, dependent: :destroy

  validates :name, presence: true
  validates :introduction, presence: true

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  def is_owned_by?(user)
    owner.id == user.id
  end
end