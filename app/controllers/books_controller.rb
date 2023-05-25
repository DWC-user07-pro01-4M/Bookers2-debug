class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
    # 応用課題９A・ここから
    # unless ReadCount.find_by(user_id: current_user.id, book_id: @book.id)
    #   current_user.read_counts.create(book_id: @book.id)
    # end
    # 応用課題９A・ここまで
  end

  def index
    @books = Book.all

    # 応用課題７Aのため記述変更「@books = Book.all」削除
    # to  = Time.current.at_end_of_day # 現在の時刻の終わりを表す
    # from  = (to - 6.day).at_beginning_of_day # to から6日前の始まりを表す
    # @books = Book.all.sort {|a,b| # すべての本を取得する Book.all に対し、 sort を用いて、以下の条件でソート
    # # b.favorites.where(created_at: from...to).size ：いいねが多い順に並ぶ
    # # favorites ： Book モデルで定義された、 has_many :favorites の関連付け
    # # where(created_at: from...to) ： from と to の期間内に作成された favorites のみを抽出
    #   b.favorites.where(created_at: from...to).size <=>
    # # a.favorites.where(created_at: from...to).size ：少ない順に並ぶ
    #   a.favorites.where(created_at: from...to).size
    # }
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :rate)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
end
