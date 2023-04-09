class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates_uniqueness_of :book_id, scope: :user_id
  # 応用課題７A・本の投稿一覧ページで、過去一週間でいいねの合計カウントが多い順に投稿を表示・ここから
  has_many :favorited_users, through: :favorites, source: :user
  # 応用課題７A・ここまで
end
