class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :checkAdminStatus
  helper_method :current_user


  def checkAdminStatus(user_status) 

	if user_status == "admin"
			return true;
	else
			return false;	
	end
			
  end		

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
  	redirect_to '/login' unless current_user
  end	

end
