class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    @user = User.find_or_create_by(uid: auth.uid) do |user|
      user.uid = auth.uid
      user.name = auth.info.name
      user.provider = auth.provider
      user.image_link = auth.info.image
      user.link = auth.extra.raw_info.link 
    end
    check_for_updates @user
    sign_in @user
    redirect_to_back
  end

  def destroy
    sign_out
    session[:user_id] = nil
    current_user = nil
    redirect_to_back
  end
  
  private  
  def sign_in user
    @current_user = user
    session[:user_id] = user.id 
  end
  
  def sign_out
    @current_user = nil
    session[:user_id] = nil 
  end
  
   def redirect_to_back(default = root_path)
    if !request.env["HTTP_REFERER"].blank? and \
    request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back
    else
      redirect_to default
    end
  end
    
  def check_for_updates(user)
    auth = request.env["omniauth.auth"]
    user.name = auth.info.name unless user.name == auth.info.name 
    user.image_link = auth.info.image unless user.image_link == auth.info.image
    unless user.link = auth.extra.raw_info.link
      user.link = auth.extra.raw_info.link 
    end
    user.save if user.changed?
  end
end
