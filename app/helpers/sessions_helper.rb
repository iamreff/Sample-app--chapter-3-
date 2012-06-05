module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end

  def signed_in?
# the following evaluation always returns true.
    !current_user.nil?
#    flash[:notice] = current_user.name
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    current_user = nil
    cookies.delete(:remember_token) 
  end
end
