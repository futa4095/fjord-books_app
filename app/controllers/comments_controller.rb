# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :deny_other_user, only: %i[edit update destroy]

  def edit; end

  def create
    @comment = current_user.comments.build(comment_params)
    resource, id = request.path.split('/')[1, 2]
    @comment.commentable = resource.singularize.classify.constantize.find(id)
    if @comment.save
      redirect_to @comment.commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      redirect_to @comment.commentable, alert: @comment.errors.full_messages.join("\n")
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.commentable, notice: t('controllers.common.notice_update', name: Comment.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body)
  end

  def deny_other_user
    return if current_user == @comment.user

    redirect_to @comment.commentable, alert: t('controllers.common.alert_deny_edit', name: Comment.model_name.human)
  end
end
