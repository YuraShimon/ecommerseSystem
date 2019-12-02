class LikesController < ApplicationController
  before_action :find_object
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @object.likes.create(user_id: current_user.id)
    end
    redirect_to polymorphic_path(@object)
  end

  def destroy
    if !(already_liked?)
    flash[:notice] = "Cannot unlike"
  else
    @like.destroy
  end
  redirect_to polymorphic_path(@object)
  end

  private

  def find_object
  @object = Product.find(params[:product_id]) if params[:product_id].present?
  @object ||= Comment.find(params[:comment_id]) if params[:comment_id].present?
  end
  def already_liked?
    Like.where(user_id: current_user.id, object:
      params[:product_id]).exists?
  end
  def find_like
    @like = @object.likes.find(params[:id])
  end
end
