class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    params[:comment][:product_id] = params[:product_id]
    params[:comment][:user_id] = current_user.id
    @comment = Comment.create(comments_params)
    if @comment.save
      redirect_to product_path(params[:product_id])
    else
      @comment.errors.full_messages.each do |msg|
       @msg = msg
      end
      flash[:notice] = "#{@msg}"
      redirect_to product_path(params[:product_id])
    end
  end

  def destroy
    params[:comment][:product_id] = params[:product_id]
    params[:comment][:user_id] = current_user.id
    @comment.destroy
    redirect_to product_path(params[:product_id])
  end

  private
  def comments_params
    params.require(:comment).permit(:user_id, :product_id, :body)

  end
end
