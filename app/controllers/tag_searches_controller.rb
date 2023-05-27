class TagSearchesController < ApplicationController
  # 応用課題D９から追加
  def search
    @model = Book
    @word = params[:word]
    @books = Book.where("tag LIKE?", "%#{@word}%")
    render "searches/result"
  end
end