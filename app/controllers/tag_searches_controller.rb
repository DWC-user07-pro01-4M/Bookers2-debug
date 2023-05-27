class TagSearchesController < ApplicationController
  # 応用課題D９から追加
  def search
    @model = "tag"
    @content = params[:word]
    @records = Book.where("tag LIKE?", "%#{@content}%")
    render "searches/search"
  end
end