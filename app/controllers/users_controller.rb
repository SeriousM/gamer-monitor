class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :user_is_admin?, :only => [:edit, :update]

  def index
    @users = User.all
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render :edit
    end
  end

	def show
    @user = User.find(params[:id])
  end
end
