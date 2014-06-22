class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def authenticate_user
    if session[:user_id]
      @current_user = User.find_by_id session[:user_id]
      if @current_user
        return true
      else
        redirect_to controller: 'sessions', action: 'logout'
        return false
      end
    else
      redirect_to controller: 'sessions', action: 'login'
      return false
    end
  end

  def save_login_state
    if session[:user_id]
      redirect_to(controller: 'sessions', action: 'home')
      return false
    else
      return true
    end
  end
end
