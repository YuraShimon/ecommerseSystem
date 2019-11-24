class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment, except: [:create]

  def create
    @comment = current_user.comments.build(comment_params)
    redirect_back(fallback_location: root_path) if @comment.save
  end

  def update
    if current_user.id == @comment.user.id
      unless @product.update(comment_params)
      end
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment.destroy if current_user.id == @comment.user.id
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :object_type, :object_id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
end
end
