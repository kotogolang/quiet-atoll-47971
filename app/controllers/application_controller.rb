class ApplicationController < ActionController::Base
  before_action :set_request_variant
  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end

  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to("/posts/index")
    end
  end


private
  def set_request_variant
    case request.user_agent
    when /iPad/
      request.variant = :phone
    when /iPhone/
      request.variant = :phone
    when /Android/
      request.variant = :phone
    end
end



end
