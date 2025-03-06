class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id]) # @prototypeを設定
    @comment = @prototype.comments.new(comment_params)

    if @comment.save
      redirect_to prototype_path(@comment.prototype), notice: 'コメントが投稿されました。'
    else
      render "prototypes/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
