class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 検索方法分岐
  def self.search_for(content, method)
    if method == 'perfect'
      Book.where(title: content)
    elsif method == 'forward'
      Book.where('title LIKE?', content + '%')
    elsif method == 'backward'
      Book.where('title LIKE?', '%' + content)
    else
      Book.where('title LIKE?', '%' + content + '%')
    end
  end
  # 投稿数を日付別に表示する方法とテーブルボードの作り方
  # 本の投稿数を数える・モデルのスコープ機能・scope :スコープの名前, -> { 条件式 }
  # created_todayがスコープ名。Time.zone.now.all_dayで１日を表す
  scope :created_today, -> {where(created_at: Time.zone.now.all_day)}
  # created_yesterdayがスコープ名。1.day.agoで昨日を表す
  scope :created_yesterday, -> {where(created_at: 1.day.ago.all_day)}
end