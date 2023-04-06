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
  # 投稿数を日付別に表示する
  # モデルのスコープ機能・scope :スコープの名前, -> { 条件式 }
  # created_todayがスコープ名。Time.zone.now.all_dayで１日を表す
  scope :created_today, -> {where(created_at: Time.zone.now.all_day)}
  # created_yesterdayがスコープ名。1.day.agoで昨日を表す
  scope :created_yesterday, -> {where(created_at: 1.day.ago.all_day)}
  # 今週
  scope :created_this_week, -> {where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day)}
  # 先週
  scope :created_last_week, -> {where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day)}
  # 過去 7 日間分、それぞれの投稿数を一覧表示・リファクタリング
  scope :created_days_ago, -> (n) {where(created_at: n.days.ago.all_day)}
  def self.past_week_count
    (1..7).map { |n| created_days_ago(n).count }.reverse
  end
  
end