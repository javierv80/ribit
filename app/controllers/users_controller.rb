class UsersController < ApplicationController

def new
	@user = User.new
end

def create
	@user = User.new(params[:user])
	if @user.save
		session[:user_id] = @user.id
		redirect_to @user, notice: "Gracias por Registrarte!"
	else
		render 'new'
	end
end

def show
	@user = User.find(params[:id])
	@ribbit = Ribbit.new
end
end
