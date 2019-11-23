class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment,except:[:create]

  def create
		@comment = current_user.comments.build(comment_params)
    if @comment.save
     		redirect_to products_path
    end
	end

  def update
    if current_user.id == @comment.user.id
      if !@product.update(comment_params)
        #прописати повторний рендер елемента, для виводу помилки ... якщо поставив користувацьку валідацію буде не потрібним
      end
    end
    redirect_back(fallback_location: product_path)
  end

  def destroy
		if current_user.id==@comment.user.id
		    @comment.destroy
		end
		redirect_back(fallback_location: product_path)
	end

  private

	def comment_params
    params.require(:comment).permit(:user_id,:body,:object_type,:object_id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
  #def create
    #params[:comment][:product_id] = params[:product_id]
    #params[:comment][:user_id] = current_user.id
    #@comment = Comment.create(comments_params)
    #if @comment.save
      #redirect_to product_path(params[:product_id])
    #else
      #@comment.errors.full_messages.each do |msg|
       #@msg = msg
      #end
      #flash[:notice] = "#{@msg}"
      #redirect_to product_path(params[:product_id])
    #end
  #end

  #def destroy
    #params[:comment][:product_id] = params[:product_id]
    #params[:comment][:user_id] = current_user.id
    #@comment.destroy
    #redirect_to product_path(params[:product_id])
  #end

  #private
  #def comments_params
    #params.require(:comment).permit(:user_id, :product_id, :body)
  #end
end
