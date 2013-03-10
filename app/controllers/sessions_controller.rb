class SessionsController < ApplicationController

  def new
    redirect_to '/auth/google'
  end


  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'], 
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    user.add_role :admin if User.count == 1 # make the first user an admin
    if user.email.blank?
      redirect_to root_url(user), :alert => "Something went wrong, sorry!"
    end
    user.create_activity :signed_in, owner: user

    redirect_to root_url, :notice => 'Signed in!'
  rescue
    redirect_to root_url(user), :alert => "Something went wrong, sorry!"
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end