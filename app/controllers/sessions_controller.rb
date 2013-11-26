class SessionsController < ApplicationController
  include SessionsHelper
  
  def create
    auth = request.env["omniauth.auth"]
    @user = User.find_or_create_by uid: auth.uid.to_s, 
                                        provider: auth.provider do |user|
      user.name = auth.info.name
      user.image_link = auth.info.image
      user.link = auth.extra.raw_info.link 
    end
    check_for_updates @user unless @user.new_record?
    reset_session
    session[:user_id] = @user.id 
    redirect_to_back
  end

  def destroy
    session[:user_id] = nil
    redirect_to_back
  end
  
  private 
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
