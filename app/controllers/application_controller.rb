class ApplicationController < ActionController::Base
    helper_method :current_user
    include Pundit
    
    protect_from_forgery with: :exception

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    
    def current_user
        User.find(session[:user_id]) if session[:user_id] 
    end
    def logged_in?
        !!session[:user_id] 
    end
    def require_login
        redirect_to new_session_path unless logged_in?
    end 
    def user_not_authorized
        flash[:warning] = "Access denied." 
        redirect_to(request.referrer || root_path)
    end

end
