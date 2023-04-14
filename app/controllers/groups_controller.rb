class GroupsController < ApplicationController
  # 応用課題７C８C９Cで使用
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def index
    @book = Book.new
    @groups = Group.all
  end

  def show
    @book = Book.new
    @group = Group.find(params[:id])
  end

  # 応用課題８Cから追加ここから
  # 模範回答にはなし
  # def join
  #   @group = Group.find(params[:group_id])
  #   @group.users << current_user
  #   redirect_to groups_path
  # end
  # 応用課題８Cから追加ここまで

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id

    # 応用課題８Cから追加ここから
    # 模範回答にはなし
    # @group.users << current_user
    # 応用課題８Cから追加ここまで

    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render "edit"
    end
  end

  # 応用課題８Cから追加ここから
  # 模範回答にはなし
  # def destroy
  #   @group = Group.find(params[:id])
  #   @group.users.delete(current_user)
  #   redirect_to groups_path
  # end
  # 応用課題８Cから追加ここまで

   private

  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end

  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end

end