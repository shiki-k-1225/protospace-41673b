class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :ensure_correct_user, only: [:edit]

  def index
    # インデックスアクションの内容
    @prototypes = Prototype.all
  end

  def new
    # 新しい投稿フォームを表示するための処理
    @prototype = Prototype.new
  end

  def create
    # 新しい投稿を作成するための処理
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: '投稿が完了しました。'
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new # 新規コメント用のインスタンスを作成
    @comments = @prototype.comments # 紐づくコメントを取得
  end

  def destroy
    # 投稿を削除する処理を書く
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path, notice: 'プロトタイプが削除されました。'
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def ensure_correct_user
    @prototype = Prototype.find(params[:id])
    redirect_to root_path unless @prototype.user == current_user
  end
end
