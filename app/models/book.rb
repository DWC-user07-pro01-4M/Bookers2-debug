class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # 応用課題７A・本の投稿一覧ページで、過去一週間でいいねの合計カウントが多い順に投稿を表示・ここから
  # 私の記述
  # has_many :favorited_users, through: :favorites, source: :user

  # 模範解答
  # BookモデルがFavoriteモデルをhas_manyで関連付けている際、特定の条件に一致するFavoriteのレコードのみを抽出するためのスコープを定義
  # :week_favoritesという名前のスコープを定義,このスコープは、class_nameオプションで指定されたFavoriteモデルに対して定義
  # whereメソッドによって、条件式created_at: ((Time.current.at_end_of_day - 6.day).at_beginning_of_day)..(Time.current.at_end_of_day)に一致するFavoriteのレコードを取得
  # Timeクラスのcurrentメソッドで現在の日時を取得し、at_end_of_dayメソッドでその日の終わりの時刻を取得
  # それから、6.dayという期間を引いて、6日前の時刻を取得
  # at_beginning_of_dayメソッドでその日の始まりの時刻を取得
  # これによって、現在から6日前の1週間分の期間を表す範囲が設定
  # 最後に、この範囲に含まれるcreated_at属性の値を持つFavoriteのレコードを取得するため、範囲演算子..を使用して条件式を定義
  has_many :week_favorites, -> { where(created_at: ((Time.current.at_end_of_day - 6.day).at_beginning_of_day)..(Time.current.at_end_of_day)) }, class_name: 'Favorite'
  # 応用課題７A・ここまで

  # 応用課題９A・ここから
  has_many :read_counts, dependent: :destroy
  # 応用課題９A・ここまで

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

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

end