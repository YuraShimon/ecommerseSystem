class UserparamsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_userparam, except:[:new,:create]

	def index
	    #if @userparam.nil?
	    	#redirect_to new_userparam_path
	    #else
	        #redirect_to userparam_path(@userparam.id)
	    #end
	end

	def show
		 @userparam = Userparam.find_by(user_id: current_user.id)
	end

	def new
		@userparam=Userparam.new
	end

	def create
		#params[:userparam][:user_id]=current_user.id
		#@userparam=Userparam.create(userparam_params)
		@userparam = current_user.build_userparam(userparams_params)
		if @userparam.save
			redirect_to userparam_path(@userparam.id)
		else
			render 'new'
		end
	end

	def edit
		@userparam = current_user.userparam
	end

	def update
		@userparam = Userparam.find_by(user_id: current_user.id)
    if @userparam.update(userparams_params)
       redirect_to userparam_path(@userparam.id)
    end
	end

	def destroy
		@userparam.destroy
		redirect_to root_path
	end

	private

	def userparams_params
		params.require(:userparam).permit(:user_id, :nickname, :firstname, :lastname, :phone, :country, :city, :age)
	end

	def get_userparam
    	@userparam = Userparam.find_by(user_id: current_user.id)
	end

	def userparam_create

 	end

end
