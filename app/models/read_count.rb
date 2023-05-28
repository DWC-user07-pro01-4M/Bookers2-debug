class ReadCount < ApplicationRecord
  # 応用課題Aで使用
  belongs_to :user
  belongs_to :book
end
