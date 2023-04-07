class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new

    # 応用課題９Bここから
    
    # 応用課題９Bここまで

    # 応答課題７Bここから
    # # モデルbook.rbに記載した今日の投稿と機能の投稿のための記述
    # # モデルで定めたスコープ名を使用
    # # 今日
    # @today_book = @books.created_today
    # # 昨日
    # @yesterday_book = @books.created_yesterday
    # # 今週
    # @this_week_book = @books.created_this_week
    # # 先週
    # @last_week_book = @books.created_last_week
    # 応答課題７Bここまで

    # 応用課題８Bここから
    # 7日間の投稿数を取得・空の配列を定義・配列には投稿された本の数を１日ずつ追加
    # @this_week_book_counts = []
    # # downtoメソッドは初期値から１ずつ減らしながら引数の値になるまで処理
    # # 6.downto(0) do |n| とすることで、nに6から0までの数字を入れながら順に処理
    #   6.downto(0) do |n|
    #     @this_week_book_counts.push(@books.where(created_at: n.day.ago.all_day).count)
    #   end
    # 応用課題８Bここまで
  end

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