class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin!, only: [:update]

  def index
    @users = User.all
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to users_path
    end
  end

	def show
    @user = User.find(params[:id])
  end
end
