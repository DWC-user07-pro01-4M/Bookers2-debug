class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new

    # 応答課題７Bここから
    # # モデルbook.rbに記載した今日の投稿と機能の投稿のための記述
    # # モデルで定めたスコープ名を使用
    # # 今日
    @today_book = @books.created_today
    # 昨日
    @yesterday_book = @books.created_yesterday
    # 今週
    @this_week_book = @books.created_this_week
    # 先週
    @last_week_book = @books.created_last_week
    # 応答課題７Bここまで

    # 応用課題８Bここから
    # 7日間の投稿数を取得・空の配列を定義・配列には投稿された本の数を１日ずつ追加
    @this_week_book_counts = []
    # downtoメソッドは初期値から１ずつ減らしながら引数の値になるまで処理
    # 6.downto(0) do |n| とすることで、nに6から0までの数字を入れながら順に処理
      6.downto(0) do |n|
        @this_week_book_counts.push(@books.where(created_at: n.day.ago.all_day).count)
      end
    # 応用課題８Bここまで
  end
    # 応用課題９Bここから
    # 私の記述
    def search
      @user = User.find(params[:user_id])
      @books = @user.books
      @book = Book.new
      # if文で分岐させて空欄なら日付を選択するように表示
      if params[:created_at] == ""
        @search_book = "日付を選択してください"
      else
        create_at = params[:created_at]
        # .countメソッドで検索してヒットした本を投稿した日付の投稿数を@search_bookで定義
        @search_book = @books.where(['created_at LIKE ? ', "#{create_at}%"]).count
        render 'show'
      end
    end
    # 模範解答
      # def search
      #   user = User.find(params[:user_id])
      #   @books = user.books.where(created_at: params[:created_at].to_date.all_day)
      #   render 'search'
      # end
    # 応用課題９Bここまで

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end