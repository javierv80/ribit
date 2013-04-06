class RibbitsController < ApplicationController

	def index
		@ribbits = Ribbit.all :include => :user
		@ribbit = Ribbit.new
	end

	def create
		@ribbit = Ribbit.new(params[:ribbit])
		@ribbit.user_id = current_user.id

		if 
			@ribbit.save
			redirect_to ribbits_path
		else
			flash[:error] = "Ooops!"
			redirect_to current_user
		end
	end
end
